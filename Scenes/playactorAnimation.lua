--playactorAnimation.lua
function setAnimation( ... )
	local sheetInfo = require("Image.Actor.ActorAnimation")
	local sheetArray = sheetInfo:getSheet()
	local myImageSheet = graphics.newImageSheet( "Image/Actor/ActorAnimation.png", sheetInfo:getSheet() )
	local sceneGroup = display.newGroup()
	local sprite 
	local isReady = true

	function playAnimation( seqdata,sp_x,sp_y)
		sprite = display.newSprite( myImageSheet, seqdata )
		sprite.x = sp_x
	    sprite.y = sp_y
		sprite:setSequence(seqdata.name)
		sprite:play()
		sceneGroup:insert( sprite )
	end

	function stopAnimation( event )
		if event.phase == "ended" then
			if(isReady == true) then
				sprite:pause()
				isReady = false
			else
				sprite:play()
				isReady = true
			end
		end
		--sceneGroup = nil
	end

	function touchfunction( ... )
		sprite:addEventListener( "touch", stopAnimation )
	end
	
end