---@return vector
local function get_move_direction()
    local move = vector(0, 0)

    if love.keyboard.isDown('d') then
        move.x = player.speed
    end

    if love.keyboard.isDown('a') then
        move.x = move.x - player.speed
    end

    if love.keyboard.isDown('s') then
        move.y = player.speed
    end

    if love.keyboard.isDown('w') then
        move.y = move.y - player.speed
    end

    return move
end

function checkCollision(x, y, width, height)
    for j = math.floor(x), math.floor(x + width - 0.01) do
        for i = math.floor(y), math.floor(y + height - 0.01) do
            if map[i] and map[i][j] == 1 then
                return true
            end
        end
    end
    return false
end

function createmove(dt)
    local move = get_move_direction()
    move = move * dt

    player.velocity = (player.velocity + move) / game_rules.friction

    local predicted_origin_x = player.origin + vector(player.velocity.x, 0)
    local predicted_origin_y = player.origin + vector(0, player.velocity.y)

    if not checkCollision(predicted_origin_x.x, player.origin.y, player.size.x, player.size.y) then
        player.origin.x = predicted_origin_x.x
    else
        player.velocity.x = 0
    end

    if not checkCollision(player.origin.x, predicted_origin_y.y, player.size.x, player.size.y) then
        player.origin.y = predicted_origin_y.y
    else
        player.velocity.y = 0
    end

    player.velocity = player.velocity / game_rules.friction
end