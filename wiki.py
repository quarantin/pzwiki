#!/usr/bin/env python

import json
import time
import requests

from os import walk
from os.path import basename, join, sep
from urllib.parse import urljoin

class Wiki:

	config_file = 'config.json'
	default_sleep = 0.2

	def __init__(self, config):

		target = config.get('target', {})

		self.api_path = target.get('wiki_path', '/w/api.php')
		self.api_url  = target['wiki_url'].strip('/')
		self.logged   = False
		self.password = target['password']
		self.username = target['username']
		self.session  = requests.Session()

		if not self.api_url.endswith(self.api_path):
			self.api_url = urljoin(self.api_url, self.api_path)

	def error(self, jsondata):
		errorcode = jsondata['error']['code']
		errorinfo = jsondata['error']['info']
		raise Exception(errorcode + ': ' + errorinfo)

	def get_login_token(self):

		params = {
			'action': 'query',
			'meta':   'tokens',
			'type':   'login',
			'format': 'json',
		}

		jsondata = self.session.get(self.api_url, params=params).json()
		return jsondata['query']['tokens']['logintoken']

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

	def get_csrf_token(self):

		params = {
			'action': 'query',
			'meta':   'tokens',
			'format': 'json',
		}

		jsondata = self.session.get(self.api_url, params=params).json()
		return jsondata['query']['tokens']['csrftoken']


	def format_event_page(self, title, jsondata):

		name = basename(title)
		output  = '{{Function\n'
		output += '|name = %s\n' % name
		output += '|description = %s\n' % jsondata['description']
		output += '|parameters = '

		if 'parameters' not in jsondata:
			output += 'No parameter.\n'
		else:
			output += '\n'
			for param in jsondata['parameters']:
				output += '* %s\n' % param

		output += '|example = %s\n' % jsondata.get('example', 'TODO')
		output += '|additional_info = %s\n' % jsondata.get('additional_info', 'No additional information.')
		output += '|see_also = '
		if 'see_also' not in jsondata:
			output += 'No reference.\n'
		else:
			output += '\n'
			for see_also in jsondata['see_also']:
				output += '* %s\n' % see_also

		output += '}}\n\n'
		output += '[[Category:Lua Event]]\n'

		return output

	def edit_page(self, title, filepath):

		print(title)

		if not self.logged:
			self.login()

		with open(filepath, 'r') as fd:
			text = fd.read()

		if filepath.endswith('.json'):
			text = self.format_event_page(title, json.loads(text))

		data = {
			'action': 'edit',
			'title':  title,
			'token':  self.get_csrf_token(),
			'format': 'json',
			'text':   text,
		}

		jsondata = self.session.post(self.api_url, data=data).json()
		if jsondata.get('edit', {}).get('result') != 'Success':
			self.error(jsondata)

		time.sleep(self.default_sleep)

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

	def update_wiki(self, root='.'):

		for root, subdirs, files in walk(root):

			if root == '.':
				continue

			root = root[2:]

			for filename in files:
				title = sep.join([root, filename.replace('.json', '').replace('.txt', '')]).replace(sep, ':', 1)
				filepath = join(root, filename)
				self.edit_page(title, filepath)
