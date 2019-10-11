
-- primitive visuals
function rect(x, y, w, h, col)
    local col = col or {love.graphics.getColor()}
    love.graphics.setColor(col)
    love.graphics.rectangle('line', x, y, w, h)
    love.graphics.setColor(1,1,1)
end

function rectc(x, y, w, h, col)
    local _x, _y = x - w / 2, y - h / 2
    rect(_x, _y, w, h, col)
end

function rectfill(x, y, w, h, col)
    local col = col or {love.graphics.getColor()}
    love.graphics.setColor(col)
    love.graphics.rectangle('fill', x, y, w, h)
end

function spr(img, x, y, r, sx, sy, ox, oy)
    local _r = r or 0
    local _ox, _oy = ox or 0, oy or 0
    local _x, _y = x - ox, y - oy
    local _sx, _sy = sx or 1, sy or 1
    love.graphics.draw(img, _x, _y, _r, _sx, _sy, _ox, _oy)
-- sprite visuals

-- applies scale and offset before rotating
function spr(img, x, y, opts)
    local x, y = x or 0, y or 0
    local r, ox, oy, sx, sy = 0, 0, 0, 1, 1
    if opts then
        r = opts.r or r
        ox, oy = opts.ox or ox, opts.oy or oy
        sx, sy = opts.sx or sx, opts.sy or sy
        if opts.debug then
            rect(x, y, img:getHeight(), img:getWidth(), {0,1,1})
            rectc(x, y, 6, 6, {0,1,1})
        end
    end
    love.graphics.draw(img, x, y, tau2rad(r), sx, sy, ox, oy)
end

function sprc(img, x, y, opts)
    local opts = opts or {}
    opts.ox, opts.oy = img:getWidth() / 2, img:getHeight() / 2
    spr(img, x, y, opts)
end
end

function sprc(img, x, y, r, sx, sy)
    local _r = r or 0
    local _ox, _oy = img:getWidth() / 2, img:getHeight() / 2
    local _x, _y = x - ox, y - oy
    local _sx, _sy = sx or 1, sy or 1
    love.graphics.draw(img, _x, _y, _r, _sx, _sy, _ox, _oy)
end

    return 0
end

function mid(lo, md, hi)
    return math.min(math.max(lo, md), hi)
end

function ismid(lo, md, hi)
    return lo <= md and md <= hi
end

function flr(num)
    return math.floor(num)
end

function max(first, second)
    local _sec = second or 0
    return math.max(first, _sec)
end

function min(first, second)
    local _sec = second or 0
    return math.min(first, _sec)
end

function dist(x1, y1, x2, y2)
    return math.sqrt((x1-x2)^2 + (y1-y2)^2)
end

function indist(x1, y1, x2, y2, d)
    return dist(x1, y1, x2, y2) <= d
end

function aabbcol(b1, b2)
    return b1.x + b1.w > b2.x and b2.x + b2.w > b1.x and b1.y + b1.h > b2.y and b2.y + b2.h > b1.y
end

-- REALLY SPECIALIZED JUNK, DO NOT USE IF YOU ARE NOT ME
function upall(tbl, ...)
    assert(tbl, "Need table to iterate through")
    for i = #tbl, 1, -1 do
        tbl[i]:update(unpack(args))
        if tbl[i].dead == true then
            table.remove(tbl, i)
        end
    end
end

function drall(...)
    assert(args.tbl, "Need table to iterate through")
    for i = 1, #tbl do
        tbl[i]:draw(unpack(args))
    end
end