local Once = Object:extend()

function Once:new(obj)
    self.obj = obj
    self.used = {}
end 

function Once:call(f, ...)
    if not self.used[f] then
        self.obj[f](self.obj, ...)
        self.used[f] = true
    end
end

function Once:back(f, bf, ...)
    if self.used[f] then
        self.used[f] = nil
        self.obj[bf](self.obj, ...)
    end
end

return Once