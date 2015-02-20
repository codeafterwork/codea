Node = class()

function Node:init(row, col, type, map)
    self.row = row
    self.col = col
    self.type = type
    self.map = map
    self.xy = vec2(0, 0)
    self.wh = vec2(0, 0)
end

function Node:tostring()
    return "["..self.row..", "..self.col.."]"
end

function Node:draw(x, y, w, h)
    self.xy = vec2(x-w, y-h)
    self.wh = vec2(w-1, h-1)
    pushStyle()
    if self.type == "." then
        fill(40,40,40)
    end
    rect(self.xy.x, self.xy.y, self.wh.x, self.wh.y)
    fill(200,200,200)
    fontSize(9)
    text(self.row..", "..self.col, x-w/2, y-h/2)
    popStyle()
end

function Node:point_in(x, y)
    if  x > self.xy.x and x < self.xy.x + self.wh.x
    and y > self.xy.y and y < self.xy.y + self.wh.y then
        return self.type
    end
    return false
end

function Node:touched(touch)
    -- Codea does not automatically call this method
end
