-- all the drawing functions here treat the (x,y) coordinate as the top left
-- corner of the shape's bounding box, *not* as the center. where applicable,
-- the dimensions given are always diameter and not radius.

-- drawing shapes with both fill and outline is a workaround for fill not being
-- anti-aliased.

local const = require "const"
local UNIT_SIZE = const.UNIT_SIZE -- for brevity

return {
	rect = function(x, y, width, height)
		love.graphics.rectangle("fill",
			UNIT_SIZE * x, UNIT_SIZE * y,
			UNIT_SIZE * width, UNIT_SIZE * height)
	end,
	bar = function(x, y, width, height) -- a rounded rectangle
		for _, mode in pairs({"line", "fill"}) do
			love.graphics.rectangle(mode,
				UNIT_SIZE * x, UNIT_SIZE * y,
				UNIT_SIZE * width, UNIT_SIZE * height,
				UNIT_SIZE * math.min(width/2, height/2))
		end
	end,
	circle = function(x, y, diameter)
		for _, mode in pairs({"line", "fill"}) do
			love.graphics.circle(mode,
				UNIT_SIZE * (x + diameter/2), UNIT_SIZE * (y + diameter/2),
				UNIT_SIZE * diameter/2)
		end
	end,
	polygon = function(x, y, diameter, numVertices)
		for _, mode in pairs({"line", "fill"}) do
			local vertices = {}
			for i = 1,numVertices do
				vertices[i*2-1] = UNIT_SIZE * (x + diameter/2 +
					math.cos(2 * math.pi * (i-1) / numVertices) * diameter/2)
				vertices[i*2] = UNIT_SIZE * (y + diameter/2 +
					math.sin(2 * math.pi * (i-1) / numVertices) * diameter/2)
			end
			love.graphics.polygon(mode, vertices)
		end
	end,
}
