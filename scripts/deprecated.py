#!/usr/bin/env python

from os import chdir
from os.path import dirname, join, realpath

chdir(dirname(realpath(__file__)))
chdir('..')

filename = join('data', 'txt', 'addeventjava.txt')
with open(filename, 'r') as fd:

	events = []
	for event in fd.read().split('\n'):
		if not event:
			continue
		events.append(event)

filename = join('data', 'txt', 'triggerevent.txt')
with open(filename, 'r') as fd:

	triggered_event = []
	for event in fd.read().split('\n'):
		if not event:
			continue

		triggered_event.append(event.split(';')[1])

filename = join('data', 'txt', 'deprecated.txt')
with open(filename, 'w') as fd:
	for event in events:
		if event not in triggered_event:
			fd.write(event + '\n')
