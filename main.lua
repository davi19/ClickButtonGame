function love.load()
  button = {}
  button.x=200
  button.y=200
  button.size=50

  score = 0
  timer = 10
  gameState = true
  fimjogo=0
  myFont=love.graphics.newFont(40)

end

function love.update(dt)
  if gameState==false then

    if timer > 0 then
      timer = timer-dt
    end
    if timer < 0 then
      timer=0
      gameState=true
      fimjogo=1
    end

  end
end

function love.draw()
  if gameState==false then
  love.graphics.setColor(20, 100, 20)
  love.graphics.circle("fill", button.x, button.y, button.size)

  love.graphics.setColor(255, 255, 255)
  love.graphics.setFont(myFont)
  love.graphics.print("Score: "..score)
  --math.ceil arredonda para cima
  love.graphics.print("Timer: "..math.ceil(timer),200,0)
elseif fimjogo==1 then
love.graphics.setFont(myFont)
love.graphics.print("Para começar clique em qualquer lugar da tela",0, love.graphics.getHeight()/2)
love.graphics.print("Score: "..score)
else
    love.graphics.setFont(myFont)
  love.graphics.print("Para começar clique em qualquer lugar da tela",0, love.graphics.getHeight()/2)
end
end

function love.mousepressed(x, y, buttonMouse, isTouch)

  if gameState then
      gameState=false
      timer=10
      score = 0
  end
  distancia = math.sqrt((y-button.y)^2 + (x-button.x)^2)
  if buttonMouse == 1 and gameState==false then
    if distancia < button.size then
      score=score+1
    -- love.graphics.getWidth pega largura e altura da janela
    button.x=math.random(button.size, love.graphics.getWidth()-button.size)
    button.y=math.random(button.size, love.graphics.getHeight()-button.size)
  end
  end
end
