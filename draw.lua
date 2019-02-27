local const = require "const"
local BUTTON_SIZE = const.BUTTON_SIZE -- for brevity

return {
	rect = function (x_tile, y_tile)
		love.graphics.rectangle("fill",
			BUTTON_SIZE * x_tile, BUTTON_SIZE * y_tile,
			BUTTON_SIZE, BUTTON_SIZE)
	end,
	circle = function (x_tile, y_tile)
		-- workaround for fill not being anti-aliased
		for _, mode in pairs({"line", "fill"}) do
			love.graphics.circle(mode,
				BUTTON_SIZE * (x_tile + 1/2), BUTTON_SIZE * (y_tile + 1/2), 
				BUTTON_SIZE / 2)
		end
	end,
}
