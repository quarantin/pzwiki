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

db = {}
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

#for classname, dictionary in dict(db).items():
#		for key, value in dictionary.items():
#			if len(value) == 1:
#				db[classname][key] = value[0]

chdir(old_cwd)

with open('class2pkg.json', 'w') as fd:
	fd.write(json.dumps(db))
