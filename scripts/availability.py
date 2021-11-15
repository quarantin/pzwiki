#!/usr/bin/env python

import json

from os import chdir
from os.path import dirname, join, realpath

chdir(dirname(realpath(__file__)))
chdir('..')

with open('config.json', 'r') as fd:
	config = json.loads(fd.read())

filename = join('data', 'txt', config['versions'][0], 'events.txt')
with open(filename, 'r') as fd:
	all_time_events = [x for x in fd.read().split('\n') if x.strip() ]

db = {}
for version in config['versions']:

	filename = join('data', 'txt', version, 'deprecated.txt')
	with open(filename, 'r') as fd:
		deprecated = [ x for x in fd.read().split('\n') if x.strip() ]

	for event in all_time_events:

		if event not in db:
			db[event] = {
				'available': [],
				'missing': [],
			}

		switch = event in deprecated and 'missing' or 'available'
		db[event][switch].append(version)

filename = join('data', 'json', 'availability.json')
with open(filename, 'w') as fd:
	fd.write(json.dumps(db, indent='\t', sort_keys=True))
