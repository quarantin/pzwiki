#!/usr/bin/env python

import sys
import json
import time
import requests

from os import chdir, walk
from os.path import join, dirname, isfile, realpath, sep
from urllib.parse import urljoin

class WikiUpdater:

	config_file = 'config.json'

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

		self.update_wiki()

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


	def edit_page(self, title, filepath):

		print(title.replace(sep, ':', 1))

		if not self.logged:
			self.login()

		with open(filepath, 'r') as fd:
			text = fd.read()

		data = {
			'action': 'edit',
			'title':  title.replace(sep, ':', 1),
			'token':  self.get_csrf_token(),
			'format': 'json',
			'text':   text,
		}

		jsondata = self.session.post(self.api_url, data=data).json()
		if jsondata.get('edit', {}).get('result') != 'Success':
			errorcode = jsondata['error']['code']
			errorinfo = jsondata['error']['info']
			raise Exception(errorcode + ': ' + errorinfo)

	def update_wiki(self, root='.'):

		for root, subdirs, files in walk(root):

			if root == '.':
				continue

			root = root[2:]

			for filename in files:
				title = sep.join([root, filename.replace('.json', '')])
				filepath = join(root, filename)
				self.edit_page(title, filepath)
				time.sleep(0.2)


if __name__ == '__main__':

	if not isfile(WikiUpdater.config_file):
		print('Can\'t find %s. Please copy the file config.json.example to config.json and edit the missing values.' % WikiUpdater.config_file)
		sys.exit(-1)

	with open(WikiUpdater.config_file, 'r') as fd:
		config = json.loads(fd.read())

	chdir(join(dirname(realpath(__file__)), 'wiki'))

	WikiUpdater(config=config)
