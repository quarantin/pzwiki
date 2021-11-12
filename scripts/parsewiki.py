#!/usr/bin/env python

import re
import sys
import json

from os import chdir, walk
from os.path import basename, dirname, join, realpath, sep

chdir(dirname(realpath(__file__)))
chdir('..')

with open('addevent.txt', 'r') as fd:
	events = [ x for x in fd.read().split('\n') if x.strip() ]

chdir('pzwiki/')

PARAMS = {
	'IsoCell':          'cell',
	'IsoGridSquare':    'square',
	'IsoObject':        'object',
	'IsoPlayer':        'player',
	'IsoGameCharacter': 'character',
	'IsoSurvivor':      'survivor',
	'IsoZombie':        'zombie',
}

def parse_name(string):
	return re.search('<pre>(.*)</pre>', string).group(1)

def parse_parameter(parameter):
	m = re.search(r'\[\[(.*)\]\]|(\?\?\?)', parameter)
	param = m.group(1) or m.group(2)
	delim = param == '???' and '???' or ']]'
	return {
		'type': param,
		'name': PARAMS.get(param, param[0].lower() + param[1:]),
		'description': parameter.split(delim)[1].strip(),
	}

def parse_see_also(see_also):
	return see_also.split('|')[1].replace(']]', '')

db = {}
for root, subdirs, files in walk('Modding/Lua Event/'):

	for f in files:
		f = join(root, f)
		title = f.replace(sep, ':', 1).replace('.txt', '')
		event = basename(f).replace('.txt', '')
		events.remove(event)

		db[title] = {}
		with open(f, 'r') as fd:
			data = fd.read()

		lines = data.split('\n')

		params = {}
		counter = 2
		for line in lines:
			if line == '':
				continue
			if line.startswith('}}'):
				continue
			if line.startswith('{{Function'):
				continue
			if line.startswith('|name'):
				db[title]['name'] = parse_name(line)
				continue
			if line.startswith('|parameter') and 'N/A' in line:
				continue
			if line.startswith('|example'):
				continue
			if line.startswith('|additional_info') and 'N/A' in line:
				continue
			if line.startswith('[[Category'):
				continue

			if line.startswith('|description'):
				db[title]['description'] = line.split('=', 1)[1].strip()
				continue

			if line.startswith('|additional_info'):
				db[title]['additional_info'] = line.split('=', 1)[1].strip()
				continue

			if line.startswith('|parameter'):
				db[title]['parameters'] = []
				continue

			if line.startswith('#'):
				param = parse_parameter(line)
				name = param['name']
				if name in params:
					param['name'] += str(counter)
					counter += 1
				db[title]['parameters'].append(param)
				params[name] = True
				continue

			if line.startswith('|see_also'):
				db[title]['see_also'] = []
				continue

			if line.startswith('*'):
				db[title]['see_also'].append(parse_see_also(line))
				continue

			#print('PROBLEM: %s %s' % (event, line))

		# Special case for OnCreateLivingCharacter which
		# can take either an IsoPlayer or an IsoSurvivor
		if event == 'OnCreateLivingCharacter':
			param = db[title]['parameters'][0]
			param['type'] = 'IsoPlayer,IsoSurvivor'
			param['name'] = 'player_or_survivor'
			param['description'] = 'The player or survivor being created.'
			db[title]['parameters'][1]['description'] = 'The description of the player or survivor being created.'

		if 'parameters' in db[title] and not db[title]['parameters']:
			del(db[title]['parameters'])

		if 'see_also' in db[title]:
			if db[title]['see_also']:
				db[title]['see_also'] = sorted(db[title]['see_also'])
			else:
				del(db[title]['see_also'])

chdir('..')
with open('events.json', 'w') as fd:
	fd.write(json.dumps(db))

"""
for f, jsondata in db.items():
	f = f.replace('.txt', '.json')
	with open(f, 'w') as fd:
		fd.write(json.dumps(jsondata))
"""
