require 'picolove'
local mnoo = {}

mnoo.__index = mnoo

function mnoo:up()
    self.choice = il(self.choice, self.sz)
end

function mnoo:down()
    self.choice = dl(self.choice, self.sz)
end

function mnoo:sel(...)
    self.callbacks[self.choice](...)
end

local function new(cb)
    local m = {
        sz = #cb,
        choice = 1,
        callbacks = cb
    }

	return setmetatable(m, mnoo)
end

return setmetatable(
    { new = new }, 
    { __call = function(_, ...) return new(...) end }
)