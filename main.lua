function love.load()
  BgGridX = -96
  MenuSelection = "mainmenu"
  MenuOption = 0

  -- asset setup
  love.graphics.setDefaultFilter("nearest", "nearest")
  BgGridImage = love.graphics.newImage("assets/sprites/lines.png")
  MenuUILogo = love.graphics.newImage("assets/sprites/logo.png")
  BgMenuSplash = love.graphics.newImage("assets/sprites/splash.png")
  Font = love.graphics.newImageFont("/assets/sprites/font.png"," abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789.,!?-+/():;%&`'*#=[]\"")
  love.graphics.setFont(Font)
  
  MenuMusic = love.audio.newSource("/assets/music/menu.mp3", "stream")
  MenuMusic:setLooping(true)
  --MenuMusic:play() just so i can hear my own music for now

  -- menu thing so it loops
  if MenuOption == -1 then
    MenuOption = 2
  elseif MenuOption == 3 then
    MenuOption = 0
  end
end

function love.update(dt)
  -- background grid
  BgGridX = BgGridX + 7 * dt
  if BgGridX < 0 then
	BgGridX = BgGridX + 7 * dt
	else
	BgGridX = -96
  end

  function love.keypressed(key, scancode, isrepeat)
    -- while in menu
    if key == "down" and MenuSelection == "mainmenu" then
      MenuOption = MenuOption + 1
    end
    if key == "up" and MenuSelection == "mainmenu" then
      MenuOption = MenuOption - 1
    end
    if key == "return" and MenuSelection == "mainmenu" and MenuOption == 2 then
      love.event.quit()
    end
    -- just to make my life better
   if key == "escape" then
      love.event.quit()
   end
end
  
  
end

function love.draw()
	love.graphics.draw(BgMenuSplash, 0, 0)
  for i=0,5 do
    love.graphics.draw(BgGridImage, BgGridX, (i*144), 0, 1.5, 1.5)
  end
  love.graphics.draw(MenuUILogo, 10, 10, 0, 2, 2) 
  if MenuOption == 0 then -- this can probably optimized, not sure how yet
  love.graphics.setColor(0, 1, 0)
  love.graphics.print("Play", 800/16, 600/2)
  love.graphics.setColor(1, 1, 1)
  end
  if MenuOption == 1 then
  love.graphics.setColor(0, 1, 0)
  love.graphics.print("Settings", 800/16, 600/2+20)
  love.graphics.setColor(1, 1, 1)
  end
  if MenuOption == 2 then
  love.graphics.setColor(0, 1, 0)
  love.graphics.print("Quit", 800/16, 600/2+40)
  love.graphics.setColor(1, 1, 1)
  end
end