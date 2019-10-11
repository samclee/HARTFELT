
-- visuals
function rect(x, y, w, h, col)
    local col = col or love.graphics.getColor()
    love.graphics.setColor(col)
    love.graphics.rectangle('line', x, y, w, h)
end

function rectc(x, y, w, h, col)
    local _x, _y = x - w / 2, y - h / 2
    rect(_x, _y, w, h, col)
end

function rectfill(x, y, w, h, col)
    local col = col or love.graphics.getColor()
    love.graphics.setColor(col)
    love.graphics.rectangle('fill', x, y, w, h)
end

function spr(img, x, y, r, sx, sy, ox, oy)
    local _r = r or 0
    local _ox, _oy = ox or 0, oy or 0
    local _x, _y = x - ox, y - oy
    local _sx, _sy = sx or 1, sy or 1
    love.graphics.draw(img, _x, _y, _r, _sx, _sy, _ox, _oy)
end

function sprc(img, x, y, r, sx, sy)
    local _r = r or 0
    local _ox, _oy = img:getWidth() / 2, img:getHeight() / 2
    local _x, _y = x - ox, y - oy
    local _sx, _sy = sx or 1, sy or 1
    love.graphics.draw(img, _x, _y, _r, _sx, _sy, _ox, _oy)
end
