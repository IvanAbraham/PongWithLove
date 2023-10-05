function love.load()
   
  screenWidth = 600
  screenHeight = 400
   
  love.window.setMode(600, 400, {resizable = false, vsync = false})
   
  randnumber = love.math.random(0,1)
   
  pallet1 = 
  {
    x = screenWidth - 20,
    y = screenHeight/2,
    width = screenWidth/70,
    height = screenHeight/5,
    speed = 1
  }
    
  pallet2 =
  {
    x = 20,
    y = screenHeight/2,
    width = screenWidth/70,
    height = screenHeight/5,
    speed = 1
  }
  
  ball=
  {
    posx = screenWidth/2,
    posy = screenHeight/2,
    radius = 5,
    speed = 1,
    vspeed = 1
  }
   
  p1points = 0
  p2points = 0
   
  p1textpoints = string.char(p1points)
  p2textpoints = string.char(p2points)
  
  p1win = false
  p2win = false
  
  play = true
  
end


function love.update(dt)
  
  if play == true then
  
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

   
    if ball.posy + ball.radius == screenHeight or ball.posy - ball.radius == 0 then
     
      ball.vspeed = ball.vspeed * -1
    
    end
   
   if ball.posx + ball.radius >= pallet1.x or ball.posx - ball.radius <= pallet2.x + pallet2.width then
      
      if ball.posx + ball.radius >= pallet1.x then
        
        if ball.posy >= pallet1.y and ball.posy <= pallet1.y + pallet1.height then
        
          ball.posx = pallet1.x - ball.radius
          ball.speed = ball.speed * -1
        
        elseif ball.posx > screenWidth then
        
          ball.posx = screenWidth/2
          ball.posy = screenHeight/2
          p2points = p2points + 1
          
          if p2points == 3 then
          
            p2win = true
            play = false
            
          end
        
        end
        
      elseif ball.posx - ball.radius <= pallet2.x + pallet2.width then
        
        if ball.posy >= pallet2.y and ball.posy <= pallet2.y + pallet2.height then
        
          ball.posx = pallet2.x + pallet2.width + ball.radius
          ball.speed = ball.speed * -1
          
        elseif ball.posx < 0 then 
          
          ball.posx = screenWidth/2
          ball.posy = screenHeight/2
          p1points = p1points + 1
         
          if p1points == 3 then
            
            p1win = true
            play = false
            
          end
        
        end
        
      end
    
    end
    
    ball.posx = ball.posx + 1 * ball.speed
    ball.posy = ball.posy + 1 * ball.vspeed
  
  end

end

function love.draw()
  if play == true then
    
    love.graphics.setColor(255, 0, 0)
    
    love.graphics.rectangle("line", pallet1.x, pallet1.y, pallet1.width, pallet1.height)
    love.graphics.print("" .. p1points, screenWidth-10, 10)
    
    love.graphics.setColor(0, 50, 255)
    
    love.graphics.rectangle("line", pallet2.x, pallet2.y, pallet2.width, pallet2.height)
    love.graphics.print("" .. p2points, 10, 10)
    
    love.graphics.setColor(255, 255, 255)
    
    love.graphics.circle("line", ball.posx, ball.posy, ball.radius)
  
  else 

    if p1win then
      
      love.graphics.setColor(255, 0, 0)
      love.graphics.print("Player 1 Won!", screenWidth/2, screenHeight/2)
    
    else
      
      love.graphics.setColor(0, 50, 255)
      love.graphics.print("Player 2 Won!", screenWidth/2, screenHeight/2)
    
    end
  
  end
  
end