Mover = class()

function Mover:init(location, velocity)
    self.location = location or vec2(WIDTH/2, HEIGHT/2)
    self.velocity = velocity or vec2(0, 0)
    self.acceleration = vec2(0, 0)
end

function Mover:update()
    self.velocity = self.velocity + self.acceleration
    self.location = self.location + self.velocity
    
    self:checkEdges()
end

function Mover:shoot(touch)
    local target = vec2(touch.x, touch.y)
    local direction = (target - bullet.location):normalize()
    
    if touch.state == BEGAN then
        self.acceleration = direction
    end
    if touch.state == ENDED then
        self.acceleration = vec2(0, 0)
    end
end

function Mover:draw()
    ellipse(self.location.x, self.location.y, 40)
end

function Mover:touched(touch)
    -- Codea does not automatically call this method
end

function Mover:checkEdges()
    if self.location.x > WIDTH  or self.location.x < 0 or
       self.location.y > HEIGHT or self.location.y < 0 then
        self.location = vec2(WIDTH/2, HEIGHT/2)
        self.velocity = vec2(0, 0)
        self.acceleration = vec2(0, 0)
    end
end
