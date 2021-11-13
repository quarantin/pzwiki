#!/usr/bin/env python

import json

from os import chdir
from os.path import dirname, realpath

chdir(dirname(realpath(__file__)))
chdir('..')

with open('savedevents.json', 'r') as fd:
	savedevents = json.loads(fd.read())

with open('addevent.txt') as fd:
	events = [ x for x in fd.read().split('\n') if x.strip() ]

db = {}

for event in events:
	db[event] = event in savedevents and savedevents[event]['description'] or 'TODO'

with open('descriptions.json', 'w') as fd:
	fd.write(json.dumps(db, indent=4))
