
function love.keypressed(key)
	if key == "u" then
		smoke:emit(10)
	end
	--start screen
	if screen == "start" then
		keyStart(key)
	end
	
	--inventory
	if screen == "inv" then
		keyInv(key)
		
	end

	if screen == "game" then
		if player.canUseKeys == true then
		if player.canMove == true then
		keyMain(key)
		keyConfig(key)
			end
			
		end
	end
	
end
	
--taking energy
function takeEnergy(amount)
	if player.energy - amount > 0 then
		player.energy = player.energy - amount
	else
		sleep(4)
	end
end


	--keys
function keyStart(key)
if key == "1" then
		trans()
			bootUp()
			saveGame()
			dataLoad()
			newMap()
			screen = "game"
		end
		if key == "2" then
		trans()
			dataLoad()
			newMap()
			screen = "game"
		end
end

function keyMain(key)
	local d = "nill"
	
if key == "m" then
	screen = "inv"
	end

		
		if key == "p" then
			sleep(3)
		end
		
		--set the vars x and y to the players pos
    local x = player.tile_x
    local y = player.tile_y
	
		--moving the local x's and y's
    if key == "left" or key == "a" then
        x = x - 1
			takeEnergy(5)
		d = "xL"
    elseif key == "right" or key == "d" then
        x = x + 1
			takeEnergy(5)
		d = "xR"
    elseif key == "up" or key == "w" then
        y = y - 1
			takeEnergy(5)
		d = "yU"
    elseif key == "down" or key == "s" then
        y = y + 1
			takeEnergy(5)
		d = "yD"
    end

	
    if isEmpty(x, y) then
		player.canMove = false
		if d == "xL" then
			player.tile_x = player.tile_x - .5
		end
		if d == "xR" then
			player.tile_x = player.tile_x + .5
		end
		if d == "yU" then
			player.tile_y = player.tile_y - .5
		end
		if d == "yD" then
			player.tile_y = player.tile_y + .5
		end
				Timer.after(.1, function()
        player.tile_x = x
        player.tile_y = y
				saveGame()
				player.newP = false
				player.canMove = true
				  end)
    end
end

function keyConfig(key)
	--acc setting
	if key == "f9" or key == "9" then
		if acc == true then
			acc = false
		else
			acc = true
		end
	end
end

function keyInv(key)
	if key == 'escape' then
		print('e')
		screen = "game"
		print(screen)
	end
	
	if key == "enter" or key == "space" then
			
			--axe
			if cursor.y == 10 then
				if reasources.flint >= 2 and reasources.stick >= 2 and reasources.fiber >= 2 and player.hasAxe == false then
					reasources.flint = reasources.flint - 2
					reasources.stick = reasources.stick - 2
					reasources.fiber = reasources.fiber - 2
					player.hasAxe = true
				end
			end
			--Pickaxe
			if cursor.y == 40 then
				if reasources.flint >= 3 and reasources.stick >= 2 and reasources.fiber >= 1 and player.hasPickaxe == false then
					reasources.flint = reasources.flint - 3
					reasources.stick = reasources.stick - 2
					reasources.fiber = reasources.fiber - 1
					player.hasPickaxe = true
				end
			end
			--Hammer
			if cursor.y == 70 then
				if reasources.stone >= 3 and reasources.wood >= 2 and reasources.fiber >= 2 and player.hasHammer == false then
					reasources.stone = reasources.stone - 3
					reasources.wood = reasources.wood - 2
					reasources.fiber = reasources.fiber - 2
					player.hasHammer = true
				end
			end
			--Pouch
			if cursor.y == 100 then
				if reasources.fiber >= 10 and player.hasPouch == false then
					reasources.fiber = reasources.fiber - 10
					player.hasPouch = true
				end
			end
			if player.hasHammer == true then
			--Tent
			if cursor.y == 130 then
				if reasources.fiber >= 20 and reasources.wood >= 4 and buildings.hasTent == false then
					reasources.fiber = reasources.fiber - 10
					buildings.hasTent = true
					sleep(2)
				end
			end
			--House
			if cursor.y == 160 then
				if reasources.stone >= 10 and reasources.wood >= 20 and reasources.fiber >= 20 and buildings.hasHome == false then
					reasources.stone = reasources.stone - 10
					reasources.wood = reasources.wood - 20
					reasources.fiber = reasources.fiber - 20
					buildings.hasHome = true
					sleep(1)
				end
			end
			--Farm
			if cursor.y == 190 then
				if reasources.stone >= 5 and reasources.wood >= 30 and reasources.fiber >= 10 and buildings.hasFarm == false then
					reasources.stone = reasources.stone - 5
					reasources.wood = reasources.wood - 30
					reasources.fiber = reasources.fiber - 10
					buildings.hasFarm = true

						if building.hasTent == true or building.hasHouse == true then
							sleep(1)
						end
				end
			end
			--Well
			if cursor.y == 220 then
				if reasources.stone >= 30 and reasources.wood >= 10 and reasources.fiber >= 5 and buildings.hasWell == false then
					reasources.stone = reasources.stone - 30
					reasources.wood = reasources.wood - 10
					reasources.fiber = reasources.fiber - 5
					buildings.hasWell = true
						if building.hasTent == true or building.hasHouse == true then
							sleep(1)
						end
				end
			end

			end

			
			
		end
		
 		if key == "up" or key == "w" then
			if cursor.y > 10 then
        cursor.y = cursor.y - 30
			end
    elseif key == "down" or key == "s" then
			if cursor.y < 370 then
        cursor.y = cursor.y + 30
			end
    end
end
