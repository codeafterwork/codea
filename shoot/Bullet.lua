Bullet = class(Mover)

function Bullet:init(location, velocity)
    Mover.init(self, location, velocity)
end

function Bullet:draw()
    ellipse(self.location.x, self.location.y, 20)
end

function Bullet:touched(touch)

end

function Bullet:outOfEdges()
    -- Mover.outOfEdges(self)
end
