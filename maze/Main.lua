-- maze

-- Use this function to perform your initial setup
function setup()
    maze = Maze(3, 3)
    maze:generate()
    
    print(maze:tostring())
    print(maze:tostring(2)) -- zoom
    print(maze:tostring(3))

    --log.printTable({t = maze:toString(4)})
end

-- This function gets called once every frame
function draw()
    -- This sets a dark background color
    background(40, 40, 50)
    
    -- This sets the line thickness
    strokeWidth(5)
    
    -- Do your drawing here
    
end
