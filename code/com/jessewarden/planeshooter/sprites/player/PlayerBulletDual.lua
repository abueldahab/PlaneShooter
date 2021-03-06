require "com.jessewarden.planeshooter.core.constants"

PlayerBulletDual = {}

function PlayerBulletDual:new(startX, startY)

	local img = display.newImage("player_bullet_2.png")
	img.name = "Bullet"
	img.speed = constants.PLAYER_BULLET_SPEED
	img.x = startX
	img.y = startY
	
	physics.addBody( img, { density = 1.0, friction = 0.3, bounce = 0.2, 
								bodyType = "kinematic", 
								isBullet = true, isSensor = true, isFixedRotation = true,
								filter = { categoryBits = 2, maskBits = 4 }
							} )

	function img:destroy()
		self:dispatchEvent({name="removeFromGameLoop", target=self})
		self:removeSelf()
	end
	
	function onHit(self, event)
		if(event.other.name == "Bullet") then
			self:destroy()
			event.other:destroy()
		end
	end
	
	img.collision = onHit
	img:addEventListener("collision", img)
	
	function img:tick(millisecondsPassed)
		if(self.y < 0) then
			self:destroy()
			return
		else
			local deltaX = 0
			local deltaY = self.y - 0
			local dist = math.sqrt((deltaX * deltaX) + (deltaY * deltaY))

			local moveX = self.speed * (deltaX / dist) * millisecondsPassed
			local moveY = self.speed * (deltaY / dist) * millisecondsPassed
			
			if (math.abs(moveX) > dist or math.abs(moveY) > dist) then
				self:destroy()
			else
				self.y = self.y - moveY
			end
		end
	end
	
	return img
end

return PlayerBulletDual