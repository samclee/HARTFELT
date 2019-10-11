local states = {}

-- primitive visuals test
states[1] = {}

states[1].draw = function()
    rect(0, 0, 50, 50)
    rectfill(50, 0, 50, 50)
    rectc(125, 25, 50, 50)
    rectfillc(175, 25, 50, 50)
    rect(0, 50, 50, 50, {1,0,0})
    rectfill(50, 50, 50, 50, {1,0,0})
    rectc(125, 75, 50, 50, {1,0,0})
    rectfillc(175, 75, 50, 50, {1,0,0})

end

-- trig math test
states[2] = {}

states[2].load = function()
    local rad_eigth = math.pi / 4
    local deg_eigth = 45
    for i = 0, 8 do
        print(string.format('%.4f radians, %.0f degrees, %.4f tau', i * rad_eigth, i * deg_eigth, tau(i * rad_eigth)))
    end

    for i = 0, 8 do
        print(string.format('%.4f tau, %.0f degrees, %.4f radians', i / 8, tau2deg(i / 8), tau2rad(i / 8)))
    end
end

-- sprite visuals test
states[3] = {}

states[3].load = function()
    t = 0
end

states[3].update = function(dt)
    t = t + dt
end

states[3].draw = function()
    love.graphics.setColor(1,1,1)
    spr(bee)
    spr(bee, 50)
    spr(bee, 50, 50)
    
    spr(bee, 400, 300)
    sprc(bee, 400, 300)
    
    spr(bee, 200, 200, {r = t, debug = true})
    sprc(bee, 400, 300, {r = t, debug = true})

    spr(bee, 500, 100, {sx = -1, debug = true})
    sprc(bee, 600, 100, {sx = -1, debug = true})

    spr(bee, 200, 300, {sy = 1, r = .125, debug = true})
    sprc(bee, 200, 300, {sy = 2, r = .125, debug = true})
end

return states