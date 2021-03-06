--[[
	Copyright (c) 2011 the original author or authors

	Permission is hereby granted to use, modify, and distribute this file
	in accordance with the terms of the license agreement accompanying it.
--]]


require "org.robotlegs.globals"
require "org.robotlegs.MessageBus"
require "org.robotlegs.Actor"

Mediator = {}

function Mediator:new(viewInstance)
	assert(viewInstance ~= nil, "A Mediator class requires a viewInstance.")
	local mediator = Actor:new()
	mediator.ID = globals.getID()
	mediator.viewInstance = viewInstance
	
	function mediator:onRegister()
	end
	
	function mediator:onRemove()
	end
	
	function mediator:destroy()
		self.viewInstance = nil
	end
	
	return mediator
end

return Mediator