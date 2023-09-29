function love.load()
   
  pallet1 = 
  {
    x = 750,
    y = 50,
    width = 10,
    height = 150,
    speed = 10
  }
    
  pallet2 =
  {
    x = 50,
    y = 50,
    width = 10,
    height = 150,
    speed = 10
  }
   
end


function love.update(dt)
  
  if love.keyboard.isDown("up") then
    pallet1.y = pallet1.y - pallet1.speed
    
  elseif love.keyboard.isDown("down") then
    pallet1.y = pallet1.y + pallet1.speed
      
  end

  if love.keyboard.isDown("w") then
    pallet2.y = pallet2.y - pallet2.speed
    
  elseif love.keyboard.isDown("s") then
    pallet2.y = pallet2.y + pallet2.speed

  end

end

function love.draw()
  
  love.graphics.rectangle("line", pallet1.x, pallet1.y, pallet1.width, pallet1.height)
  
  love.graphics.rectangle("line", pallet2.x, pallet2.y, pallet2.width, pallet2.height)

end