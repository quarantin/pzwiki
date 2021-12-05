local config = require("DebugLuaEvents/DebugLuaEvents_Config")

local callbacks = {

	-- AcceptedFactionInvite
	--
	-- Triggered when a faction invite has been accepted.
	-- https://pzwiki.net/wiki/Modding:Lua_Events/AcceptedFactionInvite
	AcceptedFactionInvite = function (factionName, playerName)
		config.debug("AcceptedFactionInvite", {
			{ name = "factionName", value = factionName },
			{ name = "playerName", value = playerName },
		})
	end,

	-- AcceptedSafehouseInvite
	--
	-- Triggered when a safehouse invite has been accepted.
	-- https://pzwiki.net/wiki/Modding:Lua_Events/AcceptedSafehouseInvite
	AcceptedSafehouseInvite = function (safehouseName, playerName)
		config.debug("AcceptedSafehouseInvite", {
			{ name = "safehouseName", value = safehouseName },
			{ name = "playerName", value = playerName },
		})
	end,

	-- AcceptedTrade
	--
	-- Triggered when a trade request has been accepted.
	-- https://pzwiki.net/wiki/Modding:Lua_Events/AcceptedTrade
	AcceptedTrade = function (accepted)
		config.debug("AcceptedTrade", {
			{ name = "accepted", value = accepted },
		})
	end,

	-- AddXP
	--
	-- Triggered when a player gains XP.
	-- https://pzwiki.net/wiki/Modding:Lua_Events/AddXP
	AddXP = function (character, perk, level)
		config.debug("AddXP", {
			{ name = "character", value = character },
			{ name = "perk", value = perk },
			{ name = "level", value = level },
		})
	end,

	-- DoSpecialTooltip
	--
	-- Triggered when a special tooltip is being rendered, after a user right-clicked an object.
	-- https://pzwiki.net/wiki/Modding:Lua_Events/DoSpecialTooltip
	DoSpecialTooltip = function (objectTooltip, square)
		config.debug("DoSpecialTooltip", {
			{ name = "objectTooltip", value = objectTooltip },
			{ name = "square", value = square },
		})
	end,

	-- EveryDays
	--
	-- Triggered every day at midnight (in-game).
	-- https://pzwiki.net/wiki/Modding:Lua_Events/EveryDays
	EveryDays = function ()
		config.debug("EveryDays", {})
	end,

	-- EveryHours
	--
	-- Triggered every hour (in-game).
	-- https://pzwiki.net/wiki/Modding:Lua_Events/EveryHours
	EveryHours = function ()
		config.debug("EveryHours", {})
	end,

	-- EveryOneMinute
	--
	-- Triggered every minute (in-game).
	-- https://pzwiki.net/wiki/Modding:Lua_Events/EveryOneMinute
	EveryOneMinute = function ()
		config.debug("EveryOneMinute", {})
	end,

	-- EveryTenMinutes
	--
	-- Triggered every ten minutes (in-game).
	-- https://pzwiki.net/wiki/Modding:Lua_Events/EveryTenMinutes
	EveryTenMinutes = function ()
		config.debug("EveryTenMinutes", {})
	end,

	-- LevelPerk
	--
	-- Triggered when a perk is being leveled up.
	-- https://pzwiki.net/wiki/Modding:Lua_Events/LevelPerk
	LevelPerk = function (character, perk, level, levelUp)
		config.debug("LevelPerk", {
			{ name = "character", value = character },
			{ name = "perk", value = perk },
			{ name = "level", value = level },
			{ name = "levelUp", value = levelUp },
		})
	end,

	-- LoadGridsquare
	--
	-- Triggered when a square is being loaded.
	-- https://pzwiki.net/wiki/Modding:Lua_Events/LoadGridsquare
	LoadGridsquare = function (square)
		config.debug("LoadGridsquare", {
			{ name = "square", value = square },
		})
	end,

	-- MngInvReceiveItems
	--
	-- Triggered when the game client is receiving inventory items from the server.
	-- https://pzwiki.net/wiki/Modding:Lua_Events/MngInvReceiveItems
	MngInvReceiveItems = function (items)
		config.debug("MngInvReceiveItems", {
			{ name = "items", value = items },
		})
	end,

	-- OnAIStateChange
	--
	-- Triggered before an AI state is being changed.
	-- https://pzwiki.net/wiki/Modding:Lua_Events/OnAIStateChange
	OnAIStateChange = function (character, newState, oldState)
		config.debug("OnAIStateChange", {
			{ name = "character", value = character },
			{ name = "newState", value = newState },
			{ name = "oldState", value = oldState },
		})
	end,

	-- OnAIStateEnter
	--
	-- Triggered when an AI state is being entered.
	-- https://pzwiki.net/wiki/Modding:Lua_Events/OnAIStateEnter
	OnAIStateEnter = function (character)
		config.debug("OnAIStateEnter", {
			{ name = "character", value = character },
		})
	end,

	-- OnAIStateExecute
	--
	-- Triggered when an AI state is being executed.
	-- https://pzwiki.net/wiki/Modding:Lua_Events/OnAIStateExecute
	OnAIStateExecute = function (character)
		config.debug("OnAIStateExecute", {
			{ name = "character", value = character },
		})
	end,

	-- OnAIStateExit
	--
	-- Triggered when an AI state is being exited.
	-- https://pzwiki.net/wiki/Modding:Lua_Events/OnAIStateExit
	OnAIStateExit = function (character)
		config.debug("OnAIStateExit", {
			{ name = "character", value = character },
		})
	end,

	-- OnAcceptInvite
	--
	-- Triggered when a Steam invite has been accepted.
	-- https://pzwiki.net/wiki/Modding:Lua_Events/OnAcceptInvite
	OnAcceptInvite = function (connectionString)
		config.debug("OnAcceptInvite", {
			{ name = "connectionString", value = connectionString },
		})
	end,

	-- OnAddBuilding
	--
	-- Triggered when a building is being added to the map.
	-- https://pzwiki.net/wiki/Modding:Lua_Events/OnAddBuilding
	OnAddBuilding = function (buildingDef)
		config.debug("OnAddBuilding", {
			{ name = "buildingDef", value = buildingDef },
		})
	end,

	-- OnAddMessage
	--
	-- Triggered when a chat message is being sent.
	-- https://pzwiki.net/wiki/Modding:Lua_Events/OnAddMessage
	OnAddMessage = function (chatMessage, tabId)
		config.debug("OnAddMessage", {
			{ name = "chatMessage", value = chatMessage },
			{ name = "tabId", value = tabId },
		})
	end,

	-- OnAdminMessage
	--
	-- Triggered when a chat message from the server admin is being sent.
	-- https://pzwiki.net/wiki/Modding:Lua_Events/OnAdminMessage
	OnAdminMessage = function (text, x, y, z)
		config.debug("OnAdminMessage", {
			{ name = "text", value = text },
			{ name = "x", value = x },
			{ name = "y", value = y },
			{ name = "z", value = z },
		})
	end,

	-- OnAmbientSound
	--
	-- Triggered when an ambient sound starts.
	-- https://pzwiki.net/wiki/Modding:Lua_Events/OnAmbientSound
	OnAmbientSound = function (name, x, y)
		config.debug("OnAmbientSound", {
			{ name = "name", value = name },
			{ name = "x", value = x },
			{ name = "y", value = y },
		})
	end,

	-- OnBeingHitByZombie
	--
	-- Triggered when a character is being hit by a zombie.
	-- https://pzwiki.net/wiki/Modding:Lua_Events/OnBeingHitByZombie
	OnBeingHitByZombie = function ()
		config.debug("OnBeingHitByZombie", {})
	end,

	-- OnCGlobalObjectSystemInit
	--
	-- Triggered when the client global object system is being initialized.
	-- https://pzwiki.net/wiki/Modding:Lua_Events/OnCGlobalObjectSystemInit
	OnCGlobalObjectSystemInit = function ()
		config.debug("OnCGlobalObjectSystemInit", {})
	end,

	-- OnChallengeQuery
	--
	-- Triggered when the challenge options are getting populated.
	-- https://pzwiki.net/wiki/Modding:Lua_Events/OnChallengeQuery
	OnChallengeQuery = function ()
		config.debug("OnChallengeQuery", {})
	end,

	-- OnChangeWeather
	--
	-- Triggered when the weather is changing.
	-- https://pzwiki.net/wiki/Modding:Lua_Events/OnChangeWeather
	OnChangeWeather = function (weather)
		config.debug("OnChangeWeather", {
			{ name = "weather", value = weather },
		})
	end,

	-- OnCharacterCollide
	--
	-- Triggered when two characters collide together.
	-- https://pzwiki.net/wiki/Modding:Lua_Events/OnCharacterCollide
	OnCharacterCollide = function (player, character)
		config.debug("OnCharacterCollide", {
			{ name = "player", value = player },
			{ name = "character", value = character },
		})
	end,

	-- OnCharacterCreateStats
	--
	-- Triggered when the stats of a character are being created.
	-- https://pzwiki.net/wiki/Modding:Lua_Events/OnCharacterCreateStats
	OnCharacterCreateStats = function (survivorDesc)
		config.debug("OnCharacterCreateStats", {
			{ name = "survivorDesc", value = survivorDesc },
		})
	end,

	-- OnCharacterDeath
	--
	-- Triggered when a character dies.
	-- https://pzwiki.net/wiki/Modding:Lua_Events/OnCharacterDeath
	OnCharacterDeath = function (character)
		config.debug("OnCharacterDeath", {
			{ name = "character", value = character },
		})
	end,

	-- OnCharacterMeet
	--
	-- Triggered when a survivor meets another character.
	-- https://pzwiki.net/wiki/Modding:Lua_Events/OnCharacterMeet
	OnCharacterMeet = function (survivor, character, encounters)
		config.debug("OnCharacterMeet", {
			{ name = "survivor", value = survivor },
			{ name = "character", value = character },
			{ name = "encounters", value = encounters },
		})
	end,

	-- OnChatWindowInit
	--
	-- Triggered when the chat window is being initialized.
	-- https://pzwiki.net/wiki/Modding:Lua_Events/OnChatWindowInit
	OnChatWindowInit = function ()
		config.debug("OnChatWindowInit", {})
	end,

	-- OnClientCommand
	--
	-- Triggered when the player sends a command to the server.
	-- https://pzwiki.net/wiki/Modding:Lua_Events/OnClientCommand
	OnClientCommand = function (module, command, player, args)
		config.debug("OnClientCommand", {
			{ name = "module", value = module },
			{ name = "command", value = command },
			{ name = "player", value = player },
			{ name = "args", value = args },
		})
	end,

	-- OnClimateManagerInit
	--
	-- Triggered after the ClimateManager has been initialized.
	-- https://pzwiki.net/wiki/Modding:Lua_Events/OnClimateManagerInit
	OnClimateManagerInit = function (climateManager)
		config.debug("OnClimateManagerInit", {
			{ name = "climateManager", value = climateManager },
		})
	end,

	-- OnClimateTick
	--
	-- Triggered for every climate tick.
	-- https://pzwiki.net/wiki/Modding:Lua_Events/OnClimateTick
	OnClimateTick = function (climateManager)
		config.debug("OnClimateTick", {
			{ name = "climateManager", value = climateManager },
		})
	end,

	-- OnClimateTickDebug
	--
	-- Triggered for every climate tick but only when debug mode is enabled.
	-- https://pzwiki.net/wiki/Modding:Lua_Events/OnClimateTickDebug
	OnClimateTickDebug = function (climateManager)
		config.debug("OnClimateTickDebug", {
			{ name = "climateManager", value = climateManager },
		})
	end,

	-- OnClothingUpdated
	--
	-- Triggered when a character's clothing items are updated.
	-- https://pzwiki.net/wiki/Modding:Lua_Events/OnClothingUpdated
	OnClothingUpdated = function (playerOrCharacter)
		config.debug("OnClothingUpdated", {
			{ name = "playerOrCharacter", value = playerOrCharacter },
		})
	end,

	-- OnConnectFailed
	--
	-- Triggered when the connection to the server has failed.
	-- https://pzwiki.net/wiki/Modding:Lua_Events/OnConnectFailed
	OnConnectFailed = function (error)
		config.debug("OnConnectFailed", {
			{ name = "error", value = error },
		})
	end,

	-- OnConnected
	--
	-- Triggered when the player successfully connects to the server.
	-- https://pzwiki.net/wiki/Modding:Lua_Events/OnConnected
	OnConnected = function ()
		config.debug("OnConnected", {})
	end,

	-- OnConnectionStateChanged
	--
	-- When a player is connecting to the server, the connection is going through different stages. This event is triggered for each of these stages of the initial connection.
	-- https://pzwiki.net/wiki/Modding:Lua_Events/OnConnectionStateChanged
	OnConnectionStateChanged = function (state, reason)
		config.debug("OnConnectionStateChanged", {
			{ name = "state", value = state },
			{ name = "reason", value = reason },
		})
	end,

	-- OnContainerUpdate
	--
	-- Triggered when a container is being updated.
	-- https://pzwiki.net/wiki/Modding:Lua_Events/OnContainerUpdate
	OnContainerUpdate = function (container)
		config.debug("OnContainerUpdate", {
			{ name = "container", value = container },
		})
	end,

	-- OnCoopJoinFailed
	--
	-- Triggered when a player fails to join a cooperative game.
	-- https://pzwiki.net/wiki/Modding:Lua_Events/OnCoopJoinFailed
	OnCoopJoinFailed = function (playerId)
		config.debug("OnCoopJoinFailed", {
			{ name = "playerId", value = playerId },
		})
	end,

	-- OnCoopServerMessage
	--
	-- Triggered when the player receives a server message during a cooperative game.
	-- https://pzwiki.net/wiki/Modding:Lua_Events/OnCoopServerMessage
	OnCoopServerMessage = function (messageType, playerNick, steamId)
		config.debug("OnCoopServerMessage", {
			{ name = "messageType", value = messageType },
			{ name = "playerNick", value = playerNick },
			{ name = "steamId", value = steamId },
		})
	end,

	-- OnCreateLivingCharacter
	--
	-- Triggered when either a player or survivor is being created.
	-- https://pzwiki.net/wiki/Modding:Lua_Events/OnCreateLivingCharacter
	OnCreateLivingCharacter = function (playerOrSurvivor, survivorDesc)
		config.debug("OnCreateLivingCharacter", {
			{ name = "playerOrSurvivor", value = playerOrSurvivor },
			{ name = "survivorDesc", value = survivorDesc },
		})
	end,

	-- OnCreatePlayer
	--
	-- Triggered when a player is being created.
	-- https://pzwiki.net/wiki/Modding:Lua_Events/OnCreatePlayer
	OnCreatePlayer = function (playerIndex, player)
		config.debug("OnCreatePlayer", {
			{ name = "playerIndex", value = playerIndex },
			{ name = "player", value = player },
		})
	end,

	-- OnCreateSurvivor
	--
	-- Triggered when a survivor is being created.
	-- https://pzwiki.net/wiki/Modding:Lua_Events/OnCreateSurvivor
	OnCreateSurvivor = function (survivor)
		config.debug("OnCreateSurvivor", {
			{ name = "survivor", value = survivor },
		})
	end,

	-- OnCreateUI
	--
	-- Triggered after UI initialization.
	-- https://pzwiki.net/wiki/Modding:Lua_Events/OnCreateUI
	OnCreateUI = function ()
		config.debug("OnCreateUI", {})
	end,

	-- OnCustomUIKey
	--
	-- Triggered when a custom UI key has been released.
	-- https://pzwiki.net/wiki/Modding:Lua_Events/OnCustomUIKey
	OnCustomUIKey = function (key)
		config.debug("OnCustomUIKey", {
			{ name = "key", value = key },
		})
	end,

	-- OnCustomUIKeyPressed
	--
	-- Triggered when a custom UI key has been pressed.
	-- https://pzwiki.net/wiki/Modding:Lua_Events/OnCustomUIKeyPressed
	OnCustomUIKeyPressed = function (key)
		config.debug("OnCustomUIKeyPressed", {
			{ name = "key", value = key },
		})
	end,

	-- OnCustomUIKeyReleased
	--
	-- Triggered when a custom UI key has been released.
	-- https://pzwiki.net/wiki/Modding:Lua_Events/OnCustomUIKeyReleased
	OnCustomUIKeyReleased = function (key)
		config.debug("OnCustomUIKeyReleased", {
			{ name = "key", value = key },
		})
	end,

	-- OnDawn
	--
	-- Triggered at dawn.
	-- https://pzwiki.net/wiki/Modding:Lua_Events/OnDawn
	OnDawn = function ()
		config.debug("OnDawn", {})
	end,

	-- OnDestroyIsoThumpable
	--
	-- Triggered when a thumpable object is being destroyed.
	-- https://pzwiki.net/wiki/Modding:Lua_Events/OnDestroyIsoThumpable
	OnDestroyIsoThumpable = function (thumpable)
		config.debug("OnDestroyIsoThumpable", {
			{ name = "thumpable", value = thumpable },
		})
	end,

	-- OnDeviceText
	--
	-- Triggered when a media device is displaying text.
	-- https://pzwiki.net/wiki/Modding:Lua_Events/OnDeviceText
	OnDeviceText = function (interactCodes, x, y, z, line, device)
		config.debug("OnDeviceText", {
			{ name = "interactCodes", value = interactCodes },
			{ name = "x", value = x },
			{ name = "y", value = y },
			{ name = "z", value = z },
			{ name = "line", value = line },
			{ name = "device", value = device },
		})
	end,

	-- OnDisconnect
	--
	-- Triggered when the player disconnects from the server.
	-- https://pzwiki.net/wiki/Modding:Lua_Events/OnDisconnect
	OnDisconnect = function ()
		config.debug("OnDisconnect", {})
	end,

	-- OnDistributionMerge
	--
	-- Triggered before merging the world distribution.
	-- https://pzwiki.net/wiki/Modding:Lua_Events/OnDistributionMerge
	OnDistributionMerge = function ()
		config.debug("OnDistributionMerge", {})
	end,

	-- OnDoTileBuilding
	--
	-- Triggered when a building tile is being set.
	-- https://pzwiki.net/wiki/Modding:Lua_Events/OnDoTileBuilding
	OnDoTileBuilding = function (isRender, x, y, z, square, inventoryItem)
		config.debug("OnDoTileBuilding", {
			{ name = "isRender", value = isRender },
			{ name = "x", value = x },
			{ name = "y", value = y },
			{ name = "z", value = z },
			{ name = "square", value = square },
			{ name = "inventoryItem", value = inventoryItem },
		})
	end,

	-- OnDoTileBuilding2
	--
	-- Triggered when a building tile is being set.
	-- https://pzwiki.net/wiki/Modding:Lua_Events/OnDoTileBuilding2
	OnDoTileBuilding2 = function (chunk, render, x, y, z, square)
		config.debug("OnDoTileBuilding2", {
			{ name = "chunk", value = chunk },
			{ name = "render", value = render },
			{ name = "x", value = x },
			{ name = "y", value = y },
			{ name = "z", value = z },
			{ name = "square", value = square },
		})
	end,

	-- OnDoTileBuilding3
	--
	-- Triggered when a building tile is being set.
	-- https://pzwiki.net/wiki/Modding:Lua_Events/OnDoTileBuilding3
	OnDoTileBuilding3 = function (chunk, render, x, y, z)
		config.debug("OnDoTileBuilding3", {
			{ name = "chunk", value = chunk },
			{ name = "render", value = render },
			{ name = "x", value = x },
			{ name = "y", value = y },
			{ name = "z", value = z },
		})
	end,

	-- OnDusk
	--
	-- Triggered at dusk.
	-- https://pzwiki.net/wiki/Modding:Lua_Events/OnDusk
	OnDusk = function ()
		config.debug("OnDusk", {})
	end,

	-- OnDynamicMovableRecipe
	--
	-- Triggered when a dynamic recipe for a movable inventory item is being used.
	-- https://pzwiki.net/wiki/Modding:Lua_Events/OnDynamicMovableRecipe
	OnDynamicMovableRecipe = function (moveable, movableRecipe, inventoryItem, character)
		config.debug("OnDynamicMovableRecipe", {
			{ name = "moveable", value = moveable },
			{ name = "movableRecipe", value = movableRecipe },
			{ name = "inventoryItem", value = inventoryItem },
			{ name = "character", value = character },
		})
	end,

	-- OnEnterVehicle
	--
	-- Triggered when a player successfully enters a vehicle.
	-- https://pzwiki.net/wiki/Modding:Lua_Events/OnEnterVehicle
	OnEnterVehicle = function (character)
		config.debug("OnEnterVehicle", {
			{ name = "character", value = character },
		})
	end,

	-- OnEquipPrimary
	--
	-- Triggered when a character equips an item in its primary slot.
	-- https://pzwiki.net/wiki/Modding:Lua_Events/OnEquipPrimary
	OnEquipPrimary = function (character, inventoryItem)
		config.debug("OnEquipPrimary", {
			{ name = "character", value = character },
			{ name = "inventoryItem", value = inventoryItem },
		})
	end,

	-- OnEquipSecondary
	--
	-- Triggered when a character equips an item in its secondary slot.
	-- https://pzwiki.net/wiki/Modding:Lua_Events/OnEquipSecondary
	OnEquipSecondary = function (character, inventoryItem)
		config.debug("OnEquipSecondary", {
			{ name = "character", value = character },
			{ name = "inventoryItem", value = inventoryItem },
		})
	end,

	-- OnExitVehicle
	--
	-- Triggered when a character is exiting a vehicle.
	-- https://pzwiki.net/wiki/Modding:Lua_Events/OnExitVehicle
	OnExitVehicle = function (character)
		config.debug("OnExitVehicle", {
			{ name = "character", value = character },
		})
	end,

	-- OnFETick
	--
	-- Same as OnTick, except is only called while on the main menu.
	-- https://pzwiki.net/wiki/Modding:Lua_Events/OnFETick
	OnFETick = function (numberTicks)
		config.debug("OnFETick", {
			{ name = "numberTicks", value = numberTicks },
		})
	end,

	-- OnFillContainer
	--
	-- Triggered after a container has been filled.
	-- https://pzwiki.net/wiki/Modding:Lua_Events/OnFillContainer
	OnFillContainer = function (roomName, containerType, itemContainer)
		config.debug("OnFillContainer", {
			{ name = "roomName", value = roomName },
			{ name = "containerType", value = containerType },
			{ name = "itemContainer", value = itemContainer },
		})
	end,

	-- OnFillInventoryObjectContextMenu
	--
	-- Triggered when inventory object context menus are being filled.
	-- https://pzwiki.net/wiki/Modding:Lua_Events/OnFillInventoryObjectContextMenu
	OnFillInventoryObjectContextMenu = function (player, kahluaTable, items)
		config.debug("OnFillInventoryObjectContextMenu", {
			{ name = "player", value = player },
			{ name = "kahluaTable", value = kahluaTable },
			{ name = "items", value = items },
		})
	end,

	-- OnFillWorldObjectContextMenu
	--
	-- Triggered when world object context menus are being filled.
	-- https://pzwiki.net/wiki/Modding:Lua_Events/OnFillWorldObjectContextMenu
	OnFillWorldObjectContextMenu = function (player, context, worldObjects, test)
		config.debug("OnFillWorldObjectContextMenu", {
			{ name = "player", value = player },
			{ name = "context", value = context },
			{ name = "worldObjects", value = worldObjects },
			{ name = "test", value = test },
		})
	end,

	-- OnGameBoot
	--
	-- Triggered when either a game or a server is being started, or when mods are getting reloaded during a game.
	-- https://pzwiki.net/wiki/Modding:Lua_Events/OnGameBoot
	OnGameBoot = function ()
		config.debug("OnGameBoot", {})
	end,

	-- OnGameStart
	--
	-- Triggered after the start of a new game, and after a saved game has been loaded.
	-- https://pzwiki.net/wiki/Modding:Lua_Events/OnGameStart
	OnGameStart = function ()
		config.debug("OnGameStart", {})
	end,

	-- OnGameTimeLoaded
	--
	-- Triggered after the [[GameTime]] has been initialized.
	-- https://pzwiki.net/wiki/Modding:Lua_Events/OnGameTimeLoaded
	OnGameTimeLoaded = function ()
		config.debug("OnGameTimeLoaded", {})
	end,

	-- OnGamepadConnect
	--
	-- Triggered when a gamepad has been connected.
	-- https://pzwiki.net/wiki/Modding:Lua_Events/OnGamepadConnect
	OnGamepadConnect = function (controllerID)
		config.debug("OnGamepadConnect", {
			{ name = "controllerID", value = controllerID },
		})
	end,

	-- OnGamepadDisconnect
	--
	-- Triggered when a gamepad has been disconnected.
	-- https://pzwiki.net/wiki/Modding:Lua_Events/OnGamepadDisconnect
	OnGamepadDisconnect = function (controllerID)
		config.debug("OnGamepadDisconnect", {
			{ name = "controllerID", value = controllerID },
		})
	end,

	-- OnGetDBSchema
	--
	-- Triggered when the game client is receiving a database schema from the server.
	-- https://pzwiki.net/wiki/Modding:Lua_Events/OnGetDBSchema
	OnGetDBSchema = function (dbSchema)
		config.debug("OnGetDBSchema", {
			{ name = "dbSchema", value = dbSchema },
		})
	end,

	-- OnGetTableResult
	--
	-- Triggered when the game client is receiving a table result from the server.
	-- https://pzwiki.net/wiki/Modding:Lua_Events/OnGetTableResult
	OnGetTableResult = function (result, rowId, tableName)
		config.debug("OnGetTableResult", {
			{ name = "result", value = result },
			{ name = "rowId", value = rowId },
			{ name = "tableName", value = tableName },
		})
	end,

	-- OnGridBurnt
	--
	-- Triggered when a grid square is burning.
	-- https://pzwiki.net/wiki/Modding:Lua_Events/OnGridBurnt
	OnGridBurnt = function (square)
		config.debug("OnGridBurnt", {
			{ name = "square", value = square },
		})
	end,

	-- OnHitZombie
	--
	-- Triggered when a character hits a zombie.
	-- https://pzwiki.net/wiki/Modding:Lua_Events/OnHitZombie
	OnHitZombie = function (zombie, character, bodyPartType, handWeapon)
		config.debug("OnHitZombie", {
			{ name = "zombie", value = zombie },
			{ name = "character", value = character },
			{ name = "bodyPartType", value = bodyPartType },
			{ name = "handWeapon", value = handWeapon },
		})
	end,

	-- OnInitGlobalModData
	--
	-- Triggered after GlobalModData has been initialized.
	-- https://pzwiki.net/wiki/Modding:Lua_Events/OnInitGlobalModData
	OnInitGlobalModData = function (isNewGame)
		config.debug("OnInitGlobalModData", {
			{ name = "isNewGame", value = isNewGame },
		})
	end,

	-- OnInitModdedWeatherStage
	--
	-- Triggered when the modded weather state is being initialized.
	-- https://pzwiki.net/wiki/Modding:Lua_Events/OnInitModdedWeatherStage
	OnInitModdedWeatherStage = function (weatherPeriod, weatherStage, airFrontStrength)
		config.debug("OnInitModdedWeatherStage", {
			{ name = "weatherPeriod", value = weatherPeriod },
			{ name = "weatherStage", value = weatherStage },
			{ name = "airFrontStrength", value = airFrontStrength },
		})
	end,

	-- OnInitRecordedMedia
	--
	-- Triggered when a media is being recorded.
	-- https://pzwiki.net/wiki/Modding:Lua_Events/OnInitRecordedMedia
	OnInitRecordedMedia = function (recordedMedia)
		config.debug("OnInitRecordedMedia", {
			{ name = "recordedMedia", value = recordedMedia },
		})
	end,

	-- OnInitSeasons
	--
	-- Triggered when the seasons have been initialized.
	-- https://pzwiki.net/wiki/Modding:Lua_Events/OnInitSeasons
	OnInitSeasons = function (erosionSeason)
		config.debug("OnInitSeasons", {
			{ name = "erosionSeason", value = erosionSeason },
		})
	end,

	-- OnInitWorld
	--
	-- Triggered during the process of initializing the world.
	-- https://pzwiki.net/wiki/Modding:Lua_Events/OnInitWorld
	OnInitWorld = function ()
		config.debug("OnInitWorld", {})
	end,

	-- OnIsoThumpableLoad
	--
	-- Triggered when a thumpable object is being loaded.
	-- https://pzwiki.net/wiki/Modding:Lua_Events/OnIsoThumpableLoad
	OnIsoThumpableLoad = function ()
		config.debug("OnIsoThumpableLoad", {})
	end,

	-- OnIsoThumpableSave
	--
	-- Triggered when a thumpable object is being saved.
	-- https://pzwiki.net/wiki/Modding:Lua_Events/OnIsoThumpableSave
	OnIsoThumpableSave = function ()
		config.debug("OnIsoThumpableSave", {})
	end,

	-- OnJoypadActivate
	--
	-- Triggered when a joypad is activated in-game.
	-- https://pzwiki.net/wiki/Modding:Lua_Events/OnJoypadActivate
	OnJoypadActivate = function (controllerId)
		config.debug("OnJoypadActivate", {
			{ name = "controllerId", value = controllerId },
		})
	end,

	-- OnJoypadActivateUI
	--
	-- Triggered when joypad is activated from main screen.
	-- https://pzwiki.net/wiki/Modding:Lua_Events/OnJoypadActivateUI
	OnJoypadActivateUI = function (joypadId)
		config.debug("OnJoypadActivateUI", {
			{ name = "joypadId", value = joypadId },
		})
	end,

	-- OnJoypadBeforeDeactivate
	--
	-- Triggered when a joypad was disconnected, just before being deactivated.
	-- https://pzwiki.net/wiki/Modding:Lua_Events/OnJoypadBeforeDeactivate
	OnJoypadBeforeDeactivate = function (joypadId)
		config.debug("OnJoypadBeforeDeactivate", {
			{ name = "joypadId", value = joypadId },
		})
	end,

	-- OnJoypadBeforeReactivate
	--
	-- Triggered when a joypad was connected, just before being activated.
	-- https://pzwiki.net/wiki/Modding:Lua_Events/OnJoypadBeforeReactivate
	OnJoypadBeforeReactivate = function (joypadId)
		config.debug("OnJoypadBeforeReactivate", {
			{ name = "joypadId", value = joypadId },
		})
	end,

	-- OnJoypadDeactivate
	--
	-- Triggered when a joypad was disconnected, just after it's been deactivated.
	-- https://pzwiki.net/wiki/Modding:Lua_Events/OnJoypadDeactivate
	OnJoypadDeactivate = function (joypadId)
		config.debug("OnJoypadDeactivate", {
			{ name = "joypadId", value = joypadId },
		})
	end,

	-- OnJoypadReactivate
	--
	-- Triggered when a joypad was connected, just after it's been activated.
	-- https://pzwiki.net/wiki/Modding:Lua_Events/OnJoypadReactivate
	OnJoypadReactivate = function (joypadId)
		config.debug("OnJoypadReactivate", {
			{ name = "joypadId", value = joypadId },
		})
	end,

	-- OnJoypadRenderUI
	--
	-- Triggered every time the screen is being rendered, whether in-game or on main screen.
	-- https://pzwiki.net/wiki/Modding:Lua_Events/OnJoypadRenderUI
	OnJoypadRenderUI = function ()
		config.debug("OnJoypadRenderUI", {})
	end,

	-- OnKeyKeepPressed
	--
	-- Triggered when a keyboard key is being held down.
	-- https://pzwiki.net/wiki/Modding:Lua_Events/OnKeyKeepPressed
	OnKeyKeepPressed = function (key)
		config.debug("OnKeyKeepPressed", {
			{ name = "key", value = key },
		})
	end,

	-- OnKeyPressed
	--
	-- Triggered when a keyboard key is being pressed.
	-- https://pzwiki.net/wiki/Modding:Lua_Events/OnKeyPressed
	OnKeyPressed = function (key)
		config.debug("OnKeyPressed", {
			{ name = "key", value = key },
		})
	end,

	-- OnKeyStartPressed
	--
	-- Triggered when a keyboard key is initially being pressed.
	-- https://pzwiki.net/wiki/Modding:Lua_Events/OnKeyStartPressed
	OnKeyStartPressed = function (key)
		config.debug("OnKeyStartPressed", {
			{ name = "key", value = key },
		})
	end,

	-- OnLoad
	--
	-- Triggered when a game is loading, after [[Modding:Lua Events/OnGameStart|OnGameStart]].
	-- https://pzwiki.net/wiki/Modding:Lua_Events/OnLoad
	OnLoad = function ()
		config.debug("OnLoad", {})
	end,

	-- OnLoadMapZones
	--
	-- Triggered when IsoWorld initialises and is registering the zones for the map.
	-- https://pzwiki.net/wiki/Modding:Lua_Events/OnLoadMapZones
	OnLoadMapZones = function ()
		config.debug("OnLoadMapZones", {})
	end,

	-- OnLoadRadioScripts
	--
	-- Triggered when radio scripts are being loaded.
	-- https://pzwiki.net/wiki/Modding:Lua_Events/OnLoadRadioScripts
	OnLoadRadioScripts = function (radioScriptManager, worldInit)
		config.debug("OnLoadRadioScripts", {
			{ name = "radioScriptManager", value = radioScriptManager },
			{ name = "worldInit", value = worldInit },
		})
	end,

	-- OnLoadSoundBanks
	--
	-- Triggered when sound banks are loaded for the game.
	-- https://pzwiki.net/wiki/Modding:Lua_Events/OnLoadSoundBanks
	OnLoadSoundBanks = function ()
		config.debug("OnLoadSoundBanks", {})
	end,

	-- OnLoadedTileDefinitions
	--
	-- Triggered after tiles definitions have been loaded.
	-- https://pzwiki.net/wiki/Modding:Lua_Events/OnLoadedTileDefinitions
	OnLoadedTileDefinitions = function (spriteManager)
		config.debug("OnLoadedTileDefinitions", {
			{ name = "spriteManager", value = spriteManager },
		})
	end,

	-- OnLoginState
	--
	-- Used when entering login state (?)
	-- https://pzwiki.net/wiki/Modding:Lua_Events/OnLoginState
	OnLoginState = function (loginState)
		config.debug("OnLoginState", {
			{ name = "loginState", value = loginState },
		})
	end,

	-- OnLoginStateSuccess
	--
	-- When LoginState succeeds.
	-- https://pzwiki.net/wiki/Modding:Lua_Events/OnLoginStateSuccess
	OnLoginStateSuccess = function ()
		config.debug("OnLoginStateSuccess", {})
	end,

	-- OnMainMenuEnter
	--
	-- Triggered when main menu is displayed to users. This can occur either when they launch the game, or when they quit a running game.
	-- https://pzwiki.net/wiki/Modding:Lua_Events/OnMainMenuEnter
	OnMainMenuEnter = function ()
		config.debug("OnMainMenuEnter", {})
	end,

	-- OnMakeItem
	--
	-- Triggered when a player is crafting an item.
	-- https://pzwiki.net/wiki/Modding:Lua_Events/OnMakeItem
	OnMakeItem = function (item, resultItem, recipe)
		config.debug("OnMakeItem", {
			{ name = "item", value = item },
			{ name = "resultItem", value = resultItem },
			{ name = "recipe", value = recipe },
		})
	end,

	-- OnMapLoadCreateIsoObject
	--
	-- No trigger found for this event.
	-- https://pzwiki.net/wiki/Modding:Lua_Events/OnMapLoadCreateIsoObject
	OnMapLoadCreateIsoObject = function ()
		config.debug("OnMapLoadCreateIsoObject", {})
	end,

	-- OnMechanicActionDone
	--
	-- Triggered when a player finished a mechanic action.
	-- https://pzwiki.net/wiki/Modding:Lua_Events/OnMechanicActionDone
	OnMechanicActionDone = function (character, success, vehicleId, partId, itemId, installing)
		config.debug("OnMechanicActionDone", {
			{ name = "character", value = character },
			{ name = "success", value = success },
			{ name = "vehicleId", value = vehicleId },
			{ name = "partId", value = partId },
			{ name = "itemId", value = itemId },
			{ name = "installing", value = installing },
		})
	end,

	-- OnMiniScoreboardUpdate
	--
	-- Triggered when the mini scoreboard is being updated.
	-- https://pzwiki.net/wiki/Modding:Lua_Events/OnMiniScoreboardUpdate
	OnMiniScoreboardUpdate = function ()
		config.debug("OnMiniScoreboardUpdate", {})
	end,

	-- OnModsModified
	--
	-- Triggered when a mod has been modified on the filesystem.
	-- https://pzwiki.net/wiki/Modding:Lua_Events/OnModsModified
	OnModsModified = function ()
		config.debug("OnModsModified", {})
	end,

	-- OnMouseDown
	--
	-- Triggered when the mouse button is down.
	-- https://pzwiki.net/wiki/Modding:Lua_Events/OnMouseDown
	OnMouseDown = function (x, y)
		config.debug("OnMouseDown", {
			{ name = "x", value = x },
			{ name = "y", value = y },
		})
	end,

	-- OnMouseMove
	--
	-- Triggered when the mouse is moved.
	-- https://pzwiki.net/wiki/Modding:Lua_Events/OnMouseMove
	OnMouseMove = function (x, y, dx, dy)
		config.debug("OnMouseMove", {
			{ name = "x", value = x },
			{ name = "y", value = y },
			{ name = "dx", value = dx },
			{ name = "dy", value = dy },
		})
	end,

	-- OnMouseUp
	--
	-- Triggered when the mouse button is released.
	-- https://pzwiki.net/wiki/Modding:Lua_Events/OnMouseUp
	OnMouseUp = function (x, y)
		config.debug("OnMouseUp", {
			{ name = "x", value = x },
			{ name = "y", value = y },
		})
	end,

	-- OnMultiTriggerNPCEvent
	--
	-- Called when a player enters the trigger area of a NPC event.
	-- https://pzwiki.net/wiki/Modding:Lua_Events/OnMultiTriggerNPCEvent
	OnMultiTriggerNPCEvent = function (triggerType, modData, buildingDef)
		config.debug("OnMultiTriggerNPCEvent", {
			{ name = "triggerType", value = triggerType },
			{ name = "modData", value = modData },
			{ name = "buildingDef", value = buildingDef },
		})
	end,

	-- OnNPCSurvivorUpdate
	--
	-- Triggered when a survivor is being updated.
	-- https://pzwiki.net/wiki/Modding:Lua_Events/OnNPCSurvivorUpdate
	OnNPCSurvivorUpdate = function (survivor)
		config.debug("OnNPCSurvivorUpdate", {
			{ name = "survivor", value = survivor },
		})
	end,

	-- OnNewFire
	--
	-- Triggered when a fire starts.
	-- https://pzwiki.net/wiki/Modding:Lua_Events/OnNewFire
	OnNewFire = function (fire)
		config.debug("OnNewFire", {
			{ name = "fire", value = fire },
		})
	end,

	-- OnNewGame
	--
	-- Triggered after a new world has been initialized.
	-- https://pzwiki.net/wiki/Modding:Lua_Events/OnNewGame
	OnNewGame = function (player, square)
		config.debug("OnNewGame", {
			{ name = "player", value = player },
			{ name = "square", value = square },
		})
	end,

	-- OnNewSurvivorGroup
	--
	-- Triggered when a new survivor group is being created.
	-- https://pzwiki.net/wiki/Modding:Lua_Events/OnNewSurvivorGroup
	OnNewSurvivorGroup = function (survivorGroup, x, y)
		config.debug("OnNewSurvivorGroup", {
			{ name = "survivorGroup", value = survivorGroup },
			{ name = "x", value = x },
			{ name = "y", value = y },
		})
	end,

	-- OnObjectAboutToBeRemoved
	--
	-- Triggered when an object is about to get removed.
	-- https://pzwiki.net/wiki/Modding:Lua_Events/OnObjectAboutToBeRemoved
	OnObjectAboutToBeRemoved = function (object)
		config.debug("OnObjectAboutToBeRemoved", {
			{ name = "object", value = object },
		})
	end,

	-- OnObjectAdded
	--
	-- Triggered when an object is added to the map.
	-- https://pzwiki.net/wiki/Modding:Lua_Events/OnObjectAdded
	OnObjectAdded = function (object)
		config.debug("OnObjectAdded", {
			{ name = "object", value = object },
		})
	end,

	-- OnObjectCollide
	--
	-- Triggered when a character collides with an object.
	-- https://pzwiki.net/wiki/Modding:Lua_Events/OnObjectCollide
	OnObjectCollide = function (character, door,IsoGridSquare,IsoThumpable,IsoWindow,IsoZombie)
		config.debug("OnObjectCollide", {
			{ name = "character", value = character },
			{ name = "door,IsoGridSquare,IsoThumpable,IsoWindow,IsoZombie", value = door,IsoGridSquare,IsoThumpable,IsoWindow,IsoZombie },
		})
	end,

	-- OnObjectLeftMouseButtonDown
	--
	-- Triggered when left mouse button clicked on [[IsoObject]]
	-- https://pzwiki.net/wiki/Modding:Lua_Events/OnObjectLeftMouseButtonDown
	OnObjectLeftMouseButtonDown = function (object, x, y)
		config.debug("OnObjectLeftMouseButtonDown", {
			{ name = "object", value = object },
			{ name = "x", value = x },
			{ name = "y", value = y },
		})
	end,

	-- OnObjectLeftMouseButtonUp
	--
	-- Triggered when left mouse button is released on [[IsoObject]]
	-- https://pzwiki.net/wiki/Modding:Lua_Events/OnObjectLeftMouseButtonUp
	OnObjectLeftMouseButtonUp = function (object, x, y)
		config.debug("OnObjectLeftMouseButtonUp", {
			{ name = "object", value = object },
			{ name = "x", value = x },
			{ name = "y", value = y },
		})
	end,

	-- OnObjectRightMouseButtonDown
	--
	-- Triggered when right mouse button clicked on [[IsoObject]]
	-- https://pzwiki.net/wiki/Modding:Lua_Events/OnObjectRightMouseButtonDown
	OnObjectRightMouseButtonDown = function (object, x, y)
		config.debug("OnObjectRightMouseButtonDown", {
			{ name = "object", value = object },
			{ name = "x", value = x },
			{ name = "y", value = y },
		})
	end,

	-- OnObjectRightMouseButtonUp
	--
	-- Triggered when right mouse button is released on [[IsoObject]]
	-- https://pzwiki.net/wiki/Modding:Lua_Events/OnObjectRightMouseButtonUp
	OnObjectRightMouseButtonUp = function (object, x, y)
		config.debug("OnObjectRightMouseButtonUp", {
			{ name = "object", value = object },
			{ name = "x", value = x },
			{ name = "y", value = y },
		})
	end,

	-- OnPlayerAttackFinished
	--
	-- Triggered when a character is done performing an attack.
	-- https://pzwiki.net/wiki/Modding:Lua_Events/OnPlayerAttackFinished
	OnPlayerAttackFinished = function (character, handWeapon)
		config.debug("OnPlayerAttackFinished", {
			{ name = "character", value = character },
			{ name = "handWeapon", value = handWeapon },
		})
	end,

	-- OnPlayerDeath
	--
	-- Triggered when a player dies.
	-- https://pzwiki.net/wiki/Modding:Lua_Events/OnPlayerDeath
	OnPlayerDeath = function (player)
		config.debug("OnPlayerDeath", {
			{ name = "player", value = player },
		})
	end,

	-- OnPlayerMove
	--
	-- Triggered while the player is moving.
	-- https://pzwiki.net/wiki/Modding:Lua_Events/OnPlayerMove
	OnPlayerMove = function (player)
		config.debug("OnPlayerMove", {
			{ name = "player", value = player },
		})
	end,

	-- OnPlayerSetSafehouse
	--
	-- Triggered when survivor group has their safehouse set.
	-- https://pzwiki.net/wiki/Modding:Lua_Events/OnPlayerSetSafehouse
	OnPlayerSetSafehouse = function (survivorGroup, buildingDef)
		config.debug("OnPlayerSetSafehouse", {
			{ name = "survivorGroup", value = survivorGroup },
			{ name = "buildingDef", value = buildingDef },
		})
	end,

	-- OnPlayerUpdate
	--
	-- Triggered when a player is being updated.
	-- https://pzwiki.net/wiki/Modding:Lua_Events/OnPlayerUpdate
	OnPlayerUpdate = function (player)
		config.debug("OnPlayerUpdate", {
			{ name = "player", value = player },
		})
	end,

	-- OnPostCharactersSquareDraw
	--
	-- No trigger found for this event.
	-- https://pzwiki.net/wiki/Modding:Lua_Events/OnPostCharactersSquareDraw
	OnPostCharactersSquareDraw = function ()
		config.debug("OnPostCharactersSquareDraw", {})
	end,

	-- OnPostDistributionMerge
	--
	-- Triggered after the distribution merge.
	-- https://pzwiki.net/wiki/Modding:Lua_Events/OnPostDistributionMerge
	OnPostDistributionMerge = function ()
		config.debug("OnPostDistributionMerge", {})
	end,

	-- OnPostFloorLayerDraw
	--
	-- Triggered after a floor layer is rendered.
	-- https://pzwiki.net/wiki/Modding:Lua_Events/OnPostFloorLayerDraw
	OnPostFloorLayerDraw = function (z)
		config.debug("OnPostFloorLayerDraw", {
			{ name = "z", value = z },
		})
	end,

	-- OnPostFloorSquareDraw
	--
	-- No trigger found for this event.
	-- https://pzwiki.net/wiki/Modding:Lua_Events/OnPostFloorSquareDraw
	OnPostFloorSquareDraw = function ()
		config.debug("OnPostFloorSquareDraw", {})
	end,

	-- OnPostMapLoad
	--
	-- Triggered after a cell is loaded.
	-- https://pzwiki.net/wiki/Modding:Lua_Events/OnPostMapLoad
	OnPostMapLoad = function (cell, worldX, worldY)
		config.debug("OnPostMapLoad", {
			{ name = "cell", value = cell },
			{ name = "worldX", value = worldX },
			{ name = "worldY", value = worldY },
		})
	end,

	-- OnPostRender
	--
	-- Triggered every time after a frame is rendered in-game.
	-- https://pzwiki.net/wiki/Modding:Lua_Events/OnPostRender
	OnPostRender = function ()
		config.debug("OnPostRender", {})
	end,

	-- OnPostSave
	--
	-- Triggered after a game has been saved.
	-- https://pzwiki.net/wiki/Modding:Lua_Events/OnPostSave
	OnPostSave = function ()
		config.debug("OnPostSave", {})
	end,

	-- OnPostTileDraw
	--
	-- No trigger found for this event.
	-- https://pzwiki.net/wiki/Modding:Lua_Events/OnPostTileDraw
	OnPostTileDraw = function ()
		config.debug("OnPostTileDraw", {})
	end,

	-- OnPostTilesSquareDraw
	--
	-- No trigger found for this event.
	-- https://pzwiki.net/wiki/Modding:Lua_Events/OnPostTilesSquareDraw
	OnPostTilesSquareDraw = function ()
		config.debug("OnPostTilesSquareDraw", {})
	end,

	-- OnPostUIDraw
	--
	-- Triggered by UI Manager in its render function after the UI has been drawn.
	-- https://pzwiki.net/wiki/Modding:Lua_Events/OnPostUIDraw
	OnPostUIDraw = function ()
		config.debug("OnPostUIDraw", {})
	end,

	-- OnPostWallSquareDraw
	--
	-- No trigger found for this event.
	-- https://pzwiki.net/wiki/Modding:Lua_Events/OnPostWallSquareDraw
	OnPostWallSquareDraw = function ()
		config.debug("OnPostWallSquareDraw", {})
	end,

	-- OnPreDistributionMerge
	--
	-- Triggered before the distribution merge.
	-- https://pzwiki.net/wiki/Modding:Lua_Events/OnPreDistributionMerge
	OnPreDistributionMerge = function ()
		config.debug("OnPreDistributionMerge", {})
	end,

	-- OnPreFillInventoryObjectContextMenu
	--
	-- Triggered before context menus get filled with options.
	-- https://pzwiki.net/wiki/Modding:Lua_Events/OnPreFillInventoryObjectContextMenu
	OnPreFillInventoryObjectContextMenu = function (player, context, items)
		config.debug("OnPreFillInventoryObjectContextMenu", {
			{ name = "player", value = player },
			{ name = "context", value = context },
			{ name = "items", value = items },
		})
	end,

	-- OnPreFillWorldObjectContextMenu
	--
	-- Triggered before context menu for world objects is filled.
	-- https://pzwiki.net/wiki/Modding:Lua_Events/OnPreFillWorldObjectContextMenu
	OnPreFillWorldObjectContextMenu = function (player, context, worldObjects, test)
		config.debug("OnPreFillWorldObjectContextMenu", {
			{ name = "player", value = player },
			{ name = "context", value = context },
			{ name = "worldObjects", value = worldObjects },
			{ name = "test", value = test },
		})
	end,

	-- OnPreGameStart
	--
	-- Triggered before [[Modding:Lua Events/GameStart]].
	-- https://pzwiki.net/wiki/Modding:Lua_Events/OnPreGameStart
	OnPreGameStart = function ()
		config.debug("OnPreGameStart", {})
	end,

	-- OnPreMapLoad
	--
	-- Triggered before a map is loaded.
	-- https://pzwiki.net/wiki/Modding:Lua_Events/OnPreMapLoad
	OnPreMapLoad = function ()
		config.debug("OnPreMapLoad", {})
	end,

	-- OnPreUIDraw
	--
	-- Triggered by UI Manager in its render function before the UI gets drawn.
	-- https://pzwiki.net/wiki/Modding:Lua_Events/OnPreUIDraw
	OnPreUIDraw = function ()
		config.debug("OnPreUIDraw", {})
	end,

	-- OnPressRackButton
	--
	-- Triggered when a player hits the button to rack a firearm.
	-- https://pzwiki.net/wiki/Modding:Lua_Events/OnPressRackButton
	OnPressRackButton = function (player, firearm)
		config.debug("OnPressRackButton", {
			{ name = "player", value = player },
			{ name = "firearm", value = firearm },
		})
	end,

	-- OnPressReloadButton
	--
	-- Triggered when a player hits the  button to reload a firearm.
	-- https://pzwiki.net/wiki/Modding:Lua_Events/OnPressReloadButton
	OnPressReloadButton = function (player, firearm)
		config.debug("OnPressReloadButton", {
			{ name = "player", value = player },
			{ name = "firearm", value = firearm },
		})
	end,

	-- OnRadioInteraction
	--
	-- Triggered when a radio is displaying a new line of text.
	-- https://pzwiki.net/wiki/Modding:Lua_Events/OnRadioInteraction
	OnRadioInteraction = function (player, line, color, codesOutput)
		config.debug("OnRadioInteraction", {
			{ name = "player", value = player },
			{ name = "line", value = line },
			{ name = "color", value = color },
			{ name = "codesOutput", value = codesOutput },
		})
	end,

	-- OnRainStart
	--
	-- Triggered when it starts rainning.
	-- https://pzwiki.net/wiki/Modding:Lua_Events/OnRainStart
	OnRainStart = function ()
		config.debug("OnRainStart", {})
	end,

	-- OnRainStop
	--
	-- Triggered when it stops raining.
	-- https://pzwiki.net/wiki/Modding:Lua_Events/OnRainStop
	OnRainStop = function ()
		config.debug("OnRainStop", {})
	end,

	-- OnReceiveGlobalModData
	--
	-- Triggered when the game client is receiving GlobalModData from the server.
	-- https://pzwiki.net/wiki/Modding:Lua_Events/OnReceiveGlobalModData
	OnReceiveGlobalModData = function (key, modData)
		config.debug("OnReceiveGlobalModData", {
			{ name = "key", value = key },
			{ name = "modData", value = modData },
		})
	end,

	-- OnReceiveItemListNet
	--
	-- Triggered when a player is receiving a list of items from another player.
	-- https://pzwiki.net/wiki/Modding:Lua_Events/OnReceiveItemListNet
	OnReceiveItemListNet = function (sender, itemList, receiver, sessionId, custom)
		config.debug("OnReceiveItemListNet", {
			{ name = "sender", value = sender },
			{ name = "itemList", value = itemList },
			{ name = "receiver", value = receiver },
			{ name = "sessionId", value = sessionId },
			{ name = "custom", value = custom },
		})
	end,

	-- OnReceiveUserlog
	--
	-- Triggered when the game client is receiving user log from the server.
	-- https://pzwiki.net/wiki/Modding:Lua_Events/OnReceiveUserlog
	OnReceiveUserlog = function (username, result)
		config.debug("OnReceiveUserlog", {
			{ name = "username", value = username },
			{ name = "result", value = result },
		})
	end,

	-- OnRefreshInventoryWindowContainers
	--
	-- Triggered during the process of refreshing inventory containers.
	-- https://pzwiki.net/wiki/Modding:Lua_Events/OnRefreshInventoryWindowContainers
	OnRefreshInventoryWindowContainers = function (iSInventoryPage, state)
		config.debug("OnRefreshInventoryWindowContainers", {
			{ name = "iSInventoryPage", value = iSInventoryPage },
			{ name = "state", value = state },
		})
	end,

	-- OnRenderTick
	--
	-- Triggered every time the display is being rendered.
	-- https://pzwiki.net/wiki/Modding:Lua_Events/OnRenderTick
	OnRenderTick = function ()
		config.debug("OnRenderTick", {})
	end,

	-- OnRenderUpdate
	--
	-- Triggered every time Display.update() is called.
	-- https://pzwiki.net/wiki/Modding:Lua_Events/OnRenderUpdate
	OnRenderUpdate = function ()
		config.debug("OnRenderUpdate", {})
	end,

	-- OnResetLua
	--
	-- Triggered when Lua is being reset.
	-- https://pzwiki.net/wiki/Modding:Lua_Events/OnResetLua
	OnResetLua = function (reason)
		config.debug("OnResetLua", {
			{ name = "reason", value = reason },
		})
	end,

	-- OnResolutionChange
	--
	-- Triggered when game resolution has changed.
	-- https://pzwiki.net/wiki/Modding:Lua_Events/OnResolutionChange
	OnResolutionChange = function (oldWidth, oldHeight, newWidth, newHeight)
		config.debug("OnResolutionChange", {
			{ name = "oldWidth", value = oldWidth },
			{ name = "oldHeight", value = oldHeight },
			{ name = "newWidth", value = newWidth },
			{ name = "newHeight", value = newHeight },
		})
	end,

	-- OnRightMouseDown
	--
	-- Triggered when right mouse button is down.
	-- https://pzwiki.net/wiki/Modding:Lua_Events/OnRightMouseDown
	OnRightMouseDown = function (x, y)
		config.debug("OnRightMouseDown", {
			{ name = "x", value = x },
			{ name = "y", value = y },
		})
	end,

	-- OnRightMouseUp
	--
	-- Triggered when mouse button is released.
	-- https://pzwiki.net/wiki/Modding:Lua_Events/OnRightMouseUp
	OnRightMouseUp = function (x, y)
		config.debug("OnRightMouseUp", {
			{ name = "x", value = x },
			{ name = "y", value = y },
		})
	end,

	-- OnSGlobalObjectSystemInit
	--
	-- Triggered when the server global object system is being initialized.
	-- https://pzwiki.net/wiki/Modding:Lua_Events/OnSGlobalObjectSystemInit
	OnSGlobalObjectSystemInit = function ()
		config.debug("OnSGlobalObjectSystemInit", {})
	end,

	-- OnSafehousesChanged
	--
	-- Triggered when the safehouse is being changed.
	-- https://pzwiki.net/wiki/Modding:Lua_Events/OnSafehousesChanged
	OnSafehousesChanged = function ()
		config.debug("OnSafehousesChanged", {})
	end,

	-- OnSave
	--
	-- Triggered during the game's saving process.
	-- https://pzwiki.net/wiki/Modding:Lua_Events/OnSave
	OnSave = function ()
		config.debug("OnSave", {})
	end,

	-- OnScoreboardUpdate
	--
	-- Triggered when multiplayer scoreboard is updated.
	-- https://pzwiki.net/wiki/Modding:Lua_Events/OnScoreboardUpdate
	OnScoreboardUpdate = function (playerNames, displayNames, steamIds)
		config.debug("OnScoreboardUpdate", {
			{ name = "playerNames", value = playerNames },
			{ name = "displayNames", value = displayNames },
			{ name = "steamIds", value = steamIds },
		})
	end,

	-- OnSeeNewRoom
	--
	-- Triggered for each room about to get spawned, the first time a character gets close enough to the building where the room is located.
	-- https://pzwiki.net/wiki/Modding:Lua_Events/OnSeeNewRoom
	OnSeeNewRoom = function (room)
		config.debug("OnSeeNewRoom", {
			{ name = "room", value = room },
		})
	end,

	-- OnServerCommand
	--
	-- Triggered when a command from the server is being received.
	-- https://pzwiki.net/wiki/Modding:Lua_Events/OnServerCommand
	OnServerCommand = function (module, command, arguments)
		config.debug("OnServerCommand", {
			{ name = "module", value = module },
			{ name = "command", value = command },
			{ name = "arguments", value = arguments },
		})
	end,

	-- OnServerFinishSaving
	--
	-- Triggered when the server is done saving.
	-- https://pzwiki.net/wiki/Modding:Lua_Events/OnServerFinishSaving
	OnServerFinishSaving = function ()
		config.debug("OnServerFinishSaving", {})
	end,

	-- OnServerStartSaving
	--
	-- Triggered when the server starts saving.
	-- https://pzwiki.net/wiki/Modding:Lua_Events/OnServerStartSaving
	OnServerStartSaving = function ()
		config.debug("OnServerStartSaving", {})
	end,

	-- OnServerStarted
	--
	-- Triggered when the game server has started.
	-- https://pzwiki.net/wiki/Modding:Lua_Events/OnServerStarted
	OnServerStarted = function ()
		config.debug("OnServerStarted", {})
	end,

	-- OnServerStatisticReceived
	--
	-- Triggered when the game client receives statistics from the server.
	-- https://pzwiki.net/wiki/Modding:Lua_Events/OnServerStatisticReceived
	OnServerStatisticReceived = function ()
		config.debug("OnServerStatisticReceived", {})
	end,

	-- OnServerWorkshopItems
	--
	-- TODO
	-- https://pzwiki.net/wiki/Modding:Lua_Events/OnServerWorkshopItems
	OnServerWorkshopItems = function (state, data, data2, data3)
		config.debug("OnServerWorkshopItems", {
			{ name = "state", value = state },
			{ name = "data", value = data },
			{ name = "data2", value = data2 },
			{ name = "data3", value = data3 },
		})
	end,

	-- OnSetDefaultTab
	--
	-- Triggered when the default chat tab has been set.
	-- https://pzwiki.net/wiki/Modding:Lua_Events/OnSetDefaultTab
	OnSetDefaultTab = function (chatTab)
		config.debug("OnSetDefaultTab", {
			{ name = "chatTab", value = chatTab },
		})
	end,

	-- OnSpawnRegionsLoaded
	--
	-- Triggered after spawn regions are loaded.
	-- https://pzwiki.net/wiki/Modding:Lua_Events/OnSpawnRegionsLoaded
	OnSpawnRegionsLoaded = function (spawnRegions)
		config.debug("OnSpawnRegionsLoaded", {
			{ name = "spawnRegions", value = spawnRegions },
		})
	end,

	-- OnSteamFriendStatusChanged
	--
	-- Triggered when the status of a friend changed on Steam.
	-- https://pzwiki.net/wiki/Modding:Lua_Events/OnSteamFriendStatusChanged
	OnSteamFriendStatusChanged = function (steamId)
		config.debug("OnSteamFriendStatusChanged", {
			{ name = "steamId", value = steamId },
		})
	end,

	-- OnSteamGameJoin
	--
	-- Triggered when joining a game through Steam.
	-- https://pzwiki.net/wiki/Modding:Lua_Events/OnSteamGameJoin
	OnSteamGameJoin = function ()
		config.debug("OnSteamGameJoin", {})
	end,

	-- OnSteamRefreshInternetServers
	--
	-- Triggered when the list of public Internet servers is being refreshed.
	-- https://pzwiki.net/wiki/Modding:Lua_Events/OnSteamRefreshInternetServers
	OnSteamRefreshInternetServers = function ()
		config.debug("OnSteamRefreshInternetServers", {})
	end,

	-- OnSteamRulesRefreshComplete
	--
	-- TODO
	-- https://pzwiki.net/wiki/Modding:Lua_Events/OnSteamRulesRefreshComplete
	OnSteamRulesRefreshComplete = function (host, port, rulesTable)
		config.debug("OnSteamRulesRefreshComplete", {
			{ name = "host", value = host },
			{ name = "port", value = port },
			{ name = "rulesTable", value = rulesTable },
		})
	end,

	-- OnSteamServerFailedToRespond2
	--
	-- TODO
	-- https://pzwiki.net/wiki/Modding:Lua_Events/OnSteamServerFailedToRespond2
	OnSteamServerFailedToRespond2 = function (host, port)
		config.debug("OnSteamServerFailedToRespond2", {
			{ name = "host", value = host },
			{ name = "port", value = port },
		})
	end,

	-- OnSteamServerResponded
	--
	-- TODO
	-- https://pzwiki.net/wiki/Modding:Lua_Events/OnSteamServerResponded
	OnSteamServerResponded = function (serverIndex)
		config.debug("OnSteamServerResponded", {
			{ name = "serverIndex", value = serverIndex },
		})
	end,

	-- OnSteamServerResponded2
	--
	-- TODO
	-- https://pzwiki.net/wiki/Modding:Lua_Events/OnSteamServerResponded2
	OnSteamServerResponded2 = function (host, port, server)
		config.debug("OnSteamServerResponded2", {
			{ name = "host", value = host },
			{ name = "port", value = port },
			{ name = "server", value = server },
		})
	end,

	-- OnSteamWorkshopItemCreated
	--
	-- Triggered after a new Steam workshop item was successfully created.
	-- https://pzwiki.net/wiki/Modding:Lua_Events/OnSteamWorkshopItemCreated
	OnSteamWorkshopItemCreated = function (steamId, userNeedsToAcceptWorkshopLegalAgreement)
		config.debug("OnSteamWorkshopItemCreated", {
			{ name = "steamId", value = steamId },
			{ name = "userNeedsToAcceptWorkshopLegalAgreement", value = userNeedsToAcceptWorkshopLegalAgreement },
		})
	end,

	-- OnSteamWorkshopItemNotCreated
	--
	-- Triggered when a Steam workshop item couldn't be created.
	-- https://pzwiki.net/wiki/Modding:Lua_Events/OnSteamWorkshopItemNotCreated
	OnSteamWorkshopItemNotCreated = function (result)
		config.debug("OnSteamWorkshopItemNotCreated", {
			{ name = "result", value = result },
		})
	end,

	-- OnSteamWorkshopItemNotUpdated
	--
	-- Triggered when a Steam workshop item couldn't be updated.
	-- https://pzwiki.net/wiki/Modding:Lua_Events/OnSteamWorkshopItemNotUpdated
	OnSteamWorkshopItemNotUpdated = function (result)
		config.debug("OnSteamWorkshopItemNotUpdated", {
			{ name = "result", value = result },
		})
	end,

	-- OnSteamWorkshopItemUpdated
	--
	-- Triggered after a Steam workship item was successfully updated.
	-- https://pzwiki.net/wiki/Modding:Lua_Events/OnSteamWorkshopItemUpdated
	OnSteamWorkshopItemUpdated = function (userNeedsToAcceptWorkshopLegalAgreement)
		config.debug("OnSteamWorkshopItemUpdated", {
			{ name = "userNeedsToAcceptWorkshopLegalAgreement", value = userNeedsToAcceptWorkshopLegalAgreement },
		})
	end,

	-- OnSwitchVehicleSeat
	--
	-- Triggered when a character is switching seat in a vehicle.
	-- https://pzwiki.net/wiki/Modding:Lua_Events/OnSwitchVehicleSeat
	OnSwitchVehicleSeat = function (player)
		config.debug("OnSwitchVehicleSeat", {
			{ name = "player", value = player },
		})
	end,

	-- OnTabAdded
	--
	-- Triggered when a chat tab is added.
	-- https://pzwiki.net/wiki/Modding:Lua_Events/OnTabAdded
	OnTabAdded = function (tabTitle, tabId)
		config.debug("OnTabAdded", {
			{ name = "tabTitle", value = tabTitle },
			{ name = "tabId", value = tabId },
		})
	end,

	-- OnTabRemoved
	--
	-- Triggered when a chat tab is closed.
	-- https://pzwiki.net/wiki/Modding:Lua_Events/OnTabRemoved
	OnTabRemoved = function (tabTitle, tabId)
		config.debug("OnTabRemoved", {
			{ name = "tabTitle", value = tabTitle },
			{ name = "tabId", value = tabId },
		})
	end,

	-- OnThunderEvent
	--
	-- Triggered when a thunderstorm is about to start.
	-- https://pzwiki.net/wiki/Modding:Lua_Events/OnThunderEvent
	OnThunderEvent = function (x, y, strike, light, rumble)
		config.debug("OnThunderEvent", {
			{ name = "x", value = x },
			{ name = "y", value = y },
			{ name = "strike", value = strike },
			{ name = "light", value = light },
			{ name = "rumble", value = rumble },
		})
	end,

	-- OnTick
	--
	-- Triggered every tick, try to not use this one, use EveryTenMinutes instead because it can create a lot of frame loss/garbage collection.
	-- https://pzwiki.net/wiki/Modding:Lua_Events/OnTick
	OnTick = function (numberTicks)
		config.debug("OnTick", {
			{ name = "numberTicks", value = numberTicks },
		})
	end,

	-- OnTickEvenPaused
	--
	-- Same as OnTick, but triggered when the game is paused as well.
	-- https://pzwiki.net/wiki/Modding:Lua_Events/OnTickEvenPaused
	OnTickEvenPaused = function (numberTicks)
		config.debug("OnTickEvenPaused", {
			{ name = "numberTicks", value = numberTicks },
		})
	end,

	-- OnTileRemoved
	--
	-- Triggered when a tile object has been removed.
	-- https://pzwiki.net/wiki/Modding:Lua_Events/OnTileRemoved
	OnTileRemoved = function (object)
		config.debug("OnTileRemoved", {
			{ name = "object", value = object },
		})
	end,

	-- OnTriggerNPCEvent
	--
	-- Called when a player enters the trigger area of a NPC event.
	-- https://pzwiki.net/wiki/Modding:Lua_Events/OnTriggerNPCEvent
	OnTriggerNPCEvent = function (triggerType, modData, buildingDef)
		config.debug("OnTriggerNPCEvent", {
			{ name = "triggerType", value = triggerType },
			{ name = "modData", value = modData },
			{ name = "buildingDef", value = buildingDef },
		})
	end,

	-- OnUpdateModdedWeatherStage
	--
	-- Triggered when the modded weather sage is being updated.
	-- https://pzwiki.net/wiki/Modding:Lua_Events/OnUpdateModdedWeatherStage
	OnUpdateModdedWeatherStage = function (weatherPeriod, weatherStage, strength)
		config.debug("OnUpdateModdedWeatherStage", {
			{ name = "weatherPeriod", value = weatherPeriod },
			{ name = "weatherStage", value = weatherStage },
			{ name = "strength", value = strength },
		})
	end,

	-- OnVehicleDamageTexture
	--
	-- Triggered when the texture of a vehicle part is changed after being damaged.
	-- https://pzwiki.net/wiki/Modding:Lua_Events/OnVehicleDamageTexture
	OnVehicleDamageTexture = function (character)
		config.debug("OnVehicleDamageTexture", {
			{ name = "character", value = character },
		})
	end,

	-- OnWaterAmountChange
	--
	-- Triggered when the amount of water in an object has changed.
	-- https://pzwiki.net/wiki/Modding:Lua_Events/OnWaterAmountChange
	OnWaterAmountChange = function (object, waterAmount)
		config.debug("OnWaterAmountChange", {
			{ name = "object", value = object },
			{ name = "waterAmount", value = waterAmount },
		})
	end,

	-- OnWeaponHitCharacter
	--
	-- Triggered when a character has been hit by a weapon.
	-- https://pzwiki.net/wiki/Modding:Lua_Events/OnWeaponHitCharacter
	OnWeaponHitCharacter = function (wielder, character, handWeapon, damage)
		config.debug("OnWeaponHitCharacter", {
			{ name = "wielder", value = wielder },
			{ name = "character", value = character },
			{ name = "handWeapon", value = handWeapon },
			{ name = "damage", value = damage },
		})
	end,

	-- OnWeaponHitTree
	--
	-- Triggered when a character hits a tree with a hand weapon.
	-- https://pzwiki.net/wiki/Modding:Lua_Events/OnWeaponHitTree
	OnWeaponHitTree = function (character, handWeapon)
		config.debug("OnWeaponHitTree", {
			{ name = "character", value = character },
			{ name = "handWeapon", value = handWeapon },
		})
	end,

	-- OnWeaponHitXp
	--
	-- Triggered when a player is gaining XP for a successful hit.
	-- https://pzwiki.net/wiki/Modding:Lua_Events/OnWeaponHitXp
	OnWeaponHitXp = function (player, handWeapon, character, damageSplit)
		config.debug("OnWeaponHitXp", {
			{ name = "player", value = player },
			{ name = "handWeapon", value = handWeapon },
			{ name = "character", value = character },
			{ name = "damageSplit", value = damageSplit },
		})
	end,

	-- OnWeaponSwing
	--
	-- Triggered when a player swings a hand weapon.
	-- https://pzwiki.net/wiki/Modding:Lua_Events/OnWeaponSwing
	OnWeaponSwing = function (character, handWeapon)
		config.debug("OnWeaponSwing", {
			{ name = "character", value = character },
			{ name = "handWeapon", value = handWeapon },
		})
	end,

	-- OnWeaponSwingHitPoint
	--
	-- Triggered when a hand weapon has reached the apex of its swing.
	-- https://pzwiki.net/wiki/Modding:Lua_Events/OnWeaponSwingHitPoint
	OnWeaponSwingHitPoint = function (character, handWeapon)
		config.debug("OnWeaponSwingHitPoint", {
			{ name = "character", value = character },
			{ name = "handWeapon", value = handWeapon },
		})
	end,

	-- OnWorldMessage
	--
	-- Triggered when a world message is being received.
	-- https://pzwiki.net/wiki/Modding:Lua_Events/OnWorldMessage
	OnWorldMessage = function (user, message, addLocal, addTimestamp)
		config.debug("OnWorldMessage", {
			{ name = "user", value = user },
			{ name = "message", value = message },
			{ name = "addLocal", value = addLocal },
			{ name = "addTimestamp", value = addTimestamp },
		})
	end,

	-- OnZombieDead
	--
	-- Triggered when a zombie dies.
	-- https://pzwiki.net/wiki/Modding:Lua_Events/OnZombieDead
	OnZombieDead = function (zombie)
		config.debug("OnZombieDead", {
			{ name = "zombie", value = zombie },
		})
	end,

	-- OnZombieUpdate
	--
	-- Triggered when a zombie is being updated.
	-- https://pzwiki.net/wiki/Modding:Lua_Events/OnZombieUpdate
	OnZombieUpdate = function (zombie)
		config.debug("OnZombieUpdate", {
			{ name = "zombie", value = zombie },
		})
	end,

	-- ReceiveFactionInvite
	--
	-- Triggered when a player is invited to join a faction.
	-- https://pzwiki.net/wiki/Modding:Lua_Events/ReceiveFactionInvite
	ReceiveFactionInvite = function (factionName, playerName)
		config.debug("ReceiveFactionInvite", {
			{ name = "factionName", value = factionName },
			{ name = "playerName", value = playerName },
		})
	end,

	-- ReceiveSafehouseInvite
	--
	-- Triggered when a player is invited to a safehouse.
	-- https://pzwiki.net/wiki/Modding:Lua_Events/ReceiveSafehouseInvite
	ReceiveSafehouseInvite = function (safeHouse, playerName)
		config.debug("ReceiveSafehouseInvite", {
			{ name = "safeHouse", value = safeHouse },
			{ name = "playerName", value = playerName },
		})
	end,

	-- RequestTrade
	--
	-- Triggered when a character is requesting a trade with another character.
	-- https://pzwiki.net/wiki/Modding:Lua_Events/RequestTrade
	RequestTrade = function (player)
		config.debug("RequestTrade", {
			{ name = "player", value = player },
		})
	end,

	-- ReuseGridsquare
	--
	-- Triggered when a grid square is being reused.
	-- https://pzwiki.net/wiki/Modding:Lua_Events/ReuseGridsquare
	ReuseGridsquare = function (square)
		config.debug("ReuseGridsquare", {
			{ name = "square", value = square },
		})
	end,

	-- SendCustomModData
	--
	-- Triggered when the game server is sending custom ModData to the client.
	-- https://pzwiki.net/wiki/Modding:Lua_Events/SendCustomModData
	SendCustomModData = function ()
		config.debug("SendCustomModData", {})
	end,

	-- ServerPinged
	--
	-- Triggered when the game client receives the response after intiating a ping to a server.
	-- https://pzwiki.net/wiki/Modding:Lua_Events/ServerPinged
	ServerPinged = function (ipAddress, user)
		config.debug("ServerPinged", {
			{ name = "ipAddress", value = ipAddress },
			{ name = "user", value = user },
		})
	end,

	-- SwitchChatStream
	--
	-- Triggered when a user presses TAB on his keyboard to switch chat stream.
	-- https://pzwiki.net/wiki/Modding:Lua_Events/SwitchChatStream
	SwitchChatStream = function ()
		config.debug("SwitchChatStream", {})
	end,

	-- SyncFaction
	--
	-- Triggered when a faction is being synced by the server on client side.
	-- https://pzwiki.net/wiki/Modding:Lua_Events/SyncFaction
	SyncFaction = function (factionName)
		config.debug("SyncFaction", {
			{ name = "factionName", value = factionName },
		})
	end,

	-- TradingUIAddItem
	--
	-- Triggered when a player adds an item to a trade.
	-- https://pzwiki.net/wiki/Modding:Lua_Events/TradingUIAddItem
	TradingUIAddItem = function (player, inventoryItem)
		config.debug("TradingUIAddItem", {
			{ name = "player", value = player },
			{ name = "inventoryItem", value = inventoryItem },
		})
	end,

	-- TradingUIRemoveItem
	--
	-- Triggered when a player removes an item from a trade.
	-- https://pzwiki.net/wiki/Modding:Lua_Events/TradingUIRemoveItem
	TradingUIRemoveItem = function (player, itemIndex)
		config.debug("TradingUIRemoveItem", {
			{ name = "player", value = player },
			{ name = "itemIndex", value = itemIndex },
		})
	end,

	-- TradingUIUpdateState
	--
	-- Triggered when a player updates the item state of a trade.
	-- https://pzwiki.net/wiki/Modding:Lua_Events/TradingUIUpdateState
	TradingUIUpdateState = function (player, itemIndex)
		config.debug("TradingUIUpdateState", {
			{ name = "player", value = player },
			{ name = "itemIndex", value = itemIndex },
		})
	end,

	-- ViewTickets
	--
	-- Triggered when the game client is receiving tickets from the server.
	-- https://pzwiki.net/wiki/Modding:Lua_Events/ViewTickets
	ViewTickets = function (tickets)
		config.debug("ViewTickets", {
			{ name = "tickets", value = tickets },
		})
	end,

	-- onLoadModDataFromServer
	--
	-- Triggered after ModData has been received from the server.
	-- https://pzwiki.net/wiki/Modding:Lua_Events/onLoadModDataFromServer
	onLoadModDataFromServer = function (square)
		config.debug("onLoadModDataFromServer", {
			{ name = "square", value = square },
		})
	end,
}

return callbacks