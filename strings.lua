local state = {}

function state:enter()
    love.graphics.setNewFont(40)
    t=0
end

function state:update(dt)
t=t+0.1
end

function state:draw()
    prtc('Unbelievable', 400, 300, {ky = math.rad(30)})
end

return state