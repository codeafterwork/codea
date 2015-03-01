-- shoot

function setup()
    robot = Robot(vec2(WIDTH/2, HEIGHT/2), vec2(2.6, 1.9), readImage("Space Art:Green Ship"))
    bullet = nil
end

-- This function gets called once every frame
function draw()
    -- This sets a dark background color 
    background(40, 40, 50)

    -- This sets the line thickness
    strokeWidth(5)

    if bullet then
        local v = bullet.velocity
        if v:len() < 0.1 then
            bullet = nil
        else
            local friction = -0.5 * vec2(v:unpack()):normalize();
            bullet:applyForce(friction)
            bullet:update()
            bullet:draw()
        end
    end
    
    robot:update()
    robot:draw()
end

function touched(touch)
    robot:shoot(touch)
end
