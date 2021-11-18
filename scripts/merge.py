#!/usr/bin/env python

import json

from os import chdir
from os.path import dirname, join, realpath

chdir(dirname(realpath(__file__)))
chdir('..')

filename = join('data', 'json', 'descriptions.json')
with open(filename, 'r') as fd:
	descriptions = json.loads(fd.read())


filename = join('data', 'json', 'parameters.json')
with open(filename, 'r') as fd:
	parameters = json.loads(fd.read())

merge = {}

for event, description in dict(descriptions).items():

	if event not in parameters:
		raise Exception('Missing parameters for event: ' + event)

	merge[event] = {}
	merge[event]['description'] = description
	merge[event]['parameters'] = parameters[event]
	del(parameters[event])

if parameters:
	for event in parameters:
		print('Unhandled event ' + event)
	raise Exception('Unhandled events found!')

filename = join('data', 'json', 'events.json')
with open(filename, 'w') as fd:
	fd.write(json.dumps(merge, indent='\t', sort_keys=True))
