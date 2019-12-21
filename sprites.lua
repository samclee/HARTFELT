local state = {}

function state:enter()
    print('testing sprites')
    t=0
end

function state:update(dt)
t=t+0.1
end

function state:draw()
    spr(bee, 0, 0, {sx = 2,sy=1, clr = {1,0.1, 1}})
    sprc(bee, 400, 300, {r = t})

    spr(bee, 500,300, {kx = math.rad(30), ky = math.rad(30)})
end

return state