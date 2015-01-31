Bullet = class(Mover)

function Bullet:init(location, velocity)
    Mover.init(self, location, velocity)
end

function Bullet:draw()
    ellipse(self.location.x, self.location.y, 40)
end

function Bullet:touched(touch)

end

function Bullet:shoot(touch)
    local target = vec2(touch.x, touch.y)
    local direction = (target - self.location):normalize()
    
    if touch.state == BEGAN then
        self.acceleration = direction
    end
    if touch.state == ENDED then
        self.acceleration = vec2(0, 0)
    end
end

function Bullet:outOfEdges()
    Mover.outOfEdges(self)
    self.location = vec2(WIDTH/2, HEIGHT/2)
    self.velocity = vec2(0, 0)
    self.acceleration = vec2(0, 0)   
end
