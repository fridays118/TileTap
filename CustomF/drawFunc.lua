--drawing the map
function drawMap()
	for i,row in ipairs(tilemap) do
		for j,tile in ipairs(row) do

			--wall2
			if tile == -1 then
				love.graphics.draw(dirtWall,j*tileSize,i*tileSize)
			end
			if tile == 0 then
				love.graphics.draw(ground,j*tileSize,i*tileSize)
			end
			--wall
			if tile == 1 then
				love.graphics.draw(grassWall,j*tileSize,i*tileSize)
			end
			--rock
			if tile == 2 then
				love.graphics.draw(ground,j*tileSize,i*tileSize)
				love.graphics.draw(rock,j*tileSize,i*tileSize)
			end
			--tree
			if tile == 3 then
				love.graphics.draw(ground,j*tileSize,i*tileSize)
				love.graphics.draw(tree,j*tileSize,i*tileSize)
			end
			--plant
			if tile == 4 then
				love.graphics.draw(ground,j*tileSize,i*tileSize)
				love.graphics.draw(plant,j*tileSize,i*tileSize)
			end
			--water
			if tile == 5 then
				love.graphics.draw(ground,j*tileSize,i*tileSize)
				love.graphics.draw(water,j*tileSize,i*tileSize)
			end
			--dead plant
			if tile == 6 then
				love.graphics.draw(ground,j*tileSize,i*tileSize)
				love.graphics.draw(dead_plant,j*tileSize,i*tileSize)
			end
			--tent
			if tile == 7 then
				love.graphics.draw(ground,j*tileSize,i*tileSize)
				love.graphics.draw(tent,j*tileSize,i*tileSize)
			end
			--home
			if tile == 8 then
				love.graphics.draw(ground,j*tileSize,i*tileSize)
				love.graphics.draw(home,j*tileSize,i*tileSize)
			end
			--farm
			if tile == 9 then
				love.graphics.draw(ground,j*tileSize,i*tileSize)
				love.graphics.draw(farm,j*tileSize,i*tileSize)
			end
			--well
			if tile == 10 then
				love.graphics.draw(ground,j*tileSize,i*tileSize)
				love.graphics.draw(well,j*tileSize,i*tileSize)
			end
			--reaserch center
			if tile == 11 then
				love.graphics.draw(ground,j*tileSize,i*tileSize)
				love.graphics.rectangle("fill",j*tileSize,i*tileSize,tileSize,tileSize)
			end
			
		end
	end
	
end

--drawing the inventory
function drawInv()
	love.graphics.rectangle("line",9,9,380,400)
		--data
		love.graphics.printf("Gold: "..reasources.gold,0,15,screenx,"center")
		love.graphics.printf("Wood: "..reasources.wood,0,30,screenx,"center")
		love.graphics.printf("Stone: "..reasources.stone,0,45,screenx,"center")
		love.graphics.printf("Iron: "..reasources.iron,0,60,screenx,"center")
		love.graphics.printf("Food: "..reasources.food,0,75,screenx,"center")
		love.graphics.printf("Water: "..reasources.water,0,90,screenx,"center")
	love.graphics.printf("Fiber: "..reasources.fiber,0,105,screenx,"center")
	love.graphics.printf("Sticks: "..reasources.stick,0,120,screenx,"center")
	love.graphics.printf("Flint: "..reasources.fiber,0,135,screenx,"center")
		--more data
		love.graphics.printf("Day: "..world.day,0,350,screenx,"center")
		love.graphics.printf("Level: "..reasources.level,0,365,screenx,"center")
		--crafting
		bx = 10
		by = 10
		for i=1,13 do
			love.graphics.rectangle("line",bx,by,110,20)
			by = by + 30
		end
	--craft text
	if player.hasAxe == false then
	love.graphics.print("[] Axe",11,15)
	else
		love.graphics.print("[X] Axe",11,15)
	end
	if player.hasPickaxe == false then
	love.graphics.print("[] Pickaxe",11,45)
	else
		love.graphics.print("[X] Pickaxe",11,45)
	end
	if player.hasHammer == false then
	love.graphics.print("[] Hammer",11,75)
	else
		love.graphics.print("[X] Hammer",11,75)
	end
	if player.hasPouch == false then
	love.graphics.print("[] Pouch",11,105)
	else
		love.graphics.print("[X] Pouch",11,105)
	end
	--craft hammer text
	if player.hasHammer == true then
		if buildings.hasTent == false then
	love.graphics.print("[] Tent",11,135)
		else
love.graphics.print("[X] Tent",11,135)
		end

	if buildings.hasHome == false then
	love.graphics.print("[] Home",11,165)
		else
	love.graphics.print("[X] Home",11,165)
		end
		if buildings.hasFarm == false then
	love.graphics.print("[] Farm",11,195)
		else
love.graphics.print("[X] Farm",11,195)
		end
				if buildings.hasWell == false then
	love.graphics.print("[] Well",11,225)
		else
love.graphics.print("[X] Well",11,225)
		end
	love.graphics.print("[] Reaserch Center",11,255)
	end

	colorStart(0,0,0,100)
			love.graphics.rectangle("fill",240,20,140,300)
			colorEnd()
		if cursor.y == 10 then
			love.graphics.printf("2 flint",170,30,280,"center")
			love.graphics.printf("2 stick",170,50,280,"center")
			love.graphics.printf("2 fiber",170,70,280,"center")
		end
		if cursor.y == 40 then
			love.graphics.printf("3 flint",170,30,280,"center")
			love.graphics.printf("2 stick",170,50,280,"center")
			love.graphics.printf("1 fiber",170,70,280,"center")
		end
		if cursor.y == 70 then
			love.graphics.printf("3 stone",170,30,280,"center")
			love.graphics.printf("2 wood",170,50,280,"center")
			love.graphics.printf("2 fiber",170,70,280,"center")
		end
		if cursor.y == 100 then
			love.graphics.printf("10 fiber",170,30,280,"center")
		end
	--hammer
	if player.hasHammer == true then
		--tent
		if cursor.y == 130 then
			love.graphics.printf("20 fiber",170,30,280,"center")
			love.graphics.printf("4 wood",170,50,280,"center")
		end
		--home
		if cursor.y == 160 then
			love.graphics.printf("20 fiber",170,30,280,"center")
			love.graphics.printf("20 wood",170,50,280,"center")
			love.graphics.printf("10 stone",170,70,280,"center")
		end
		--farm
	if cursor.y == 190 then
			love.graphics.printf("10 fiber",170,30,280,"center")
			love.graphics.printf("30 wood",170,50,280,"center")
			love.graphics.printf("5 stone",170,70,280,"center")
		end
		--well
	if cursor.y == 220 then
			love.graphics.printf("5 fiber",170,30,280,"center")
			love.graphics.printf("10 wood",170,50,280,"center")
			love.graphics.printf("30 stone",170,70,280,"center")
		end
		--resCen
	if cursor.y == 250 then
		love.graphics.printf("finish",170,30,280,"center")
	end

	end
	
	

	
		love.graphics.rectangle("line",cursor.x,cursor.y,120,20)
end

--Color setting
function colorStart(r,g,b,a)
love.graphics.push("all")
love.graphics.setColor(r,g,b,a)
end
function colorEnd()
love.graphics.setColor(1, 1, 1, 1)
love.graphics.pop()
end