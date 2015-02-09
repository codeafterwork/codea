-- maze

function setup()
    maze = Maze(4, 3)
    maze:generate()
    print(maze)
end

function draw()
    -- This sets a dark background color
    background(40, 40, 50)
    
    -- This sets the line thickness
    strokeWidth(5)
    
    -- Do your drawing here
    
end
