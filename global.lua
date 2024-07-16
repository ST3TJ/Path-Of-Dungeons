function math.clamp(x, mn, mx)
    return x < mn and mn or (x > mx and mx or x)
end

function printf(...)
    print(string.format(...))
end