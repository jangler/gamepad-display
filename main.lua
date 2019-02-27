local const = require "const"

local BUTTON_SIZE = const.BUTTON_SIZE -- for brevity

local ACTIVE_COLOR = {1, 1, 1}
local INACTIVE_COLOR = {0.5, 0.5, 0.5}

function drawRect(x_tile, y_tile)
	love.graphics.rectangle("fill",
		BUTTON_SIZE * x_tile, BUTTON_SIZE * y_tile,
		BUTTON_SIZE, BUTTON_SIZE)
end

function drawCircle(x_tile, y_tile)
	-- workaround for fill not being anti-aliased
	for _, mode in pairs({"line", "fill"}) do
		love.graphics.circle(mode,
			BUTTON_SIZE * (x_tile + 1/2), BUTTON_SIZE * (y_tile + 1/2), 
			BUTTON_SIZE / 2)
	end
end

local pad = {nil}
local inputs = {
	{ -- left
		isActive = function() return pad[0]:getAxis(1) < 0 end,
		draw = function() drawRect(1, 2) end,
	},
	{ -- right
		isActive = function() return pad[0]:getAxis(1) > 0 end,
		draw = function() drawRect(3, 2) end,
	},
	{ -- up
		isActive = function() return pad[0]:getAxis(2) < 0 end,
		draw = function() drawRect(2, 1) end,
	},
	{ -- down
		isActive = function() return pad[0]:getAxis(2) > 0 end,
		draw = function() drawRect(2, 3) end,
	},
	{ -- select
		isActive = function() return pad[0]:isDown(7) end,
		draw = function() drawCircle(5, 3) end,
	},
	{ -- start
		isActive = function() return pad[0]:isDown(8) end,
		draw = function() drawCircle(7, 3) end,
	},
	{ -- A
		isActive = function() return pad[0]:isDown(1) end,
		draw = function() drawCircle(11, 2) end,
	},
	{ -- B
		isActive = function() return pad[0]:isDown(2) end,
		draw = function() drawCircle(10, 3) end,
	},
	{ -- X
		isActive = function() return pad[0]:isDown(3) end,
		draw = function() drawCircle(10, 1) end,
	},
	{ -- Y
		isActive = function() return pad[0]:isDown(4) end,
		draw = function() drawCircle(9, 2) end,
	},
}

-- display the inputs of the last used joystick
function love.joystickpressed(joystick, button)
	pad[0] = joystick
end

function love.draw()
	love.graphics.clear()

	-- center of d-pad
	love.graphics.setColor(INACTIVE_COLOR)
	drawRect(2, 2)

	for _, input in pairs(inputs) do
		if pad[0] ~= nil and input.isActive() then
			love.graphics.setColor(ACTIVE_COLOR)
		else
			love.graphics.setColor(INACTIVE_COLOR)
		end
		input.draw()
	end
end
