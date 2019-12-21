require 'picolove'
local evry = {}
evry.__index = evry

function evry:done()
    return self.cur >= self.dur
end

function evry:update(dt)
    if self.cur < self.dur then
        self.cur = self.cur + dt
    end
end

function evry:reset()
    self.cur = self.cur - self.dur
end

local function new(dur)
    local e = {
        dur = dur,
        cur = 0,
    }

	return setmetatable(e, evry)
end

return setmetatable(
    { new = new }, 
    { __call = function(_, ...) return new(...) end }
)