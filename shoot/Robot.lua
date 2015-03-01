Robot = class(Mover)

function Robot:init(location, velocity, img)
    Mover.init(self, location, velocity)
    self.img = img
end

function Robot:draw()
    local angle = 270+(360/6.28)*math.atan2(self.velocity.y, self.velocity.x)
    pushMatrix()
    translate(self.location:unpack())
    rotate(angle)
    sprite(self.img, 0, 0)
    popMatrix()
end

function Robot:touched(touch)
    -- Codea does not automatically call this method
end

function Robot:outOfEdges()
    local vx = self.velocity.x
    local vy = self.velocity.y
    if self.location.x > WIDTH or self.location.x < 0 then
        vx = -vx
    end
    if self.location.y > HEIGHT or self.location.y < 0 then
        vy = -vy
    end
    self.velocity = vec2(vx, vy)
end

function Robot:shoot(touch)
    local target = vec2(touch.x, touch.y)
    local direction = (target - self.location):normalize()
    
    if touch.state == BEGAN then
        bullet = Bullet(vec2(self.location.x, self.location.y))
        bullet:applyForce(20 * direction)
        bullet:update()
    end
end
