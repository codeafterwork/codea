Maze = class()

Maze.directions = {
    n = {x =  0, y = -1},
    e = {x =  1, y =  0},
    s = {x =  0, y =  1},
    w = {x = -1, y =  0}
}

Maze.opposite_direction = {
    n = "s",
    e = "w",
    s = "n",
    w = "e"
}

function Maze:init(width, height)
    self.width = width
    self.height = height
    self.cells = {}
    for i=1, width*height do
        self.cells[i] = Cell(self, mod2(i, width), math.ceil(i / width))
    end
    for i=1, width*height do
        self.cells[i]:setPass()
    end
    self.door = " "
    self.wall = "."
    self.room = " "
end

function Maze:cell(x, y)
    if not (x < 1 or x > self.width or
    y < 1 or y > self.height) then
        return self.cells[(y-1)*self.width+x]
    end
end

function Maze:reset()
    for i=1, self.width * self.height do
        maze.cells[i]:reset()
    end
end

function Maze:generate()
    math.randomseed(os.time())
    self:reset()
    local stack = Stack()
    local cell = self:cell(1, 1)
    while true do
        cell.visited = true
        local neighbours = cell:neighbours()
        if #neighbours == 0 then
            if stack:isEmpty() then
                break
            else
                cell = stack:pop()
            end
        else
            stack:push(cell)
            local dir = neighbours[math.random(#neighbours)]
            cell.pass[dir.name]:open()
            cell = self:cell(dir.pos.x, dir.pos.y)
        end
    end
end

function Maze:print_at(x, y, direction, zoom)
    return self:cell(x, y).pass[direction].blocked and string.rep(self.wall, zoom) or string.rep(self.door, zoom)
end

function Maze:tostring(zoom)
    local n = zoom or 1
    local line = ""
    for x=1, self.width do
        line=line..self.wall..self:print_at(x, 1, "n", n)
    end
    line = line..self.wall.."\n"
    local o = line

    for y=1, self.height do
        local line = self:print_at(1, y, "w", 1)
        local underline = self.wall
        for x=1, self.width do
            line = line..string.rep(self.room, n)..self:print_at(x, y, "e", 1)
            underline = underline..self:print_at(x, y, "s", n)..self.wall
        end
        o = o..string.rep(line.."\n", n)..underline.."\n"
    end

    return o
end
