function love.load()
   
  love.window.setTitle("Ejemplo")
  
  love.graphics.setBackgroundColor(1, 1, 1)
  spaceshipImage = love.graphics.newImage("spaceship.png")
  
  posX = 0
  posY = 0

  speed = 10.0

end


function love.update(dt)
  
  posX = posX + speed * dt
  posY = posY + speed * dt
  
  print(posX)
  print(posY)
  
end


function love.draw()
  
  love.graphics.draw(spaceshipImage, posX, posY)

end