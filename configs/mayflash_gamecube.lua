local draw = require "draw"

return {
	name = "mayflash limited MAYFLASH GameCube Controller Adapter",
	drawBackground = function(js) draw.polygon(1, 1, 3, 8) end,
	width = 9.5,
	height = 5,
	inputs = { -- gamecube layout for game boy / nes
		stick = {
			isActive = function(js) return true end,
			draw = function(js)
				draw.circle(1.5 + js:getAxis(1), 1.5 + js:getAxis(2), 2)
			end,
		},
		start = {
			isActive = function(js) return js:isDown(10) end,
			draw = function() draw.circle(4.5, 1, 1) end,
		},
		a = {
			isActive = function(js) return js:isDown(2) end,
			draw = function() draw.circle(6.5, 2, 2) end,
		},
		b = {
			isActive = function(js) return js:isDown(3) end,
			draw = function() draw.circle(5, 3, 1) end,
		},
		z = {
			isActive = function(js) return js:isDown(8) end,
			draw = function() draw.bar(6.5, 1, 2, 0.5) end,
		},
	},
}
