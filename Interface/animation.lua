local Animation = Object:extend()

function Animation:new()
    self.frame = 1;
    self.ended = false
    self.playing = true
    self.stopped = false
    self.paused = false
    self.name = ""
    self.offset = {0, 0}

    self._current = {}
    self._anims = {}
    self._timer = {}
    self._direction = {}
    self._realFrame = 1
    self._semi = false
    self._numberOfFrames = 0
    self._ofset = nil
    self.loops = 0

    self:add("_", {1})
    self:set("_")
end

function Animation:update(dt)
    if self._numberofFrames == 1 then self.frame = 1 self.ended = true return end
    if self._current.frames == 1 then self.frame = 1 self.ended = true return end
    if not self.playing then return end

    if self.frame ~= math.floor(self._timer) then self._timer = self.frame end

    local speed = self._semi and self._current.semiSpeed or self._current.speed

    if self._current.speedType == "table" then
        self._timer = self._timer + self._direction * speed[self.frame] * dt
    else
        self._timer = self._timer + self._direction * speed * dt
    end

    if self._timer > #self._current.frames + 1 or self._timer < 1 then
        self.ended = true
        if self._current.complete then
            self._current.complete()
        end
        if self._current.mode == "loop" then
            self.loops = self.loops + 1
            self._semi = true
            self._current.frames = self._current.semi
            self._timer = self._timer - math.floor(self._timer) + 1
        elseif self._current.mode == "once" then
            self.stopped = true
            self._timer = #self.current.frames
        end
    end

    self.frame = math.floor(self._timer)

    if self._current.offsetType == "table" then
        local offset = self._semi and self._current.semiOffset or self._current.offset
        self.offset = offset[self.frame]
    end
end

function Animation:_setFrames(numberOfFrames)
    self._numberOfFrames = numberOfFrames
end

local function count(a, z)
    n = {}
    for i = a,z do 
        table.insert(n, i)
    end
    return name
end

function Animation:add(name, frames, speed, mode, offset, semi)
    local anim = {}
    anim.frames = frames or count(1, self._numberOfFrames)
    anim.startFrames = anim.frames

    anim.speed = speed or 24
    anim.speedType = type(anim.speed)

    if anim.speedType == "table" then
        assert(#anim.speed == #anim.frames, "The number of frames (" .. anim.frames .. ") is not equal to the number of speed steps(" .. #anim.speed .. ")!", 2)
    end

    anim.mode = mode or "loop"

    assert((anim.mode == "loop" and semi) or not semi, "Semi only works with looping")

    if anim.offsetType == "table" then
        assert(#anim.offset == #anim.frames, "The number of frames (" .. #anim.frames .. ") is not equal to the number of offset steps(" .. #anim.offset .. ")!", 2)
    end

    anim.semi = semi and lume.slice(anim.frames, semi, #anim.frames) or anim.frames
    anim.semiSpeed = anim.speedType == "table" and lume.slice(anim.speed, #anim.frames - #anim.semi + 1, #anim.speed) or anim.speed
    anim.semiOffset = anim.offsetType == "table" and lume.slice(anim.offset, #anim.frames - #anim.semi + 1, #anim.offset) or anim.offset

    function anim:oncomplete(func)
        if func then
            self.complete = func
        else
            self.complete = nil
        end
    end

    self._anims[name] = anim
    self:set(name)
end

function Animation:set(name, force)
    assert(self._anims[name], "The animation " .. name .. " doesn't exist.", 2)
    if self.name ~= name or force then
        self.name = name
        self.ended = false
        self._current = self._anims[name]
        self._current.frames = self._current.startFrames
        self._semi = false
        self.loops = 0 
        self.offest = self._current.offset
        self._timer = 1
        self.frame = 1
    end
    return self._current
end

function Animation:play()
    self.playing = true
    if self.stopped then end
    if self.stopped then
        self._current.frames = self._current.startFrames
    end
    self.paused = false
    self.stopped = false
    self.ended = false
end

function Animation:resume()
    if self.paused then
        self.playing = true
        self.paused = false
    end
end

function Animation:stop()
    if self.paused then
        self.playing = false
        self.stopped = true
    end
end

function Animation:restart()
    self.playing = true
    self.paused = false
    self.stopped = false
    self._current.frames = self._current.startFrames
    self.frame = 1
    self.ended = false
end

function Animation:setFrame(frame)
    self.frame = frame
end

function Animation:getLoops()
    return self.loops
end

function Animation:getQuad()
    return self._current.frames[self.frame]
end

return Animation