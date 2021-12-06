return function(folder)

	local config = {}

	config.lineEnding = "\n"

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
		EveryOneMinute = true,
		LoadGridsquare = true,
		OnAIStateChange = true,
		OnCharacterCollide = true,
		OnClimateTick = true,
		OnClimateTickDebug = true,
		OnContainerUpdate = true,
		OnCustomUIKey = true,
		OnCustomUIKeyPressed = true,
		OnCustomUIKeyReleased = true,
		OnDeviceText = true,
		OnFETick = true,
		OnFillContainer = true,
		OnJoypadRenderUI = true,
		OnKeyPressed = true,
		OnKeyKeepPressed = true,
		OnKeyStartPressed = true,
		OnObjectCollide = true,
		OnPostFloorLayerDraw = true,
		OnPostRender = true,
		OnPostUIDraw = true,
		OnPreUIDraw = true,
		OnMouseMove = true,
		onNPCSurvivorUpdate = true,
		OnPlayerMove = true,
		OnPlayerUpdate = true,
		OnRefreshInventoryWindowContainers = true,
		OnRenderTick = true,
		OnRenderUpdate = true,
		ReuseGridsquare = true,
		OnTick = true,
		OnTickEvenPaused = true,
		OnZombieUpdate = true,
	}

	return config
end
