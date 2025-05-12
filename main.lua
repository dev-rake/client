function love.load()
  BgGridX = -96
  BgGridY = 0
  love.graphics.setDefaultFilter("nearest", "nearest")
  BgGridImage = love.graphics.newImage("assets/sprites/lines.png")
  MenuUILogo = love.graphics.newImage("assets/sprites/logo.png")
  BgMenuSplash = love.graphics.newImage("assets/sprites/splash.png")
  MenuMusic = love.audio.newSource("/assets/music/deep.wav", "stream")
  MenuMusic:setLooping(true)
  MenuMusic:play()
end

function love.update(dt)
  BgGridX = BgGridX + 7 * dt --poruszanie tla
  if BgGridX < 0 then
	BgGridX = BgGridX + 7 * dt
	else
	BgGridX = -96
  end
end

function love.draw()
	love.graphics.draw(BgMenuSplash, 0, 0)
  for i=0,5 do
    love.graphics.draw(BgGridImage, BgGridX, (i*144), 0, 1.5, 1.5) --x, y, rotacja, skala x, skala y
  end
  love.graphics.draw(MenuUILogo, 10, 10, 0, 2, 2)
end