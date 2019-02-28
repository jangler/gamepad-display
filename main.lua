local const = require "const"
local UNIT_SIZE = const.UNIT_SIZE -- for brevity

local ACTIVE_COLOR = {1/2, 1/2, 1/2}
local INACTIVE_COLOR = {1/4, 1/4, 1/4}

local configs = {
	require "configs/ibuffalo",
	require "configs/mayflash_gamecube",
}

local pad = {nil}
local inputs = {nil}
local bg = nil

local sdl = require "sdl"
sdl.joystick_allow_background_events()

-- display the inputs of the last used joystick
function love.joystickpressed(joystick, button)
	for _, config in pairs(configs) do
		if joystick:getName() == config.name and pad[0] ~= joystick then
			pad[0] = joystick
			inputs = config.inputs

			love.window.updateMode(
				config.width * UNIT_SIZE, config.height * UNIT_SIZE)

			bg = love.graphics.newCanvas(
				love.graphics.getWidth(), love.graphics.getHeight())
			love.graphics.setCanvas(bg)
			love.graphics.setColor(INACTIVE_COLOR)
			config.drawBackground()
			love.graphics.setCanvas()
		end
	end
end

function love.draw()
	love.graphics.clear()

	if bg ~= nil then
		love.graphics.setColor(1, 1, 1)
		love.graphics.draw(bg)
	end

	for _, input in pairs(inputs) do
		if pad[0] ~= nil and input.isActive(pad[0]) then
			love.graphics.setColor(ACTIVE_COLOR)
		else
			love.graphics.setColor(INACTIVE_COLOR)
		end
		input.draw(pad[0])
	end
end
