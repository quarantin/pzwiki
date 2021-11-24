#!/usr/bin/env python

import sys
import json
from os import chdir, listdir
from os.path import dirname, isfile, join, realpath

chdir(dirname(realpath(__file__)))
chdir('..')

# workshopitems/1274178709/CNPZC/mod.info

mod_by_fileid = {}

root = 'workshopitems'
for fileid in listdir(root):
	steampath = join(root, fileid)
	for modid in listdir(steampath):
		modpath = join(steampath, modid)
		modinfo = join(modpath, 'mod.info')
		with open(modinfo, 'r') as fd:
			try:
				lines = fd.read().split('\n')
			except:
				print('ERROR', fileid, modpath, modid, file=sys.stderr)
				sys.exit()

		name = ''
		for line in lines:
			if line.startswith('name='):
				name = line.split('=', 1)[1].strip()
				break

		desc = ''
		for line in lines:
			if line.startswith('description='):
				desc += line.split('=', 1)[1].strip()

		mod_by_fileid[fileid] = {
			'name': name,
			'desc': desc,
		}

print(json.dumps(mod_by_fileid, indent='\t'))
