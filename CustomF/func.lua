--importing everything
function import()
	
	--Background
	bg = love.graphics.newImage("Art/Background/bg.png")
	bagBG = love.graphics.newImage("Art/Background/bagBG.png")
	coverBG = love.graphics.newImage("Art/Background/coverBG.png")
	sleepBG = love.graphics.newImage("Art/Background/sleepBG.png")
	--Icon
	BackpackIco = love.graphics.newImage("Art/Icon/BackpackIco.png")
	waterIco = love.graphics.newImage("Art/Icon/waterIco.png")
	foodIco = love.graphics.newImage("Art/Icon/foodIco.png")
	sleepIco = love.graphics.newImage("Art/Icon/sleepIco.png")
	energyIco = love.graphics.newImage("Art/Icon/energyIco.png")
	craftBG = love.graphics.newImage("Art/Icon/energyIco.png")
	--Map
	dirtWall = love.graphics.newImage("Art/Map/dirtWall.png")
	grassWall = love.graphics.newImage("Art/Map/grassWall.png")
	ground = love.graphics.newImage("Art/Map/ground4.png")
	--Sprite
	plant = love.graphics.newImage("Art/Sprite/plant.png")
	rock = love.graphics.newImage("Art/Sprite/rock.png")
	tree = love.graphics.newImage("Art/Sprite/tree.png")
	water = love.graphics.newImage("Art/Sprite/water.png")
	dead_plant = love.graphics.newImage("Art/Sprite/dead_plant.png")
	mc = love.graphics.newImage("Art/Sprite/mc2.png")
	--Buildings
	farm = love.graphics.newImage("Art/Buildings/farm.png")
	home = love.graphics.newImage("Art/Buildings/home.png")
	tent = love.graphics.newImage("Art/Buildings/tent.png")
	well = love.graphics.newImage("Art/Buildings/farm.png")
	--Font
	default = love.graphics.newFont("Font/yoster.ttf", 10)
	middle = love.graphics.newFont("Font/yoster.ttf", 20)
	title = love.graphics.newFont("Font/yoster.ttf", 35)
	--Audio

	--particle
	nodeHit = love.graphics.newImage("Art/Sprite/nodeHit.png")
	smokeP = love.graphics.newImage("Art/Sprite/smokeP.png")


	
end

function cameraShake()
	local orig_x, orig_y = camera:position()
	local strength = 2.5
	shaking = true
	Timer.during(.1, function()
    camera:lookAt(orig_x + math.random(-strength,strength), orig_y + math.random(-strength,strength))
end, function()
    -- reset camera position
    camera:lookAt(orig_x, orig_y)
			shaking = false
end)
end

function sleep(lvl)
	--change transBox
		Timer.script(function(wait)
			player.canMove = false
			player.canUseKeys = false
			cameraShake()
			transBox = 40
	    wait(.1)
	    transBox = 80
	    wait(.2)
	    transBox = 100
			wait(.3)
	    transBox = 200
			wait(.4)
			newMap()
			world.day = world.day + 1
			if lvl == 1 then
				player.thirst = player.thirst - 5
				player.hunger = player.hunger - math.random(1,5)
				player.energy = 250
			end
			if lvl == 2 then
				player.thirst = player.thirst - 10
				player.hunger = player.hunger - math.random(3,5)
				player.energy = 200
			end
			if lvl == 3 then
				player.thirst = player.thirst - 15
				player.hunger = player.hunger - math.random(5,10)
				player.energy = 150
			end
			if lvl == 4 then
				player.thirst = player.thirst - 25
				player.hunger = player.hunger - math.random(10,15)
				player.energy = 100
			end
			wait(.5)
	    transBox = 100
			wait(.6)
	    transBox = 80
			wait(.7)
	    transBox = 20
			wait(.8)
	    transBox = 0
			player.canMove = true
			player.canUseKeys = true
			
	end)
end

function bootUp()
	player = {tile_x = 3,tile_y = 3,thirst = 100,hunger = 100,newP = true,hasAxe = false,hasPickaxe = false, hasHammer = false, hasPouch = false, energy = 150,tx = 3,ty = 3,canMove = true,canUseKeys = true}
	reasources = {gold = 0,wood = 0, stone = 0, level = 0, exp = 0, iron = 0, food = 0, water = 0, fiber = 0, stick = 0, flint = 0}
	world = {day = 1}
	cursor = {x = 10,y = 10}
	buildings = {hasTent = false, hasHome = false, hasFarm = false, hasWell = false}
end

function trans()
	--change transBox
		Timer.script(function(wait)
			player.canMove = false
			player.canUseKeys = false
			transBox = 200
	    wait(.1)
	    transBox = 150
	    wait(.2)
	    transBox = 100
			wait(.3)
	    transBox = 50
			wait(.4)
			transBox = 40
			wait(.5)
	    transBox = 30
			wait(.6)
	    transBox = 20
			wait(.7)
	    transBox = 10
			wait(.8)
	    transBox = 0
			player.canMove = true
			player.canUseKeys = true
			
	end)
end