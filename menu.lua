local state = {}

local function bleh(a)
    print('bleh'..a)
end

function state:enter()
    mn = mnoo({
        function() print('first') end,
        bleh,
        function() print('three') end,
    })  
end

function state:update(dt)

end

function state:draw()
    
end

function state:keypressed(k)
    if k == 'q' then
        mn:down()
    elseif k == 'a' then
        mn:up()
    elseif k == 'z' then
        mn:sel(k)
    end
end

return state