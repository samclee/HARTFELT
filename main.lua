require 'picolove'


function love.load()
    cur_state = 1
    bee = love.graphics.newImage('bee.png')
    print(mod(-1, 4))
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