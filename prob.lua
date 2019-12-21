local state = {}

function state:enter()
    print(mc())
    print(mn())
    print(mz())
    --[[print('rnd')
    print(rnd())
    print(rnd(100))
    print(rnd(50,100))
    print(rndi(10))
    print(rndi(10, 500))]]
    --[[i = 1
    
    for j=1, 10 do
        i = dl(i,6)
        print(i)
    end]]

    
end

function state:update(dt)

end

function state:draw()
    
end

return state