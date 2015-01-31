-- shoot

function setup()
    bullet = Bullet(vec2(WIDTH/2, HEIGHT/2))
end

-- This function gets called once every frame
function draw()
    -- This sets a dark background color 
    background(40, 40, 50)

    -- This sets the line thickness
    strokeWidth(5)

    bullet:update()
    bullet:draw()
    
    ellipse(WIDTH/2, HEIGHT/2, 40)
end

function touched(touch)
    bullet:shoot(touch)
end
