require 'picolove'
gs = require 'gamestate'

states = {
    sprites = require 'sprites',
    strings = require 'strings',
    primitives = require 'primitives',
    prob = require 'prob'
}

function love.load()
    cur_state = 1
    bee = love.graphics.newImage('bee.png')
    
    gs.registerEvents()
    gs.switch(states.prob)
end

function love.draw()

end

function love.update(dt)

end

function love.keypressed(k)
    if k == 'r' then
        restart()
    elseif k == 'escape' then
        quit()
    elseif k == 'space' then

    end
end