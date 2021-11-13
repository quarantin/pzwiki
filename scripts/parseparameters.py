#!/usr/bin/env python

import json

from os import chdir, remove, rename
from os.path import dirname, isfile, join, realpath

chdir(dirname(realpath(__file__)))
chdir('..')

filename = join('data', 'json', 'savedevents.json')
with open(filename, 'r') as fd:
	savedevents = json.loads(fd.read())

filename = join('data', 'txt', 'events.txt')
with open(filename, 'r') as fd:
	events = [ x for x in fd.read().split('\n') if x.strip() ]

db = {}

output = join('data', 'json', 'parameters.json')
if isfile(output):
	with open(output, 'r') as fd:
		parametersdb = json.loads(fd.read())

	for event, parameters in parametersdb.items():
		db[event] = parameters

for event in events:
	if event not in db or not db[event]:
		if event in savedevents:
			db[event] = savedevents[event].get('parameters', [])

rename(output, output + '.old')

with open(output, 'w') as fd:
	fd.write(json.dumps(db, indent=4, sort_keys=True))

remove(output + '.old')
