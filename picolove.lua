
-- primitive visuals
function rect(x, y, w, h, col)
    local prev_col = {love.graphics.getColor()}
    local _col = col or prev_col
    love.graphics.setColor(_col)
    love.graphics.rectangle('line', x, y, w, h)
    love.graphics.setColor(prev_col)
end

function rectc(x, y, w, h, col)
    local _x, _y = x - w / 2, y - h / 2
    rect(_x, _y, w, h, col)
end

function rectfill(x, y, w, h, col)
    local prev_col = {love.graphics.getColor()}
    local _col = col or prev_col
    love.graphics.setColor(_col)
    love.graphics.rectangle('fill', x, y, w, h)
    love.graphics.setColor(prev_col)
end

function rectfillc(x, y, w, h, col)
    local _x, _y = x - w / 2, y - h / 2
    rectfill(_x, _y, w, h, col)
end

function circ(x, y, r, col)
    ell(x, y, r, r, col)
end

function ell(x, y, rx, ry, col)
    local prev_col = {love.graphics.getColor()}
    local _col = col or prev_col
    love.graphics.setColor(_col)
    love.graphics.ellipse('line', x, y, rx, ry)
    love.graphics.setColor(prev_col)
end

function circfill(x, y, r, col)
    ellfill(x, y, r, r, col)
end

function ellfill(x, y, rx, ry, col)
    local prev_col = {love.graphics.getColor()}
    local _col = col or prev_col
    love.graphics.setColor(_col)
    love.graphics.ellipse('fill', x, y, rx, ry)
    love.graphics.setColor(prev_col)
end

-- trig math
local fullrot = 2 * math.pi

function tau(ang)
    return ang / fullrot
end

function deg2tau(ang)
    return  ang / 360
end

function tau2rad(ang)
    return ang * fullrot
end

function tau2deg(ang)
    return ang * 360
end

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

-- strings
function strlen(str)
    return string.len(str)
end

function strw(str)
    local font = love.graphics.getFont()
    return font:getWidth(str)
end

function strh(str)
    local font = love.graphics.getFont()
    return font:getHeight(str)
end

-- text visuals
function prt(str, x, y, r, col)
    local _x, _y = x or 0, y or 0
    local _r = r or 0
    local col = col or love.graphics.getColor()
    love.graphics.setColor(col)

    love.graphics.print(str, _x, _y, _r)
    love.graphics.setColor(1, 1, 1)
end

function prtc(str, x, y, r, col)
    local _x, _y = x - strw(str) / 2, y - strh(str) / 2
    prt(str, _x, _y, r, col)
end

-- tables
function add(tbl, val)
    table.insert(tbl, val)
end

function del(tbl, ind)
    table.remove(tbl, ind)
end

function delv(tbl, val)
    for k,v in pairs(tbl) do
        if v == val then
            table.remove(tbl, k)
            return
        end
    end
end

function foreach(tbl, fn)
    for _,v in pairs(tbl) do
        fn(v)
    end
end

-- input
function btn(k)
    return love.keyboard.isDown(k)
end

-- non-trig math
function abs(num)
    return math.abs(num)
end

function sgn(num)
    if num < 0 then
        return -1
    elseif num > 0 then
        return 1
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