local size = 10

function draw()
    local w, h = love.graphics.getDimensions()
    w, h = w / size, h / size

    for x = 1, size do
        for y = 1, size do
            love.graphics.setColor(map[y][x], map[y][x], map[y][x])
            love.graphics.rectangle('fill', (x - 1) * w, (y - 1) * h, w, h)
        end
    end

    love.graphics.setColor(1, 0.6, 0.6)
    love.graphics.rectangle('fill', (player.origin.x - 1) * w, (player.origin.y - 1) * h, player.size.x * w, player.size.y * h)
end