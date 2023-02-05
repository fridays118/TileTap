function isEmpty(x, y)

	--floor
	if tilemap[y][x] == 0 or tilemap[y][x] == 6 then
    return true
	end
	--tree
	if tilemap[y][x] == 3 then
		takeEnergy(10)
		cameraShake()
		psystem:emit(6)
		reasources.stick = reasources.stick + math.random(0,1)
		if player.hasAxe == true then
			reasources.wood = reasources.wood + math.random(1,3)
		end
		return false
	end
	--rock
	if tilemap[y][x] == 2 then
		takeEnergy(10)
		cameraShake()
		psystem:emit(6)
		reasources.flint = reasources.flint + math.random(1,2)
		if player.hasPickaxe == true then
			reasources.stone = reasources.stone + math.random(1,7)
			if math.random(1,6) == 1 then
				reasources.iron = reasources.iron + math.random(1,7)
			end
		end
		return false
	end
	--plant
	if tilemap[y][x] == 4 then
		takeEnergy(5)
		psystem:emit(6)
		reasources.fiber = reasources.fiber + math.random(1,5)
		if player.hunger == 100 then
			tilemap[y][x] = 6
			reasources.food = reasources.food + 1
			return true
		end
		if player.hunger < 100 then
			tilemap[y][x] = 6
			foodAmt = math.random(5,10)
			if player.hunger + foodAmt > 100 then
				player.hunger = 100
			else
				player.hunger = player.hunger + foodAmt
			end
    return true
		else
			return false
		end
	end
	--water
	if tilemap[y][x] == 5 then
		takeEnergy(5)
		psystem:emit(6)
		if hasPouch == true then
			if reasources.water < 50 then
				reasources.water = 50
			end
		end
		if player.thirst < 100 then
			if player.thirst + 10 > 100 then
				player.thirst = 100
			else
				player.thirst = player.thirst + 10
			end
		end
	end

	--tent
	if tilemap[y][x] == 7 then
		sleep(2)
		return true
	end
	--home
	if tilemap[y][x] == 8 then
		sleep(1)
		return false
	end
	--farm
	if tilemap[y][x] == 9 then
		takeEnergy(50)
		psystem:emit(6)
		if player.hunger + 50 > 100 then
			player.hungner = 100
		else
			player.hunger = player.hunger + 50
		end
		return false
	end
	--well
	if tilemap[y][x] == 10 then
		takeEnergy(50)
		psystem:emit(6)
		player.thirst = 100
		return false
	end
	if tilemap[y][x] == 11 then
		--fin
		return false
	end

end






--saveLoad
function saveGame()
	data = {}
	data.player = player
	data.reasources = reasources
	data.buildings = buildings
	serialized = lume.serialize(data)
  love.filesystem.write("savedata.txt", serialized)
end
function dataLoad()
	file = love.filesystem.read("savedata.txt")
  data = lume.deserialize(file)
	if data.player.newP == false then
	player = data.player
	reasources = data.reasources
	buildings = data.buildings
	end
end


--making a new map
function newMap()
tilemap = {
		{1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1},
    {1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 1},
		{1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1},
		{1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1},
		{1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1},
		{1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1},
		{1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1},
		{1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1},
		{1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1},
		{1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1},
		{1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1},
		{1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1},
		{1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1},
		{1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1},
		{1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1},
		{1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1},
		{1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1},
		{1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1},
		{1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1},
		{1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1},
		{1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1},
    }
	make_lightWorld()

	--single spawn
	nodeSingleSpawn()
	--more than 1 spawn
	for i=1,math.random(1,4) do
		nodeSpawn()
	end

	if buildings.hasTent == true and buildings.hasHome == false then
		tilemap[player.tile_y - 1][player.tile_x - 1] = 7
	end
	if buildings.hasHome == true then
		tilemap[player.tile_y - 1][player.tile_x - 1] = 8
		houseTile.y = player.tile_y - 1
		houseTile.x = player.tile_x - 1

	end
	if buildings.hasFarm == true then
		tilemap[player.tile_y + 1][player.tile_x - 1] = 9
	end
	if buildings.hasWell == true then
		tilemap[player.tile_y + 1][player.tile_x + 1] = 10
	end
	
end

--a multispawning node
function nodeSpawn()
	rockNodex = math.random(2,20)
	rockNodey = math.random(2,20)
	treeNodex = math.random(2,20)
	treeNodey = math.random(2,20)
	plantNodex = math.random(2,20)
	plantNodey = math.random(2,20)

	if tilemap[rockNodex][rockNodey] == 0 and tilemap[treeNodex][treeNodey] == 0 and tilemap[plantNodex][plantNodey] == 0 then
		tilemap[rockNodex][rockNodey] = 2
		tilemap[treeNodex][treeNodey] = 3
		tilemap[plantNodex][plantNodey] = 4

		lw[rockNodex][rockNodey - 1] = 2
		lw[rockNodex][rockNodey - 2] = 1
		lw[treeNodex][treeNodey - 1] = 3
		lw[treeNodex][treeNodey - 2] = 2
		lw[treeNodex][treeNodey - 3] = 1
		lw[plantNodex][plantNodey - 1] = 1
	else
		newMap()
	end
end

--a single spawning node
function nodeSingleSpawn()
	puddleNodex = math.random(2,20)
	puddleNodey = math.random(2,20)

	if tilemap[puddleNodex][puddleNodey] == 0 then
		tilemap[puddleNodex][puddleNodey] = 5
	else
		newMap()
	end
end