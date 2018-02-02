local Class = require "lib.Class"

local EM = Class:derive("EntityMgr")

local function contains(list, item)
    for val in pairs(list) do
        if val == item then return true end
    end
    return false
end

local function layer_compare(e1, e2)
    return e1.layer < e2.layer
end

function EM:new()
    self.entities = {}
end

function EM:add(entity)
    if contains(self.entities, entity) then return end
    --Add additional table entries that we want for all entites
    entity.layer = entity.layer or 1
    entity.started = entity.started or false
    entity.enabled = (entity.enabled == nil) or entity.enabled
    self.entities[#self.entities + 1] = entity

    -- INCOMPLETE: Sort entities
    table.sort(self.entites, layer_compare)
end


function EM:on_enter()
    for i = 1, #self.entities do
        local e = self.entities[i]
        if e.on_enter then e:on_enter() end
    end
end

function EM:on_exit()
    for i = 1, #self.entites do
        local e = self.entities[i]
        if e.on_enter then e:on_exit() end
    end
end

function EM:update(dt)
    for i = #self.entites, 1, -1 do
        local e = self.entities[i]
        
        -- removes entity on request
        if e.remove == true then
            e.remove = false
            if e.on_remove then e:on_remove() end
            table.remove(self.entities, i)
        end

        if e.enabled then
            if not e.started then
                e.started = true
                if e.on_start then e:on_start() end
            else
                e:update(dt)
            end
        end
    end
end

function EM:draw()
    for i = 1, #self.entities do
        if self.entities[i].enabled then
            self.entities[i]:draw()
        end
    end
end

return EM