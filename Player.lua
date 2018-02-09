function PlayerLoad()
    player = {}
    player.currentHealth = 100
    player.maxHealth = 200
    player.money = 1000
end

function PlayerUpdate()
    if player.currentHealth > player.maxHealth then
        player.currentHealth = player.maxHealth
    end
end

function PlayerDraw()
    love.graphics.print("Demon Dollars: " .. currency .. player.money, 30, 10)
    love.graphics.print("Health: " .. player.currentHealth .. '/' .. player.maxHealth, 400, 10)

end
