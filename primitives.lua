local state = {}

function state:enter()

end

function state:update(dt)

end

function state:draw()
    rect(0, 0, 200, 200, {1,0,0},14)
    rectc(0, 0, 200, 200, {0,1,1},4)
    rectc(400, 300, 400, 200, nil,3)
    rectf(200,200,100,100,{1,1,0})
    rectfc(400,300,20,20)
end

return state