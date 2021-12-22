#!/usr/bin/env python

import json
import collections

from os import chdir, walk
from os.path import dirname, join, realpath

chdir(dirname(realpath(__file__)))
chdir('..')

with open('config.json') as fd:
	config = json.loads(fd.read())

version = config['versions'][0]
sources = join(config['source'], version, 'sources')

db = {}

for root, dirs, files in walk(sources):

	for filename in files:

		if not filename.endswith('.java'):
			continue

		source_file = join(sources, root, filename)
		with open(source_file) as fd:

			for line in fd:

				if '@LuaMethod' not in line:
					continue


				declaration = next(fd).strip() #.replace('public', '').replace('static', '').strip()
				while declaration:
					if not declaration.startswith('@'):
						break
					declaration = next(fd).strip()

				is_public = 'public ' in declaration
				is_static = 'static ' in declaration

				modifiers = []
				if is_public:
					modifiers.append('public')
					declaration = declaration.replace('public ', '')
				if is_static:
					modifiers.append('static')
					declaration = declaration.replace('static ', '')

				return_type, remaining = declaration.strip().split(' ', 1)
				method_name = remaining.split('(', 1)[0]
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
					'modifiers': modifiers,
					'parameters': parameters,
					'return': return_type,
				}

sorted_db = collections.OrderedDict(sorted(db.items(), key=lambda x: x[0].lower()))

output = join('data', 'json', 'luamethods.json')
with open(output, 'w') as fd:
	fd.write(json.dumps(sorted_db, indent='\t'))
