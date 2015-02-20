-- maze

-- Use this function to perform your initial setup
function setup()
    math.randomseed(os.time())

    maze_width = 4
    maze_height = 4
    maze_zoom = 4
    
    maze = Maze(maze_width, maze_height)
    maze.start_x, maze.start_y = start_point(maze_width, maze_height)
    maze:generate()
    
    map = Map(str2tbl(maze:tostring(maze_zoom)))
        
    --[[
    print(maze:tostring())
    print(maze:tostring(2)) -- zoom
    print(maze:tostring(3))
    
    print(dump(str2tbl(maze:tostring())))
    
    log.printTable({
    s = maze:tostring(),
    m = dump(str2tbl(maze:tostring()))
    })
    --]]
end

function draw()
    background(40, 40, 50)
    strokeWidth(2)
    stroke(100, 100, 100)
    
    map:draw()
end

function touched(touch)
    map:touched(touch)
end
