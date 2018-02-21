--[[This file is for storing all the assets of the game
   i.e. images, fonts, sound]]--
local Asset = Object:extend()

local function stripString(base, s)
    local a = s:sub(base:len()+2,s:len())
    return a:sub(0, a:find("%s.")-1)
end 

local function loadFiles(base, dir, files)
    dir = dir or base
    local items = love.filesystem.getDirectoryItems(dir)
    for i,v in ipairs(items) do 
        local file = dir .. "/" .. v
        if love.filesystem.isFile(dir .. "/" .. v) then
            files[
                stripString(base, file)
            ] = file
        else
            loadFiles(base, dir .. "/" .. v, files)
        end
    end

    return files
end 

function Asset:new()
    self.imgCache = {}
    self.fontCache = {}
    self.audioCache = {}

    self.imageDirs = loadFiles("assets/images", nil, {})
    self.audioDirs = loadFiles("assets/audio", nil, {})
    self.fontDirs = loadFiles("assets/fonts", nil, {})
end

function Asset:image(url, force)
    assert(self.imgDirs[url], 'The image "' .. url .. '" does not exist!', 2)
    local img
    if force or not self.imgCache[url] then
        img = love.graphics.newImage(self.imgDirs[url])
        self.imgCache[url] = img
    else
        img = self.imgCache[url]
    end
    return img
end

function Asset:font(url, size, force)
    assert(self.fontDirs[url], 'The font "' .. url .. '" does not exist!', 2)
    local aud
    if force or not self.audioCache[url] or not self.fontCache[url][size] then
        font = love.graphics.newFont(self.fontDirs[url], size)
        if not self.fontCache[url] then
            self.fontCache[url] = {}
        end
        self.fontCache[url][size] = font
    else
        font = self.fontCache[url][size]
    end
    return font
end

function Asset:audio(url, force)
    assert(self.audioDirs[url], 'The audio "' .. url .. '" does not exist!', 2)
    local aud
    if force or not self.audioCache[url] then
        aud = love.audio.newSource(self.audioDirs[url])
        self.audioCache[url] = aud
    else
        aud = self.audioCache[url]
    end
    return aud
end

function Asset:__tostring()
    return "Asset"
end

return Asset