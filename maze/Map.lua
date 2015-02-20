Map = class()

function Map:init(m)
    self.m = m
    self.node_list = {}
    for r = 1, #self.m do
        for c = 1, #self.m[r] do
            table.insert(self.node_list, { node = Node(r, c, self.m[r][c], self) })
        end
    end
end

function Map:rows()
    return #self.m
end

function Map:cols()
    return #self.m[1]
end

function Map:node(row, col)
    if not (row < 1 or row > self:rows()
    or  col < 1 or col > self:cols()) then
        return self.node_list[(row-1)*self:cols()+col].node
    end
end

function Map:draw()
    local x = 10
    local y = 10
    local w = WIDTH-2*x
    local h = HEIGHT-2*y
    local w1 = w / self:cols()
    local h1 = h / self:rows()
    
    for i = 1, self:rows() * self:cols() do
        local node = self.node_list[i].node
        node:draw(x+node.col*w1, y+(self:rows()-node.row+1)*h1, w1, h1)
    end
end

function Map:touched(touch)
    if touch.state == ENDED then
        for i = 1, self:rows() * self:cols() do
            local node = self.node_list[i].node
            if node:point_in(touch.x, touch.y) then
                print(node:tostring())
            end
        end
    end
end
