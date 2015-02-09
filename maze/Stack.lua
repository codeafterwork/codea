Stack = class()

function Stack:init()
    self.data = {}
end

function Stack:push(item)
    self.data[#self.data+1] = item
end

function Stack:pop()
    local item = self.data[#self.data]
    self.data[#self.data] = nil
    return item
end

function Stack:isEmpty()
    return not (#self.data > 0)
end
