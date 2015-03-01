Mover = class()

function Mover:init(location, velocity)
    self.location = location or vec2(WIDTH/2, HEIGHT/2)
    self.velocity = velocity or vec2(0, 0)
    self.acceleration = vec2(0, 0)
    self.mass = 1
end

function Mover:update()
    self.velocity = self.velocity + self.acceleration
    self.location = self.location + self.velocity
    self.acceleration = vec2(0, 0)
    self:checkEdges()
end

function Mover:applyForce(f)
    force = vec2(f:unpack())
    force = force / self.mass
    self.acceleration = self.acceleration + force
end

function Mover:touched(touch)

end

function Mover:outOfEdges()
    print("out of edges")
end

function Mover:checkEdges()
    if self.location.x > WIDTH  or self.location.x < 0 or
       self.location.y > HEIGHT or self.location.y < 0 then
            self:outOfEdges()
    end
end
