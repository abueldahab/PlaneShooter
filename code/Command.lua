module (..., package.seeall)

function new()
	local command = require("Actor").new()
	
	function command:execute(event)
	end

	return command
end