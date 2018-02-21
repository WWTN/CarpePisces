lume = require "lib/lume"
oldprint = print
print = lume.trace
assert = lume.assert

-- lurker = require "libs/lurker"
Object = require "lib/classic"
lovebird = require "lib/lovebird"
flux = require "lib/flux"
tick = require "lib/tick"
gamera = require "lib/gamera"

--Guess I have this one going for me
buddies = require "lib/buddies"

local libs = {}
libs.debug = arg[2] == "debug"

DEBUG = libs.debug

function libs.update(dt)
	tick.update(dt)
	flux.update(dt)
	if lurker then lurker.update(dt) end
	-- if libs.debug then
		-- lovebird.update(dt)
	-- end
end

return libs