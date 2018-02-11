function PlayerLoad()
    player = {}
    
    player.currentHealth = 250
    player.maxHealth = 500
    player.healthX  = 850
    player.healthY = 180

    player.money = 1000
    player.moneyPosX = 830
    player.moneyPosY = 200
    player.isAlive = true
end

function PlayerUpdate()
    if player.money <= 0 then
        player.money = 0
    elseif player.money >= 9999 then
        player.money = 9999
    end

    if player.currentHealth == 0 then
        player.isAlive = false 
    end

    if player.currentHealth > player.maxHealth then
        player.currentHealth = player.maxHealth
    end
end

function PlayerDraw()    
    love.graphics.setColor(216,55,1,255)
    love.graphics.print("Demon Dollars: " .. currency .. player.money, player.moneyPosX, player.moneyPosY)

    if player.currentHealth < player.maxHealth / 3 then
        love.graphics.setColor(159,24,0, 255)
    elseif player.currentHealth <= player.maxHealth * 2/3 and player.currentHealth >= player.currentHealth / 3 then
        love.graphics.setColor(242,244,23, 255)
    else
        love.graphics.setColor(38,105,5, 255)
    end

    love.graphics.print("Health: " .. player.currentHealth .. '/' .. player.maxHealth, player.healthX, player.healthY)
    love.graphics.setColor(255, 255, 255, 255)
    
end
