function love.load()	
	require "CustomF/func"
	require "CustomF/drawFunc"
	require "CustomF/playerFunc"
	require "CustomF/worldFunc"
	require "CustomF/lightWorld"
	Camera = require "Lib/camera"
	lume = require "Lib/lume"
	Timer = require "Lib/timer"

	import()


	love.graphics.setDefaultFilter('nearest','nearest')
	love.window.setTitle("Tile Tap")
	screenx = 400
	screeny = 460
	love.window.setMode(screenx, screeny)

	bootUp()

	
	camera = Camera(200,190)

	tileSize = 16

	screen = "start"

	--accesibility
	acc = false

	transBox = 0

	--part
	psystem = love.graphics.newParticleSystem(nodeHit, 32)
	psystem:setParticleLifetime(1, 2) -- Particles live at least 2s and at most 5s.
	psystem:setLinearAcceleration(-30,-30,30,30) -- Randomized movement towards the bottom of the screen.
	psystem:setColors(255, 255, 255, 255, 255, 255, 255, 0) -- Fade to black
	
	smoke = love.graphics.newParticleSystem(smokeP, 32)
	smoke:setParticleLifetime(1, 5) -- Particles live at least 2s and at most 5s.
	--smoke:setLinearAcceleration(-30,-30,30,30)
	smoke:setLinearAcceleration(0,0,10,10) -- Randomized movement towards the bottom of the screen.
	smoke:setColors(255, 255, 255, 255, 255, 255, 255, 0) -- Fade to black.

	consoleTimer = 100

	shaking = false

	houseTile = {x = 1, y = 1}
end

function love.update(dt)
	consoleTimer = consoleTimer - 1
	if consoleTimer <= 0 then
		print(screen)
		if buildings.hasHome == true then
			smoke:emit(10)
		end
		
		consoleTimer = 100
	end
	
	Timer.update(dt)
	psystem:update(dt)
	smoke:update(dt)

	if shaking == false then
	if acc == true then
		camera:zoomTo(1.6)
		camera:lookAt(player.tile_x * tileSize + 20,player.tile_y * tileSize)
	end
	if acc == false then
		camera:zoomTo(1)
		camera:lookAt(200,190)
	end
	end

	
end

function love.draw()
	love.graphics.clear(21,71,52)
	if screen == "start" then
		--love.graphics.draw(coverBG,0,-40)
		love.graphics.draw(coverBG,0,0)
		love.graphics.setFont(title)
		love.graphics.printf("Tile Tap!",0,30,screenx,"center")
		love.graphics.setFont(middle)
		love.graphics.printf("[1] New Save",0,100,screenx,"center")
		love.graphics.printf("[2] Continue",0,130,screenx,"center")
		love.graphics.setFont(default)
		love.graphics.printf("Made By Fridays18",0,300,screenx,"center")
	end
	if screen == "inv" then
		love.graphics.draw(bagBG,0,-10)
		love.graphics.setFont(default)
		drawInv()
	end
	camera:attach()
	if screen == "game" then
		love.graphics.setFont(default)
		love.graphics.draw(bg,0,-40)


		if acc == false then
	--ui boxes
	love.graphics.draw(BackpackIco,16,-30)
		love.graphics.print("M",32,-14)
		love.graphics.draw(sleepIco,48,-30)
		love.graphics.print("P",64,-14)

	--text lower
	--love.graphics.print("Thirst: "..player.thirst.." ".."Hunger: "..player.hunger,17,390)
	love.graphics.draw(foodIco,16,360)
	love.graphics.print(player.hunger,30,364)
	love.graphics.draw(waterIco,16,390)
	love.graphics.print(player.thirst,30,394)
	love.graphics.draw(energyIco,64,360)
	love.graphics.print(player.energy,80,364)

		end
		--map
	drawMap()
		
		if acc == true then
			colorStart(0,0,0,100)
			love.graphics.rectangle("fill",player.tile_x * tileSize, player.tile_y * tileSize - 10,120,20,5,5)
			colorEnd()
			love.graphics.print("H: "..player.hunger.."  T: "..player.thirst.."  E: "..player.energy,player.tile_x * tileSize, player.tile_y * tileSize - 10)
		end

	--player draw
		love.graphics.draw(mc, player.tile_x * tileSize, player.tile_y * tileSize)
	--love.graphics.rectangle("fill", player.tile_x * tileSize, player.tile_y * tileSize,tileSize,tileSize)
		love.graphics.draw(psystem, player.tile_x * tileSize + 8, player.tile_y * tileSize + 8)

		draw_lightWorld()
		
		love.graphics.draw(smoke, houseTile.x * tileSize + 8, houseTile.y * tileSize - 1)

	end

	love.graphics.print(tostring(love.timer.getFPS( )), 340, 400)

	camera:detach()
	colorStart(0,0,0,transBox)
			love.graphics.rectangle("fill",0,0,500,500)
			colorEnd()
end
