#!/usr/bin/env python

import json

from os import chdir, makedirs
from os.path import dirname, join, realpath

chdir(dirname(realpath(__file__)))
chdir('..')

with open('config.json', 'r') as fd:
	jsondata = json.loads(fd.read())

for version in jsondata['versions']:

	outdir = join('data', 'txt', version)
	makedirs(outdir, exist_ok=True)

	filename = join(outdir, 'addeventjava.txt')
	with open(filename, 'r') as fd:

		events = []
		for event in fd.read().split('\n'):
			if not event:
				continue
			events.append(event)

	filename = join(outdir, 'triggerevent.txt')
	with open(filename, 'r') as fd:

		triggered_event = []
		for event in fd.read().split('\n'):
			if not event:
				continue

			triggered_event.append(event.split(';')[1])

	filename = join(outdir, 'deprecated.txt')
	with open(filename, 'w') as fd:
		for event in events:
			if event not in triggered_event:
				fd.write(event + '\n')
