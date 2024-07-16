require('header')

local player = {
    origin = vector(2),
    size = vector(.5),
    speed = 1.5,
    velocity = vector(),
}

local game_rules = {
    friction = 1.2
}

local map = {}
local size = 10

function map:init()
    for x = 1, size do
        map[x] = {}
        for y = 1, size do
            if (x == 1 or y == 1) or (x == size or y == size) then
                map[x][y] = 1
            else
                map[x][y] = 0
            end
        end
    end

    map[5][3] = 1

    self.init = nil
end

map:init()

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

function love.update(dt)
    local move = get_move_direction()

    move = move * dt

    player.velocity = (player.velocity + move) / game_rules.friction
    player.origin = player.origin + player.velocity
end

function love.draw()
    local w, h = love.graphics.getDimensions()
    w, h = w / size, h / size

    for x = 1, size do
        for y = 1, size do
            love.graphics.setColor(map[x][y], map[x][y], map[x][y])
            love.graphics.rectangle('fill', (x - 1) * w, (y - 1) * h, w, h)
        end
    end

    love.graphics.setColor(1, 0.6, 0.6)
    love.graphics.rectangle('fill', (player.origin[1] - 1) * w, (player.origin[2] - 1) * h, player.size.x * w, player.size.y * h)
end