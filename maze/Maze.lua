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
    self.print_door = " "
    self.print_wall = "#"
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

function Maze:print_at(x, y, d)
    return self:cell(x, y).pass[d].blocked and self.print_wall or self.print_door
end

function Maze:__tostring()
    local o = ""
    
    local line = ""
    for i=1, self.width do
        line=line .. self.print_wall .. self:print_at(i, 1, "n")
    end
    line = line .. self.print_wall
    o = o .. line .. "\n"
    
    for y=1, self.height do
        local line = self:print_at(1, y, "w")
        local underline = self.print_wall
        for x=1, self.width do
            line = line .. " " .. self:print_at(x, y, "e")
            underline = underline .. self:print_at(x, y, "s").. self.print_wall
        end
        o = o .. line .. "\n" .. underline .. "\n"
    end
    
    return o
end
