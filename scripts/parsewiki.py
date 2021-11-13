#!/usr/bin/env python

import re
import sys
import json

from os import chdir, walk
from os.path import basename, dirname, join, realpath, sep

chdir(dirname(realpath(__file__)))
chdir('..')

with open('deprecated.txt', 'r') as fd:
	deprecated = [ x for x in fd.read().split('\n') if x.strip() ]

chdir('pzwiki')

names = {
	'IsoCell':          'cell',
	'IsoGridSquare':    'square',
	'IsoObject':        'object',
	'IsoPlayer':        'player',
	'IsoGameCharacter': 'character',
	'IsoSurvivor':      'survivor',
	'IsoZombie':        'zombie',
}

def parse_parameter(parameter):
	m = re.search(r'\[\[(.*)\]\]|(\?\?\?)', parameter)
	param = (m.group(1) or m.group(2)).split('|')[0]
	delim = param == '???' and '???' or ']]'
	return {
		'type': param,
		'name': names.get(param, param[0].lower() + param[1:]),
		'description': parameter.split(delim)[1].strip(),
	}

def parse_see_also(see_also):
	return see_also.split('|')[1].replace(']]', '')

db = {}
for root, subdirs, files in walk('Modding' + sep + 'Lua Event'):

	for f in files:
		f = join(root, f)
		name = basename(f).replace('.txt', '')
		title = f.replace(sep, ':', 1).replace('Event', 'Events').replace('.txt', '')

		db[name] = {
			'name': name,
			'title': title,
			'obsolete': name in deprecated,
		}

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
				db[name]['description'] = line.split('=', 1)[1].strip()
				continue

			if line.startswith('|additional_info'):
				db[name]['additional_info'] = line.split('=', 1)[1].strip()
				continue

			if line.startswith('|parameter'):
				db[name]['parameters'] = []
				continue

			if line.startswith('#'):
				param = parse_parameter(line)
				paramname = param['name']
				if paramname in params:
					param['name'] += str(counter)
					counter += 1
				db[name]['parameters'].append(param)
				params[name] = True
				continue

			if line.startswith('|see_also'):
				db[name]['see_also'] = []
				continue

			if line.startswith('*'):
				db[name]['see_also'].append(parse_see_also(line))
				continue

			#print('PROBLEM: %s %s' % (name, line))

		# Special case for OnCreateLivingCharacter which
		# can take either an IsoPlayer or an IsoSurvivor
		if name == 'OnCreateLivingCharacter':
			db[name]['description'] = 'Called when a player or survivor is being created.'
			param = db[name]['parameters'][0]
			param['type'] = 'IsoPlayer,IsoSurvivor'
			param['name'] = 'playerOrSurvivor'
			param['description'] = 'The player or survivor being created.'
			db[name]['parameters'][1]['description'] = 'The description of the player or survivor being created.'

		if 'additional_info' in db[name] and not db[name]['additional_info']:
			del(db[name]['additional_info'])

		if 'parameters' in db[name] and not db[name]['parameters']:
			del(db[name]['parameters'])

		if 'see_also' in db[name]:
			if db[name]['see_also']:
				db[name]['see_also'] = sorted(db[name]['see_also'])
			else:
				del(db[name]['see_also'])

chdir('..')
with open('savedevents.json', 'w') as fd:
	fd.write(json.dumps(db))
