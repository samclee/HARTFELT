local e = require 'evry'
local a = require 'anym'

local state = {}

function state:enter()
    spr1 = love.graphics.newImage('bee.png')
    spr2 = love.graphics.newImage('bee1.png')
    an = a({spr1, spr2}, 1)
end

function state:update(dt)
    an:update(dt)
end

function state:draw()
    spr(an:get(), 30, 30)
end

function state:keypressed(k)

end

return state