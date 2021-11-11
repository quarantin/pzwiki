#!/usr/bin/env python

import sys
import json
import time
import requests

from os import chdir, makedirs, walk
from os.path import join, dirname, realpath
from urllib.parse import urljoin
from urllib.parse import urlencode

class WikiScraper:

	def __init__(self, config):

		source          = config.get('source', {})
		self.api_path   = source.get('wiki_path', '/w/api.php')
		self.api_url    = source['wiki_url'].strip('/')
		self.namespaces = source.get('namespaces', [])

		if not self.namespaces:
			raise Exception('Please specify a list of namespaces to scrap in your config.json')

		if not self.api_url.endswith(self.api_path):
			self.api_url = urljoin(self.api_url, self.api_path)

		self.scrap_wiki()

	def read_wiki(self, title, save=False):

		print(title)

		params = {
			'action': 'parse',
			'prop':   'wikitext',
			'page':   title,
			'format': 'json',
		}

		jsondata = requests.get(self.api_url, params=params).json()

		if save and jsondata.get('parse'):
			filepath = title.replace(':', '/') + '.txt'
			filedir = dirname(filepath)
			makedirs(filedir, exist_ok=True)
			with open(filepath, 'w') as fd:
				fd.write(jsondata['parse']['wikitext']['*'])

		return jsondata

	def parse_links(self, jsondata):

		wikitext = jsondata['parse']['wikitext']['*']
		lines = wikitext.split('\n')
		for line in lines:
			title, _ = line.strip('*').strip('[').strip(']').strip().split('|')
			self.read_wiki(title, save=True)
			time.sleep(0.2)

	def scrap_wiki(self):

		for namespace in self.namespaces:
			jsondata = self.read_wiki(namespace)
			self.parse_links(jsondata)

if __name__ == '__main__':

	if len(sys.argv) < 2:
		print('Usage: %s <config.json>' % sys.argv[0])
		sys.exit(-1)

	with open(sys.argv[1], 'r') as fd:
		config = json.loads(fd.read())

	chdir(join(dirname(realpath(__file__)), 'wiki'))

	WikiScraper(config=config)
