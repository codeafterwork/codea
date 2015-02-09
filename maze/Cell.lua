Cell = class()

function Cell:init(maze, x, y)
    self.maze = maze
    self.x = x
    self.y = y
    self.visited = false
    self.pass = {}
end

function Cell:reset()
    self.visited = false
    self.pass["n"]:close()
    self.pass["e"]:close()
    self.pass["s"]:close()
    self.pass["w"]:close()
end

function Cell:neighbours()
    local n = {}
    for d, m in pairs(Maze.directions) do
        local c = self.maze:cell(self.x+m.x, self.y+m.y)
        if c and not c.visited then
            table.insert(n, {name = d, pos = {x = c.x, y = c.y}})
        end
    end
    return n
end

function Cell:setPass()
    self.pass = {
    n = self:getPass("n"),
    e = self:getPass("e"),
    s = self:getPass("s"),
    w = self:getPass("w")
    }
end

function Cell:getPass(dir)
    local d = Maze.directions[dir]
    local c = self.maze:cell(self.x+d.x, self.y+d.y)
    if c and c.pass[Maze.opposite_direction[dir]] then
        return c.pass[Maze.opposite_direction[dir]]
    else
        return Pass()
    end
end
