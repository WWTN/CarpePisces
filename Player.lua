function PlayerLoad()
    player = {}
    player.currentHealth = 100
    player.maxHealth = 500
    player.money = 1000
    player.isAlive = true
end

function PlayerUpdate()
    if player.money <= 0 then
        player.money = 0
        player.currentHealth = player.currentHealth
    end

    if player.currentHealth == 0 then
        player.isAlive = false 
    end

    if player.currentHealth > player.maxHealth then
        player.currentHealth = player.maxHealth
    end
end

function PlayerDraw()
    love.graphics.print("Demon Dollars: " .. currency .. player.money, 30, 10)
    love.graphics.print("Health: " .. player.currentHealth .. '/' .. player.maxHealth, 450, 10)

end
