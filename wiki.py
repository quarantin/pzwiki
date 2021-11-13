#!/usr/bin/env python

import json
import time
import requests

from os import walk
from os.path import basename, join, sep
from urllib.parse import urljoin
from retry import retry

tries = 5

class Wiki:

	config_file = 'config.json'
	default_sleep = 0.2

	def __init__(self, config):

		target = config.get('target', {})

		self.api_path     = target.get('wiki_path', '/w/api.php')
		self.api_url      = target['wiki_url'].strip('/')
		self.descriptions = self.get_descriptions()
		self.events       = self.get_events()
		self.logged       = False
		self.javadoc_url  = config['java']['javadoc_url']
		self.obsolete     = self.get_obsolete_events()
		self.oracle_url   = config['java']['oracle_url']
		self.packages     = self.get_packages()
		self.password     = target['password']
		self.username     = target['username']
		self.saved_events = self.get_saved_events()
		self.see_also     = self.get_see_also()
		self.session      = requests.Session()

		if not self.api_url.endswith(self.api_path):
			self.api_url = urljoin(self.api_url, self.api_path)

	def error(self, jsondata):
		errorcode = jsondata['error']['code']
		errorinfo = jsondata['error']['info']
		raise Exception(errorcode + ': ' + errorinfo)

	@retry(tries=tries)
	def get_csrf_token(self):

		params = {
			'action': 'query',
			'meta':   'tokens',
			'format': 'json',
		}

		jsondata = self.session.get(self.api_url, params=params).json()
		return jsondata['query']['tokens']['csrftoken']

	def get_descriptions(self):
		with open('descriptions.json', 'r') as fd:
			return json.loads(fd.read())

	def get_events(self):
		with open('addeventjava.txt', 'r') as fd:
			return [x for x in fd.read().split('\n') if x.strip() ]

	def get_javadoc_url(self, type):


		pkg = self.packages.get(type)
		if type == '???' or not pkg:
			if type != '???':
				print('MISSING TYPE: %s %s' % (type, pkg))
			return ''

		pkg_url = pkg.replace('.', '/') + '.html'
		javadoc_url = pkg.startswith('zomb') and self.javadoc_url or self.oracle_url
		return urljoin(javadoc_url, pkg_url)

	@retry(tries=tries)
	def get_login_token(self):

		params = {
			'action': 'query',
			'meta':   'tokens',
			'type':   'login',
			'format': 'json',
		}

		jsondata = self.session.get(self.api_url, params=params).json()
		return jsondata['query']['tokens']['logintoken']

	def get_obsolete_events(self):
		with open('deprecated.txt', 'r') as fd:
			return fd.read().split('\n')

	def get_packages(self):
		with open('class2pkg.json', 'r') as fd:
			return json.loads(fd.read())

	def get_saved_events(self):
		with open('savedevents.json', 'r') as fd:
			return json.loads(fd.read())

	def get_see_also(self):
		with open('see_also.json', 'r') as fd:
			jsondata = json.loads(fd.read())

		see_also = {}
		for item in jsondata:
			for ref in item:
				see_also[ref] = item

		return see_also

	def login(self):

		data = {
			'action':     'login',
			'lgname':     self.username,
			'lgpassword': self.password,
			'lgtoken':    self.get_login_token(),
			'format':     'json',
		}

		self.session.post(self.api_url, data=data)
		self.logged = True

	def format_event_description(self, jsonevent):

		event = jsonevent['name']
		desc = jsonevent.get('description', 'TODO')
		if event in self.descriptions and self.descriptions[event]:
			desc = self.descriptions[event]

		if 'parameters' not in jsonevent:
			return desc

		for param in jsonevent['parameters']:
			name = param['name']
			type = param['type']
			desc = desc.replace('[[' + type + ']]', name).replace(type, name)

		additional_info = jsonevent.get('additional_info', '')
		return '\n'.join([desc, additional_info])

	def format_event_example(self, jsonevent):

		event = jsonevent['name']
		func = event[0].lower() + event[1:]

		output  = ''
		output += 'function ' + func + '('

		if 'parameters' in jsonevent:
			params = []
			for param in jsonevent['parameters']:
				params.append(param['name'])
			output += ', '.join(params)

		output += ')\n'
		output += '\t-- Your code here\n'
		output += 'end\n\n'
		output += 'Events.' + event + '.Add(' + func + ')'

		return '<syntaxhighlight lang="lua">' + output + '</syntaxhighlight>'

	def format_event_page(self, jsonevent):

		output  = '{{Function\n'
		output += '|name = %s\n'             % jsonevent['name']
		output += '|description = %s\n'      % self.format_event_description(jsonevent)
		output += '|parameters =\n%s\n'      % self.format_event_parameters(jsonevent)
		output += '|example =\n%s\n'         % self.format_event_example(jsonevent)
		output += '|see_also =\n%s\n'        % self.format_event_see_also(jsonevent)
		output += '}}\n\n'
		output += '[[Category:Lua Events]]\n'

		return output

	def format_event_parameters(self, jsonevent):

		if 'parameters' not in jsonevent:
			return 'No parameter.\n'

		result = []
		jsonparams = jsonevent['parameters']
		for jsonparam in jsonparams:
			desc = jsonparam.get('description', '')
			name = jsonparam['name']
			types = []
			for type in jsonparam['type'].split(','):
				desc = desc.replace('[[' + type + ']]', name)
				desc = desc.replace(type, name.replace('_', ' '))
				javadoc_url = self.get_javadoc_url(type)
				line = javadoc_url and '[%s %s]' % (javadoc_url, type) or '[[Modding:Lua Events/%s|%s]]' % (type, type)
				types.append(line)
			type = ' {{!}} '.join(types)
			result.append('* %s %s' % (type, desc))

		return '\n'.join(result)

	def format_event_see_also(self, jsonevent):

		result = []
		name = jsonevent['name']

		if name not in self.see_also or not self.see_also[name]:
			return 'No related event.'

		for see_also in self.see_also[name]:
			if see_also != name:
				result.append('* [[Modding:Lua Events/%s|%s]]' % (see_also, see_also))

		return '\n'.join(result)

	@retry(tries=tries)
	def edit_page(self, title, wikitext):

		print(title)

		if not self.logged:
			self.login()

		data = {
			'action': 'edit',
			'title':  title,
			'token':  self.get_csrf_token(),
			'format': 'json',
			'text':   wikitext,
		}

		jsondata = self.session.post(self.api_url, data=data).json()
		if jsondata.get('edit', {}).get('result') != 'Success':
			self.error(jsondata)

		time.sleep(self.default_sleep)

	@retry(tries=tries)
	def delete_page(self, title):

		print(title)

		if not self.logged:
			self.login()

		data = {
			'action': 'delete',
			'title':  title,
			'token':  self.get_csrf_token(),
			'format': 'json',
		}

		jsondata = self.session.post(self.api_url, data=data).json()
		if not jsondata.get('delete'):
			err = 'The page you specified doesn\'t exist.'
			if jsondata['error']['info'] == err:
				print('Page Missing!')
			else:
				self.error(jsondata)

		time.sleep(self.default_sleep)

	def update_events(self):

		jsondata = dict(self.saved_events)

		for event in self.events:
			if event not in jsondata:
				jsondata[event] = {
					'name': event,
					'title': 'Modding:Lua Events/' + event,
				}

		for _, jsonevent in sorted(jsondata.items()):
			wikitext = self.format_event_page(jsonevent)
			self.edit_page(jsonevent['title'], wikitext)
