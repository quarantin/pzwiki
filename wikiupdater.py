#!/usr/bin/env python

import sys
import json
import requests

from os import chdir, walk
from os.path import join, dirname, realpath
from urllib.parse import urljoin

class WikiUpdater:

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


	def edit_wiki(self, title, filepath):

		print(title.replace('/', ':', 1))

		if not self.logged:
			self.login()

		with open(filepath, 'r') as fd:
			text = fd.read()

		data = {
			'action': 'edit',
			'title':  title.replace('/', ':', 1),
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
				title = '/'.join([root, filename.replace('.txt', '')])
				filepath = join(root, filename)
				self.edit_wiki(title, filepath)


if __name__ == '__main__':

	if len(sys.argv) < 2:
		print('Usage: %s <config.json>' % sys.argv[0])
		sys.exit(-1)

	with open(sys.argv[1], 'r') as fd:
		config = json.loads(fd.read())

	chdir(join(dirname(realpath(__file__)), 'wiki'))

	WikiUpdater(config=config)
