#!/usr/bin/env python

import sys
import json

from os import chdir
from os.path import dirname, isfile, realpath, sep

from wiki import Wiki

class WikiDeleter(Wiki):
	pass

if __name__ == '__main__':

	if not isfile(WikiDeleter.config_file):
		print('Can\'t find %s. Please copy the file config.json.example to config.json and edit the missing values.' % WikiDeleter.config_file)
		sys.exit(-1)

	with open(WikiDeleter.config_file, 'r') as fd:
		config = json.loads(fd.read())

	chdir(dirname(realpath(__file__)))

	if len(sys.argv) < 2:
		print('Usage: %s <list.txt>' % sys.argv[0])
		sys.exit(-1)

	deleter = WikiDeleter(config=config)
	with open(sys.argv[1], 'r') as fd:
		titles = fd.read().strip().split('\n')
		for title in titles:
			deleter.delete_page(title)
