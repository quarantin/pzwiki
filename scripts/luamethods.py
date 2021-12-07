#!/usr/bin/env python

import json

from os import chdir
from os.path import dirname, join, realpath

chdir(dirname(realpath(__file__)))
chdir('..')

with open('config.json') as fd:
	config = json.loads(fd.read())

version = config['versions'][0]
source = join(config['source'], version)

db = {}
lua_manager = join(source, 'zombie/Lua/LuaManager.java')
with open(lua_manager) as fd:

	for line in fd:
		if '@LuaMethod' not in line:
			continue

		method_name = line.split('"')[1]
		lua_method = next(fd).replace('public', '').replace('static', '').strip()

		return_type, remaining = lua_method.split(' ', 1)
		params = remaining.split('(', 1)[1]
		params = [ x.strip() for x in params.replace(')', '').replace('{', '').strip().split(',') ]
		parameters = []	
		for param in params:

			if param:

				param_type, param_name = param.split(' ', 1)

				parameters.append({
					'name': param_name,
					'type': param_type,
					'description': 'TODO',
				})

		db[method_name] = {
			'description': 'TODO',
			'parameters': parameters,
			'return': return_type,
		}

output = join('data', 'json', 'luamethods.json')
with open(output, 'w') as fd:
	fd.write(json.dumps(db, indent='\t', sort_keys=True))
