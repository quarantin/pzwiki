#!/usr/bin/env python

import sys
import json

from os import chdir
from os.path import dirname, isfile, join, realpath

from wiki import Wiki

class WikiUpdater(Wiki):
	pass

if __name__ == '__main__':

	if not isfile(WikiUpdater.config_file):
		print('Can\'t find %s. Please copy the file config.json.example to config.json and edit the missing values.' % WikiUpdater.config_file)
		sys.exit(-1)

	with open(WikiUpdater.config_file, 'r') as fd:
		config = json.loads(fd.read())

	chdir(join(dirname(realpath(__file__)), 'wiki'))

	WikiUpdater(config=config).update_wiki()
