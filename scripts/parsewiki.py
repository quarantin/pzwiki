#!/usr/bin/env python

import sys
import json

from os import chdir, walk
from os.path import dirname, join, realpath

chdir(dirname(realpath(__file__)))
chdir('../pzwiki/')

db = {}
for root, subdirs, files in walk('Modding/Lua Event/'):

	for f in files:
		f = join(root, f)

		db[f] = {}
		with open(f, 'r') as fd:
			data = fd.read()

		lines = data.split('\n')

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
				db[f]['description'] = line.split('=', 1)[1].strip()
				continue

			if line.startswith('|additional_info'):
				db[f]['additional_info'] = line.split('=', 1)[1].strip()
				continue

			if line.startswith('|parameter'):
				db[f]['parameters'] = []
				continue

			if line.startswith('#'):
				db[f]['parameters'].append(line[1:].strip())
				continue

			if line.startswith('|see_also'):
				db[f]['see_also'] = []
				continue

			if line.startswith('*'):
				db[f]['see_also'].append(line[1:].strip())
				continue

			if line == 'N/A':
				continue

		if 'parameters' in db[f] and not db[f]['parameters']:
			del(db[f]['parameters'])

		if 'see_also' in db[f] and not db[f]['see_also']:
			del(db[f]['see_also'])

chdir('../wiki')
for f, jsondata in db.items():
	f = f.replace('.txt', '.json')
	with open(f, 'w') as fd:
		fd.write(json.dumps(jsondata))
