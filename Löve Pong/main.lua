function love.load()
   
  screenWidth = 600
  screenHeight = 400
   
  love.window.setMode(600, 400, {resizable = false, vsync = false})
   
  randnumber = love.math.random(0,1)
   
  pallet1 = 
  {
    x = screenWidth - 50,
    y = screenHeight/2,
    width = screenWidth/70,
    height = screenHeight/5,
    speed = 1
  }
    
  pallet2 =
  {
    x = 50,
    y = screenHeight/2,
    width = screenWidth/70,
    height = screenHeight/5,
    speed = 1
  }
  
  ball=
  {
    posx = screenWidth/2,
    posy = screenHeight/2,
    radius = 10,
    speed = 1,
    vspeed = 1
  }
   
end


function love.update(dt)
  
  if pallet1.y > 0 then
  
    if love.keyboard.isDown("up") then
     
     pallet1.y = pallet1.y - pallet1.speed
    
    end
      
  end
    
  if pallet1.y + pallet1.height <= screenHeight then
    
    if love.keyboard.isDown("down") then
    
      pallet1.y = pallet1.y + pallet1.speed
        
    end
  
  end
  
  if pallet2.y > 0 then
  
    if love.keyboard.isDown("w") then
      
      pallet2.y = pallet2.y - pallet2.speed

    end
 
  end
 
  if pallet2.y + pallet2.height <= screenHeight then
 
    if love.keyboard.isDown("s") then
    
      pallet2.y = pallet2.y + pallet2.speed
    
    end
 
 end
 
 
  ball.posx = ball.posx + 1 * ball.speed
  ball.posy = ball.posy + 1 * ball.vspeed

  
end

function love.draw()
  
  love.graphics.rectangle("line", pallet1.x, pallet1.y, pallet1.width, pallet1.height)
  
  love.graphics.rectangle("line", pallet2.x, pallet2.y, pallet2.width, pallet2.height)
  
  love.graphics.circle("line", ball.posx, ball.posy, ball.radius)

end