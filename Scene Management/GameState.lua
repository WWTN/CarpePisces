GameState = {}
GameState.__index = GameState

function GameState.Create(index)
    local self = {}
    setmetatable(self, GameState)
    self.States = {}
    self.CurrentState = index
    self.LastState = -1
    return self
end

function GameState:AddState(State)
    table.insert(self.States, State)
end

function GameState:Update(dt)
    cs = self.CurrentState
    self.States[self.CurrentState]:Update(dt)
    if (self.CurrentState ~= self.LastState) then
        if (self.LastState >= 0) then
            self.States[self.CurrentState]:Load()
            self.States[self.LastState]:Unload()
        else
            self.States[self.CurrentState]:Load()
        end
        self.LastState = self.CurrentState
    end
end

function GameState:Draw()
    self.States[self.CurrentState]:Draw()
end

function GameState:ChangeState(index)
    self.CurrentState = index
end

function GameState:ActivateState()
    return self.CurrentState
end