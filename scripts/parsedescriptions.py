#!/usr/bin/env python

import json

from os import chdir, remove, rename
from os.path import dirname, isfile, join, realpath

chdir(dirname(realpath(__file__)))
chdir('..')

filename = join('data', 'json', 'savedevents.json')
with open(filename, 'r') as fd:
	savedevents = json.loads(fd.read())

filename = join('data', 'txt', 'addeventjava.txt')
with open(filename, 'r') as fd:
	javaevents = [ x for x in fd.read().split('\n') if x.strip() ]

filename = join('data', 'txt', 'addeventlua.txt')
with open(filename, 'r') as fd:
	luaevents = [ x for x in fd.read().split('\n') if x.strip() ]

db = {}

output = join('data', 'json', 'descriptions.json')
if isfile(output):
	with open(output, 'r') as fd:
		descriptions = json.loads(fd.read())

	for event, description in descriptions.items():
		db[event] = description

for event in javaevents + luaevents:
	if event not in db:
		db[event] = event in savedevents and savedevents[event]['description'] or ''


rename(output, output + '.old')

with open(output, 'w') as fd:
	fd.write(json.dumps(db, indent=4, sort_keys=True))

remove(output + '.old')
