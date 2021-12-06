#!/usr/bin/env python

# TODO Handle throttling
# TODO Handle server side
# TODO Handle settings:
# - enable/disable printing for each event
# - throttle value for each event
# - r, g, b of spoken message
# - how the character should pronounce events (whisper, normal, shouting, halo)
# - whether the character should pronounce the events (globally)
# - whether the character should pronounce the events (per event)
# - whether the mod should be enabled when not running in debug mode
# - button to reinitialize mod settings

import json

from os import chdir, makedirs
from os.path import dirname, realpath

chdir(dirname(realpath(__file__)))
chdir('..')

mod_id = 'DebugLuaEvents'

invalid = [
	'Attack',
	'AutoDrink',
	'CalculateStats',
	'OnPlayerCancelTimedAction',
	'OnUseVehicle',
	'OnVehicleHorn',
	'UseItem',
	'WeaponHitCharacter',
	'WeaponSwing',
	'WeaponSwingHitPoint',
]

throttled = [
	'EveryOneMinute',
	'LoadGridsquare',
	'OnAIStateChange',
	'OnCharacterCollide',
	'OnClimateTick',
	'OnClimateTickDebug',
	'OnContainerUpdate',
	'OnCustomUIKey',
	'OnCustomUIKeyPressed',
	'OnCustomUIKeyReleased',
	'OnDeviceText',
	'OnFETick',
	'OnFillContainer',
	'OnJoypadRenderUI',
	'OnKeyPressed',
	'OnKeyKeepPressed',
	'OnKeyStartPressed',
	'OnObjectCollide',
	'OnPostFloorLayerDraw',
	'OnPostRender',
	'OnPostUIDraw',
	'OnPreUIDraw',
	'OnMouseMove',
	'onNPCSurvivorUpdate',
	'OnPlayerMove',
	'OnPlayerUpdate',
	'OnRefreshInventoryWindowContainers',
	'OnRenderTick',
	'OnRenderUpdate',
	'ReuseGridsquare',
	'OnTick',
	'OnTickEvenPaused',
	'OnZombieUpdate',
]

def get_param_name(param):

	name = param.get('name')
	if name:
		return name

	name = param.get('type')
	if not name:
		return ''

	name = name.split('.')[-1]
	if name == 'IsoGameCharacter':
		name = 'Character'

	elif name == 'IsoGridSquare':
		name = 'Square'

	elif name.startswith('Iso'):
		name = name[3:]

	return name[0].lower() + name[1:]

def generate_param_table(args):

	code = ''

	if not args:
		return code

	code += '\n'

	for arg in args:
		code += '\t\t\t\t{ name = "%s", value = %s },\n' % (arg, arg)

	return code + '\t\t'

def write_config(fd):

	code = \
"""return function(folder)

	local config = {}

	config.lineEnding = "\\n"

	config.speakType = "normal"

	config.speakEvents = true

	config.output = getFileOutput("DebugLuaEvents.txt")

	config.doPrintToFile = true

	config.doPrintToConsole = true

	config.print = function(message, prefix)

		if config.doPrintToFile then
			config.output:writeChars(message .. config.lineEnding)
		end

		if config.doPrintToConsole then
			prefix = prefix or '  # '
			print(prefix .. message)
		end
	end

	config.debug = function(event, params)

		if config.disabled[event] ~= nil then
			return
		end

		if config.throttled[event] ~= nil then
			return
		end

		config.print(event .. " (" .. (folder:gsub("^%l", string.upper)) .. " side)")

		for i, param in ipairs(params) do
			config.print("  - param: " .. param.name .. " = " .. tostring(param.value))
		end

		config.print('', '')

		if not config.speakEvents then
			return
		end

		local player = getPlayer()
		if not player then
			return
		end

		if config.speakType == "normal" then
			player:Say(event)

		elseif config.speakType == "halo" then
			player:setHaloNote(event)

		elseif config.speakType == "whisper" then
			player:SayShout(event)

		elseif config.speakType == "shout" then
			player:SayWhisper(event)
		end
	end

	config.disabled = {}

	config.throttled = {
"""

	for event in throttled:
		code += '\t\t%s = true,\n' % event

	code += """\t}

	return config
end
"""
	fd.write(code)

def write_callback(fd, event, jsonevent):

	args = []

	for param in jsonevent['parameters'] or []:

		arg = get_param_name(param)
		if not arg:
			print('Missing type for event ' + event)
			continue

		args.append(arg)

	code = \
"""
		-- %s
		--
		-- %s
		-- https://pzwiki.net/wiki/Modding:Lua_Events/%s
		%s = function (%s)
			config.debug("%s", {""" % (event, jsonevent['description'], event, event, ', '.join(args), event)

	code += generate_param_table(args)

	code += """	})
		end,
"""
	fd.write(code)

def write_register_callback(fd, event):
	fd.write('\tEvents.%s.Add(callbacks.%s)\n' % (event, event))

def create_folders(folder):
	dirpath = 'mods/%s/media/lua/%s/%s/' % (mod_id, folder, mod_id)
	makedirs(dirpath, exist_ok=True)

def write_mod_info():
	output = 'mods/%s/mod.info' % mod_id
	with open(output, 'w') as fd:

		output = \
"""name=Debug Lua Events
id=DebugLuaEvents
description=A simple mod to help understand when each Lua event is triggered.
poster=poster.png
"""
		fd.write(output)

def write_configs(folder):

	output = 'mods/%s/media/lua/%s/%s/%s_Config.lua' % (mod_id, folder, mod_id, mod_id)
	with open(output, 'w') as fd:
		write_config(fd)

def write_callbacks(folder, events):

	output = 'mods/%s/media/lua/%s/%s/%s_Callbacks.lua' % (mod_id, folder, mod_id, mod_id)
	with open(output, 'w') as fd:
		fd.write('return function(folder)\n\n')
		fd.write('\tlocal config = require("DebugLuaEvents/DebugLuaEvents_Config")(folder)\n\n')
		fd.write('\treturn {\n')
		for event, jsonevent in events.items():
			if event not in invalid:
				write_callback(fd, event, jsonevent)
		fd.write('\t}\n')
		fd.write('end\n')

def write_register_callbacks(folder, events):

	output = 'mods/%s/media/lua/%s/%s/%s_Register.lua' % (mod_id, folder, mod_id, mod_id)
	with open(output, 'w') as fd:
		fd.write('return function(folder)\n\n')
		fd.write('\tlocal callbacks = require("DebugLuaEvents/DebugLuaEvents_Callbacks")(folder)\n\n')
		for event in events:
			if event not in invalid:
				write_register_callback(fd, event)
		fd.write("end\n")

def write_main(folder):

	output = 'mods/%s/media/lua/%s/%s/%s_%s.lua' % (mod_id, folder, mod_id, mod_id, folder.title())
	with open(output, 'w') as fd:
		code = 'require("%s/%s_Register")("%s")\n' % (mod_id, mod_id, folder)
		fd.write(code)

with open('data/json/events.json') as fd:
	events = json.loads(fd.read())

create_folders('client')
create_folders('server')
create_folders('shared')

write_mod_info()

write_configs('shared')
write_callbacks('shared', events)
write_register_callbacks('shared', events)
write_main('client')
write_main('server')
