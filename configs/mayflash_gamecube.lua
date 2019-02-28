local draw = require "draw"

return {
	name = "mayflash limited MAYFLASH GameCube Controller Adapter",
	drawBackground = function(js) draw.polygon(1, 2, 2, 8) end,
	width = 11,
	height = 5.5,
	inputs = { -- gamecube layout
		stick = {
			isActive = function(js) return true end,
			draw = function(js)
				draw.circle(1.25 + js:getAxis(1), 2.25 + js:getAxis(2), 1.5)
			end,
		},
		start = {
			isActive = function(js) return js:isDown(10) end,
			draw = function() draw.circle(5.125, 3, 0.75) end,
		},
		a = {
			isActive = function(js) return js:isDown(2) end,
			draw = function() draw.circle(8.25, 2.25, 1.5) end,
		},
		b = {
			isActive = function(js) return js:isDown(3) end,
			draw = function() draw.circle(7, 3.5, 1) end,
		},
		z = {
			isActive = function(js) return js:isDown(8) end,
			draw = function() draw.bar(8, 1, 2, 0.5) end,
		},
	},
}
