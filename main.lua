local ACTIVE_COLOR = {3/4, 3/4, 3/4}
local INACTIVE_COLOR = {1/4, 1/4, 1/4}

local configs = {
	require "configs/ibuffalo",
	require "configs/mayflash_gamecube",
}

local pad = {nil}
local inputs = {nil}

local sdl = require "sdl"
sdl.joystick_allow_background_events()

-- display the inputs of the last used joystick
function love.joystickpressed(joystick, button)
	for _, config in pairs(configs) do
		if joystick:getName() == config.name then
			pad[0] = joystick
			inputs = config.inputs
		end
	end
end

function love.draw()
	love.graphics.clear()

	for _, input in pairs(inputs) do
		if pad[0] ~= nil and input.isActive(pad) then
			love.graphics.setColor(ACTIVE_COLOR)
		else
			love.graphics.setColor(INACTIVE_COLOR)
		end
		input.draw()
	end
end
