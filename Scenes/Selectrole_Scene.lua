--Selectrole_Scene.lua
local widget= require("widget")
local composer = require( "composer" )
local scene = composer.newScene()
local sheetInfo = require("Image.Actor.ActorAnimation")
local sceneGroup
local scrollView
local startButton,readybutton
local i,j,l,m = 1,1,1,1

local chooserole = {false,false,false,false}
local readytimer,ready2timer

local ready1,ready2,ready3,ready4

--local sheetArray = sheetInfo:getSheet()
local myImageSheet = graphics.newImageSheet( "Image/Actor/ActorAnimation.png", sheetInfo:getSheet() )

local roleButton

function startButtonEvent( ... )

end

function readyButtonEvent( ... )
	composer.setVariable( "chooserole", chooserole)
	composer.gotoScene( "Scenes.GameDescription_Scene", frad,400)
end

function playAnimation( ImageSheet,seqdata,sp_x,sp_y)
	sprite = display.newSprite( ImageSheet, seqdata )
	sprite.x = sp_x
    sprite.y = sp_y
	sprite:setSequence(seqdata.name)
	sprite:play()
	sceneGroup:insert( sprite )
end

function createrolebutton( Btn_Id,obj )

	local function touchListener( event )
		if event.phase == "ended" then
			print(event.target.id )

			if(event.target.id == "DazyAnimation") then
				if(chooserole[1] == false)then
					print("Animation pause")
					ready1 = display.newImage( "Image/ActorSel/selector_ok.png" )
					ready1.x = display.contentWidth * 0.15
	    			ready1.y = display.contentHeight * 0.32
					sceneGroup:insert( ready1 )
					Dazysprite:pause()
					chooserole[1] = true
				elseif chooserole[1] == true then
					display.remove(ready1)
					Dazysprite:play()
					chooserole[1] = false
				end
			end

			if(event.target.id == "trickyAnimation") then
				if(chooserole[2] == false)then
					print("Animation pause")
					ready2 = display.newImage( "Image/ActorSel/selector_ok.png" )
					ready2.x = display.contentWidth * 0.4
	    			ready2.y = display.contentHeight * 0.59
					sceneGroup:insert( ready2 )
					trickysprite:pause()
					chooserole[2] = true
				elseif chooserole[2] == true then
					display.remove(ready2)
					trickysprite:play()
					chooserole[2] = false
				end
			end

			if(event.target.id == "Chunk&EddyAnimation") then
				if(chooserole[3] == false)then
					print("Animation pause")
					ready3 = display.newImage( "Image/ActorSel/selector_ok.png" )
					ready3.x = display.contentWidth * 0.7
	    			ready3.y = display.contentHeight * 0.5
					sceneGroup:insert( ready3 )
					ChunkAEddysprite:pause()
					chooserole[3] = true
				elseif chooserole[3] == true then
					display.remove(ready3)
					ChunkAEddysprite:play()
					chooserole[3] = false
				end
			end

			if(event.target.id == "AshAnimation") then
				if(chooserole[4] == false)then
					print("Animation pause")
					ready4 = display.newImage( "Image/ActorSel/selector_ok.png" )
					ready4.x = display.contentWidth * 0.93
	    			ready4.y = display.contentHeight * 0.4
					sceneGroup:insert( ready4 )
					Ashsprite:pause()
					chooserole[4] = true
				elseif chooserole[4] == true then
					display.remove(ready4)
					Ashsprite:play()
					chooserole[4] = false
				end
			end
		end
    	
	end



	roleButton =  widget.newButton(
    {
        id = Btn_Id,
        --label = "Default",
        onEvent  = touchListener

    }
    )
    roleButton.x = obj.x
    roleButton.y = obj.y
    roleButton.width = obj.width
    roleButton.height = obj.height
    scrollView:insert( roleButton )
end

function scene:create( event )
	sceneGroup = self.view

	--背景圖片
	local backgrounkImage = display.newImage( "Image/ActorSel/selector_back.jpg" )
	backgrounkImage.x = display.contentCenterX
	backgrounkImage.y = display.contentCenterY
	sceneGroup:insert( backgrounkImage )

	local function scrollListener( event )
 
	    local phase = event.phase
	    if(event.phase == "began") then 
            --display.getCurrentStage( ):setFocus( event.target , event.id )
             print("began")
 		elseif(event.phase == "moved") then 
            print("moved")
 		elseif(event.phase == "ended" or event.phase == "cancelled") then 
            display.getCurrentStage( ):setFocus( nil , event.id )
 		    print("ended")
        end 
	    -- In the event a scroll limit is reached...
	    if ( event.limitReached ) then
	        if ( event.direction == "up" ) then print( "Reached bottom limit" )
	        elseif ( event.direction == "down" ) then print( "Reached top limit" )
	        elseif ( event.direction == "left" ) then print( "Reached right limit" )
	        elseif ( event.direction == "right" ) then print( "Reached left limit" )
	        end
	    end
	 
	    return true
	end

	scrollView = widget.newScrollView {
		width = display.contentWidth,
		height = display.contentHeight ,
		hideBackground = true,
		backgroundColor =  { 0.8, 0.8, 0.8 },
		--isBounceEnabled = false,
		horizontalScrollDisabled = false,
		verticalScrollDisabled = true,
		listener = scrollListener
	}
	scrollView.x = display.contentWidth * 0.5
	scrollView.y = display.contentHeight * 0.5
	scrollView:setScrollWidth( display.contentWidth * 2 )
	scrollView:setScrollHeight( 100 )
	sceneGroup:insert( scrollView )

	local rolenameImage = display.newImage( "Image/ActorSel/selector_name.png" )
	rolenameImage.x = display.contentWidth * 0.52
	rolenameImage.y = display.contentHeight * 0.58
	
	local rolenameImage2 = display.newImage( "Image/ActorSel/selector_name2.png" )
	rolenameImage2.x = display.contentWidth * 1.5
	rolenameImage2.y = display.contentHeight * 0.58

	local topBar = display.newImage( "Image/ActorSel/selector_curtain.png" )
	topBar.x = display.contentCenterX
	topBar.y = display.contentHeight * 0.07
	



	startButton =  widget.newButton(
    {
        defaultFile = "Image/ActorSel/selector_cant_start.png",
        onPress  = startButtonEvent
    }
    )
    startButton.x = display.contentWidth * 0.37
	startButton.y = display.contentHeight * 0.18
	sceneGroup:insert( startButton ) 



---角色動畫

	--Dazy角色
	local DazysequenceData = 
	{
	   
	    name="Dazy",                                  -- name of the animation
	    sheet=myImageSheet,                           -- the image sheet
	    start=sheetInfo:getFrameIndex("Dazy/Dazy01"), -- first frame
	    count=8,                                      -- number of frames
	    time=1000,                                    -- speed
	    loopCount=0,                                   -- repeat
	    loopDirection="bounce"

	}

	Dazysprite = display.newSprite( myImageSheet, DazysequenceData )
	Dazysprite.x = display.contentWidth * 0.14
    Dazysprite.y = display.contentHeight * 0.62
	Dazysprite:setSequence(DazysequenceData)
	Dazysprite:play()
	scrollView:insert( Dazysprite )

	--tricky角色
	local trickysequenceData = 
	{
	   
	    name="tricky",                                  -- name of the animation
	    sheet=myImageSheet,                           -- the image sheet
	    start=sheetInfo:getFrameIndex("Tricky/tricky01"), -- first frame
	    count=8,                                      -- number of frames
	    time=1000,                                    -- speed
	    loopCount=0,                                   -- repeat
	    loopDirection="bounce"

	}

	trickysprite = display.newSprite( myImageSheet, trickysequenceData )
	trickysprite.x = display.contentWidth * 0.38
    trickysprite.y = display.contentHeight * 0.65
    trickysprite.id = "trickyAnimation"
	trickysprite:setSequence(trickysequenceData)
	trickysprite:play()
	scrollView:insert( trickysprite )

	--Chunk&Eddy角色
	local ChunkAEddysequenceData = 
	{
	   
	    name="Chunk&Eddy",                                  -- name of the animation
	    sheet=myImageSheet,                           -- the image sheet
	    start=sheetInfo:getFrameIndex("Chunk&amp;Eddy/Chunk&amp;Eddy01"), -- first frame
	    count=8,                                      -- number of frames
	    time=1000,                                    -- speed
	    loopCount=0,                                   -- repeat
	    loopDirection="bounce"

	}

	ChunkAEddysprite = display.newSprite( myImageSheet, ChunkAEddysequenceData )
	ChunkAEddysprite.x = display.contentWidth * 0.63
    ChunkAEddysprite.y = display.contentHeight * 0.55
    ChunkAEddysprite.id = "ChunkandEddyAnimation"
	ChunkAEddysprite:setSequence(ChunkAEddysequenceData)
	ChunkAEddysprite:play()
	scrollView:insert( ChunkAEddysprite )

	--Ash角色
	local AshsequenceData = 
	{
	   
	    name="Ash",                                  -- name of the animation
	    sheet=myImageSheet,                           -- the image sheet
	    start=sheetInfo:getFrameIndex("Ash/Ash01"), -- first frame
	    count=8,                                      -- number of frames
	    time=1000,                                    -- speed
	    loopCount=0,                                   -- repeat
	    loopDirection="bounce"

	}

	Ashsprite = display.newSprite( myImageSheet, AshsequenceData )
	Ashsprite.x = display.contentWidth * 0.85
    Ashsprite.y = display.contentHeight * 0.42
    Ashsprite.id = "AshAnimation"
	Ashsprite:setSequence(AshsequenceData)
	Ashsprite:play()
	scrollView:insert( Ashsprite )

	--Wonder角色
	local WondersequenceData = 
	{
	   
	    name="Wonder",                                  -- name of the animation
	    sheet=myImageSheet,                           -- the image sheet
	    start=sheetInfo:getFrameIndex("Wonder/Wonder01"), -- first frame
	    count=8,                                      -- number of frames
	    time=1000,                                    -- speed
	    loopCount=0,                                   -- repeat
	    loopDirection="bounce"

	}

	Wondersprite = display.newSprite( myImageSheet, WondersequenceData )
	Wondersprite.x = display.contentWidth * 1.15
    Wondersprite.y = display.contentHeight * 0.6
    Wondersprite.id = "WonderAnimation"
	Wondersprite:setSequence(WondersequenceData)
	Wondersprite:play()
	scrollView:insert( Wondersprite )
	
	sceneGroup:insert( topBar )

	--Papaya角色
	local PapayasequenceData = 
	{
	   
	    name="Papaya",                                  -- name of the animation
	    sheet=myImageSheet,                           -- the image sheet
	    start=sheetInfo:getFrameIndex("Papaya/Papaya01"), -- first frame
	    count=8,                                      -- number of frames
	    time=1000,                                    -- speed
	    loopCount=0,                                   -- repeat
	    loopDirection="bounce"

	}

	Papayasprite = display.newSprite( myImageSheet, PapayasequenceData )
	Papayasprite.x = display.contentWidth * 1.38
    Papayasprite.y = display.contentHeight * 0.67
    Papayasprite.id = "PapayaAnimation"
	Papayasprite:setSequence(PapayasequenceData)
	Papayasprite:play()
	scrollView:insert( Papayasprite )

	--Strip角色
	local StripsequenceData = 
	{
	   
	    name="Strip",                                  -- name of the animation
	    sheet=myImageSheet,                           -- the image sheet
	    start=sheetInfo:getFrameIndex("Strip/Strip01"), -- first frame
	    count=8,                                      -- number of frames
	    time=1000,                                    -- speed
	    loopCount=0,                                   -- repeat
	    loopDirection="bounce"

	}

	Stripsprite = display.newSprite( myImageSheet, StripsequenceData )
	Stripsprite.x = display.contentWidth * 1.66
    Stripsprite.y = display.contentHeight * 0.48
    Stripsprite.id = "StripAnimation"
	Stripsprite:setSequence(StripsequenceData)
	Stripsprite:play()
	scrollView:insert( Stripsprite )

	--Momo角色
	local MomosequenceData = 
	{
	   
	    name="Momo",                                  -- name of the animation
	    sheet=myImageSheet,                           -- the image sheet
	    start=sheetInfo:getFrameIndex("Momo/Momo01"), -- first frame
	    count=8,                                      -- number of frames
	    time=1000,                                    -- speed
	    loopCount=0,                                   -- repeat
	    loopDirection="bounce"

	}

	Momosprite = display.newSprite( myImageSheet, MomosequenceData )
	Momosprite.x = display.contentWidth * 1.9
    Momosprite.y = display.contentHeight * 0.55
    Momosprite.id = "MomoAnimation"
	Momosprite:setSequence(MomosequenceData)
	Momosprite:play()
	scrollView:insert( Momosprite )
	
	sceneGroup:insert( topBar )
	
	

	
	--[[Dazysprite:addEventListener( "touch", touchListener )
	trickysprite:addEventListener( "touch", touchListener )
	ChunkAEddysprite:addEventListener( "touch", touchListener )
	Ashsprite:addEventListener( "touch", touchListener )]]

	createrolebutton("DazyAnimation",Dazysprite)
	createrolebutton("trickyAnimation",trickysprite)
	createrolebutton("Chunk&EddyAnimation",ChunkAEddysprite)
	createrolebutton("AshAnimation",Ashsprite)
	scrollView:insert( rolenameImage )
	scrollView:insert( rolenameImage2 )

	function readytimerListener( ... )
		for s=1,#chooserole do
			if chooserole[s] == true then
				display.remove(startButton)
				readybutton =  widget.newButton(
			    {
			        defaultFile = "Image/ActorSel/selector_start.png",
			        onPress  = readyButtonEvent
			    }
			    )
			    readybutton.x = display.contentWidth * 0.37
				readybutton.y = display.contentHeight * 0.18
				sceneGroup:insert( readybutton )
				timer.pause( readytimer ) 
				timer.resume( ready2timer )
				break
			end
		end
	end

	function ready2timerListener( ... )
		
		if chooserole[1] == false and chooserole[2] == false and chooserole[3] == false and chooserole[4] == false  then
			display.remove(startButton)
			startButton =  widget.newButton(
		    {
		        defaultFile = "Image/ActorSel/selector_cant_start.png",
		        onPress  = startButtonEvent
		    }
		    )
		    startButton.x = display.contentWidth * 0.37
			startButton.y = display.contentHeight * 0.18
			sceneGroup:insert( startButton ) 
			timer.pause( ready2timer ) 
			timer.resume( readytimer )
		
		end
		
	end

	readytimer = timer.performWithDelay( 120, readytimerListener,0 )
	ready2timer = timer.performWithDelay( 120, ready2timerListener,0 )
	timer.pause( ready2timer )

end
function scene:show( event )
	local phase = event.phase

	if "did" == phase then
		print( "1: show event, phase did" )
	end	
end

function scene:hide( event )
	local phase = event.phase
	if "will" == phase then
		print( "1: hide event, phase will" )

	end
end



function scene:destroy( event )
	print( "((destroying scene 1's view))" )
end

scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )

return scene




