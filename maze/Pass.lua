Pass = class()

function Pass:init(blocked)
    self.blocked = blocked and true or false
end

function Pass:open()
    self.blocked = false
end

function Pass:close()
    self.blocked = true
end
