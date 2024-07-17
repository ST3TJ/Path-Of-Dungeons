map = {
    { 1, 1, 1, 1, 1, 1, 1, 1, 1, 1 },
    { 1, 0, 0, 0, 0, 0, 0, 0, 0, 1 },
    { 1, 0, 0, 0, 0, 0, 0, 0, 0, 1 },
    { 1, 0, 0, 0, 0, 0, 0, 0, 0, 1 },
    { 1, 0, 0, 0, 0, 0, 0, 0, 0, .5 },
    { 1, 0, 0, 0, 0, 1, 0, 0, 0, 1 },
    { 1, 0, 0, 0, 0, 1, 0, 0, 0, 1 },
    { 1, 0, 0, 0, 1, 1, 1, 0, 0, 1 },
    { 1, 0, 0, 0, 0, 0, 0, 0, 0, 1 },
    { 1, 1, 1, 1, 1, 1, 1, 1, 1, 1 },
}

function IsTransition(y, x)
    x, y = math.floor(x), math.floor(y)
    return map[x] and map[x][y] == .5
end

function generateMap()
    map = {}
    hasTransfer = false
    for x = 1, MAP_SIZE do
        map[x] = {}
        for y = 1, MAP_SIZE do
            if (x == 1 or y == 1) or (x == MAP_SIZE or y == MAP_SIZE) then
                map[x][y] = 1
            elseif math.random() > 0.9 then
                map[x][y] = 1
            elseif math.random() > 0.99 then
                map[x][y] = .5
                hasTransfer = true
            else
                map[x][y] = 0
            end
        end
    end

    if not hasTransfer then
        map[math.random(2, MAP_SIZE - 1)][math.random(2, MAP_SIZE - 1)] = .5
    end
end