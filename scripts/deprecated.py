#!/usr/bin/env python

from os import chdir
from os.path import dirname, realpath

chdir(dirname(realpath(__file__)))
chdir('..')

with open('addeventjava.txt', 'r') as fd:

	events = []
	for event in fd.read().split('\n'):
		if not event:
			continue
		events.append(event)

with open('triggerevent.txt', 'r') as fd:

	triggered_event = []
	for event in fd.read().split('\n'):
		if not event:
			continue

		triggered_event.append(event.split(';')[1])

with open('deprecated.txt', 'w') as fd:
	for event in events:
		if event not in triggered_event:
			fd.write(event + '\n')
