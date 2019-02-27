-- this is also configured to look like an SNES controller.

local draw = require "draw"

return {
	name = "mayflash limited MAYFLASH GameCube Controller Adapter",
	inputs = {
		center = { -- not an actual input
			isActive = function(js) return false end,
			draw = function() draw.rect(2, 2) end,
		},
		left = {
			isActive = function(js) return js[0]:getAxis(1) < 0 end,
			draw = function() draw.rect(1, 2) end,
		},
		right = {
			isActive = function(js) return js[0]:getAxis(1) > 0 end,
			draw = function() draw.rect(3, 2) end,
		},
		up = {
			isActive = function(js) return js[0]:getAxis(2) < 0 end,
			draw = function() draw.rect(2, 1) end,
		},
		down = {
			isActive = function(js) return js[0]:getAxis(2) > 0 end,
			draw = function() draw.rect(2, 3) end,
		},
		z = {
			isActive = function(js) return js[0]:isDown(8) end,
			draw = function() draw.circle(5, 3) end,
		},
		start = {
			isActive = function(js) return js[0]:isDown(10) end,
			draw = function() draw.circle(7, 3) end,
		},
		a = {
			isActive = function(js) return js[0]:isDown(2) end,
			draw = function() draw.circle(11, 2) end,
		},
		b = {
			isActive = function(js) return js[0]:isDown(3) end,
			draw = function() draw.circle(10, 3) end,
		},
		x = {
			isActive = function(js) return js[0]:isDown(1) end,
			draw = function() draw.circle(10, 1) end,
		},
		y = {
			isActive = function(js) return js[0]:isDown(4) end,
			draw = function() draw.circle(9, 2) end,
		},
	},
}
