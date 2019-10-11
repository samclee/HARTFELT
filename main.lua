require 'picolove'
states = require'states'

function love.load()
    cur_state = 1
    bee = love.graphics.newImage('bee.png')
    if states[cur_state].load then
        states[cur_state].load()
    end
end

function love.draw()
    if states[cur_state].draw then
        states[cur_state].draw()
    end
end

function love.update(dt)
    if states[cur_state].update then
        states[cur_state].update(dt)
    end
end

function love.keypressed(k)
    if k == 'r' then
        love.event.quit('restart')
    elseif k == 'escape' then
        love.event.quit()
    elseif k == 'space' then
        cur_state = (cur_state % #states) + 1
        if states[cur_state].load then
            states[cur_state].load()
        end
    end
end