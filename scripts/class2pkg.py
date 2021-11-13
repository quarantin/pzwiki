#!/usr/bin/env python

import json

from os import chdir, getcwd, walk
from os.path import basename, dirname, realpath, sep

chdir(dirname(realpath(__file__)))
chdir('..')
old_cwd = getcwd()

with open('config.json', 'r') as fd:
	jsondata = json.loads(fd.read())

ignored_packages = jsondata['java']['ignored_packages']

chdir(jsondata['java']['root'])

db = {
	# Primitive types
	'Boolean': 'java.lang.Boolean',
	'Double':  'java.lang.Double',
	'Float':   'java.lang.Float',
	'Integer': 'java.lang.Integer',
	'String':  'java.lang.String',
}

for root, subdirs, files in walk('.'):
	root = root[2:].replace(sep, '.')
	pkg = root.split('.')[0]
	if pkg in ignored_packages:
		continue

	for f in files:
		if not f.endswith('.java'):
			continue
		f = f.replace('.java', '')
		db[f] = root + '.' + f

# Zomboid inner classes
db['Perk'] = 'zombie.characters.skills.PerkFactory.Perk'
db['Perks'] = 'zombie.characters.skills.PerkFactory.Perks'

chdir(old_cwd)

with open('class2pkg.json', 'w') as fd:
	fd.write(json.dumps(db, sort_keys=True))
