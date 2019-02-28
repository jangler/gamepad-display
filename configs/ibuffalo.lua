local draw = require "draw"

return {
	name = "USB,2-axis 8-button gamepad  ",
	drawBackground = function() draw.rect(2, 3.5, 1, 1) end,
	width = 13,
	height = 7,
	inputs = {
		left = {
			isActive = function(js) return js:getAxis(1) < 0 end,
			draw = function() draw.rect(1, 3.5, 1, 1) end,
		},
		right = {
			isActive = function(js) return js:getAxis(1) > 0 end,
			draw = function() draw.rect(3, 3.5, 1, 1) end,
		},
		up = {
			isActive = function(js) return js:getAxis(2) < 0 end,
			draw = function() draw.rect(2, 2.5, 1, 1) end,
		},
		down = {
			isActive = function(js) return js:getAxis(2) > 0 end,
			draw = function() draw.rect(2, 4.5, 1, 1) end,
		},
		sel = {
			isActive = function(js) return js:isDown(7) end,
			draw = function() draw.circle(5, 4, 1) end,
		},
		start = {
			isActive = function(js) return js:isDown(8) end,
			draw = function() draw.circle(7, 4, 1) end,
		},
		a = {
			isActive = function(js) return js:isDown(1) end,
			draw = function() draw.circle(11, 3.5, 1) end,
		},
		b = {
			isActive = function(js) return js:isDown(2) end,
			draw = function() draw.circle(10, 4.5, 1) end,
		},
		x = {
			isActive = function(js) return js:isDown(3) end,
			draw = function() draw.circle(10, 2.5, 1) end,
		},
		y = {
			isActive = function(js) return js:isDown(4) end,
			draw = function() draw.circle(9, 3.5, 1) end,
		},
		l = {
			isActive = function(js) return js:isDown(5) end,
			draw = function() draw.bar(1, 1, 3, 0.5) end,
		},
		r = {
			isActive = function(js) return js:isDown(6) end,
			draw = function() draw.bar(9, 1, 3, 0.5) end,
		},
	},
}
