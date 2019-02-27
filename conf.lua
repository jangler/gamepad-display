local const = require "const"

function love.conf(t)
	t.window.resizable = false
	t.window.title = "gamepad-display"
	t.window.width = const.BUTTON_SIZE * 13
	t.window.height = const.BUTTON_SIZE * 5

	-- this is where i would disable unused modules if i cared
end
