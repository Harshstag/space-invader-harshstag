
enemy = {}
enemy2 = {}
enemy3 = {}
enemy4 = {}
enemy5 = {}
enemy6 = {}
enemy7 = {}
enemy8 = {}
enemy9 = {}
enemy10 = {}
enemy11 = {}
enemies_controller = {}
enemies_controller.enemies = {}
enemies_controller.image = love.graphics.newImage('bad_3.png')
enemies_controller.attack_sound = love.audio.newSource('attack.mp3','static')

--particle_system = {}
--particle_system.list = {}
--particle_system.image = love.graphics.newImage('particals.png')
---function particle_system:spawn(x,y)
  --local ps = {}
  --ps.x = x
  --ps.y = y
--  ps.ps = love.graphics.newParticleSystem(particle_system.image, 32)
--  ps.ps:setParticleLifetime(2,4)
--  ps.ps:setEmissionRate(5)
--  ps.ps:setSizeVariation(1)
--  ps.ps:setLinearAcceleration(-20,-20,20,20)
--  ps.ps:setColors(100,255,100,255,0,255,0,255)
--  table.insert(particle_system.list,ps)
--end

--function particle_system:draw()
---  for _,v in pairs(particle_system.list) do
    --love.graphics.draw(v.ps,v.x,v.y)
  --end
--end
--function particle_system:update(dt)
  --for _,v in pairs(partical_syatem.list)do
  --  v.ps:update(dt)
--  end
--end
--function particle_system:cleanup()
--
--end
function enemies_controller:cleanup()
end

function checkCollisions(enemies,bullets)
  for i,e in pairs(enemies)do
    for _,b in pairs(bullets)do
      if b.y <= e.y + e.height and b.x > e.x and b.x < e.x + e.width then
        love.audio.play(enemies_controller.attack_sound)
        --particle_system:spawn(e.x,e.y)
        table.remove(enemies,i)
      end
    end
  end
end


function love.load()
local backgroundsound = love.audio.newSource('backgroundsound.mp3','static')
backgroundsound:setLooping(true)
love.audio.play(backgroundsound)
  game_over = false
  background_image = love.graphics.newImage('background.jpg')
  gameover_image = love.graphics.newImage('game_over.png')
  player = {}
  player.x = 0
  player.y = 430
  player.speed = 10
  player.cooldown = 10
  player.bullets = {}
      player.fire_sound = love.audio.newSource('laser.wav','static')
  player.image=love.graphics.newImage('player.png')
  player.fire = function()
    if player.cooldown <= 0 then
      love.audio.play(player.fire_sound)
      player.cooldown = 5
      bullet = {}
      bullet.x = player.x +25
      bullet.y = player.y
      table.insert(player.bullets,bullet)
    end
  end


end
--for i =1,1 do
function enemies_controller:spawnEnemy(x,y,x2,y2,x3,y3,x11,y11,x4,y4,x5,y5,x6,y6,x7,y7,x8,y8,x9,x9)
  ememy = {}
  enemy.x = x
  enemy.y = y
  enemy.width = 40
  enemy.height = 40
  enemy.speed = 2
  enemy.cooldown = 20
  enemy.bullets = {}
  table.insert(self.enemies, enemy)
  ememy2 = {}
  enemy2.x = x2
  enemy2.y = y2
  enemy2.width = 40
  enemy2.height = 40
  enemy2.speed = 2
  enemy2.cooldown = 20
  enemy2.bullets = {}
  table.insert(self.enemies, enemy2)
  ememy3 = {}
  enemy3.x = x3
  enemy3.y = y3
  enemy3.width = 40
  enemy3.height = 40
  enemy3.speed = 2
  enemy3.cooldown = 20
  enemy3.bullets = {}
  table.insert(self.enemies, enemy3)
  ememy11 = {}
  enemy11.x = x11
  enemy11.y = y11
  enemy11.width = 40
  enemy11.height = 40
  enemy11.speed = 10
  enemy11.cooldown = 20
  enemy11.bullets = {}
  table.insert(self.enemies, enemy11)
  ememy4 = {}
  enemy4.x = x4
  enemy4.y = y4
  enemy4.width = 40
  enemy4.height = 40
  enemy4.speed = 2
  enemy4.cooldown = 20
  enemy4.bullets = {}
  table.insert(self.enemies, enemy4)
  ememy5 = {}
  enemy5.x = x5
  enemy5.y = y5
  enemy5.width = 40
  enemy5.height = 40
  enemy5.speed = 10
  enemy5.cooldown = 20
  enemy5.bullets = {}
  table.insert(self.enemies, enemy5)
  ememy6 = {}
  enemy6.x = x6
  enemy6.y = y6
  enemy6.width = 40
  enemy6.height = 40
  enemy6.speed = 2
  enemy6.cooldown = 20
  enemy6.bullets = {}
  table.insert(self.enemies, enemy6)
  ememy7 = {}
  enemy7.x = x7
  enemy7.y = y7
  enemy7.width = 40
  enemy7.height = 40
  enemy7.speed = 2
  enemy7.cooldown = 20
  enemy7.bullets = {}
  table.insert(self.enemies, enemy7)
  ememy8 = {}
  enemy8.x = x8
  enemy8.y = y8
  enemy8.width = 40
  enemy8.height = 40
  enemy8.speed = 2
  enemy8.cooldown = 20
  enemy8.bullets = {}
  table.insert(self.enemies, enemy8)
  ememy9 = {}
  enemy9.x = 300
  enemy9.y = -50
  enemy9.width = 40
  enemy9.height = 40
  enemy9.speed = 2
  enemy9.cooldown = 20
  enemy9.bullets = {}
  table.insert(self.enemies, enemy9)
--end
end

function enemy:fire()
  if self.cooldown <= 0 then
    self.cooldown = 20
    bullet = {}
    bullet.x = self.x + 35
    bullet.y = self.y
    table.insert(self.bullets,bullet)
  end
end


function love.update(dt)
  for i = 1,5 do
     enemies_controller:spawnEnemy(50,-100,110,-150,170,-175,250,-150,320,-100,400,-150,460,-100,530,-200,5800,-200)
  end
if love.keyboard.isDown("right")then
player.x =player.x + player.speed
elseif love.keyboard.isDown("left")then
  player.x = player.x - player.speed
end
if player.x < 0 then
  player.x = 0
end
if player.x > 570 then
player.x = 570
end
if love.keyboard.isDown("space")then
  player.cooldown = player.cooldown - 1
  player.fire()
end
for i,e in pairs(enemies_controller.enemies)do
  e.y = e.y + 1 * 0.5
 if e.y >= love.graphics.getHeight()  then --love.graphics.getHeight()
   game_over = true
end


end

for i,b in ipairs(player.bullets)do
  if b.y < -10 then
    table.remove(player.bullets,i)
  end
    b.y=b.y-10
  end
    checkCollisions(enemies_controller.enemies,player.bullets)


end

function love.draw()
 --if game_over then
   --love.graphics.draw(gameover_image,60,0)
    --return
  --end
   love.graphics.draw(background_image)

  --drawing player
  love.graphics.setColor(255,255,255)
  love.graphics.draw(player.image,player.x,400)
--drawing enemy
  for _,e in pairs(enemies_controller.enemies)do
    love.graphics.draw(enemies_controller.image,e.x,e.y)
  end
  --drawing bullets
  love.graphics.setColor(255,255,255)
  for _,b in pairs(player.bullets)do
    love.graphics.rectangle("fill", b.x, b.y,10,10)
  end
end
