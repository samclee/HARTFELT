require 'picolove'
local e = require 'evry'
local anym = {}

anym.__index = anym

function anym:update(dt)
    self.timer:update(dt)
    if self.timer:done() then
        self.timer:reset()
        self.cur = il(self.cur, #self.frames)
    end
end

function anym:reset()
    self.cur = 1
end

function anym:get()
    return self.frames[self.cur]
end

local function new(frames, dur)
    local dur = dur or 0.5
    local a = {
        cur = 1,
        timer = e(dur),
        frames = frames, -- can be sprites or quads
    }

	return setmetatable(a, anym)
end

return setmetatable(
    { new = new }, 
    { __call = function(_, ...) return new(...) end }
)