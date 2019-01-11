--Selectrole_Scene.lua
local widget= require("widget")
local composer = require( "composer" )
local scene = composer.newScene()

local sceneGroup
local scrollView
local startButton,readybutton
local i,j,l,m = 1,1,1,1

local chooserole = {false,false,false,false}
local readytimer,ready2timer

local ready1,ready2,ready3,ready4

function startButtonEvent( ... )

	

	
	
end

function readyButtonEvent( ... )
	composer.setVariable( "chooserole", chooserole)
	composer.gotoScene( "Scenes.GameDescription_Scene", frad,400)
end

function scene:create( event )
	sceneGroup = self.view
	
	--背景圖片
	local backgrounkImage = display.newImage( "Image/ActorSel/selector_back.jpg" )
	backgrounkImage.x = display.contentCenterX
	backgrounkImage.y = display.contentCenterY
	sceneGroup:insert( backgrounkImage )

	local rolenameImage = display.newImage( "Image/ActorSel/selector_name.png" )
	rolenameImage.x = display.contentWidth * 0.52
	rolenameImage.y = display.contentHeight * 0.58
	

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
	

---------------------------------------------------------------------------------------------------------------------

--Dazy角色動畫
	local DazyData = { width=91, height=210, numFrames=1}
	local Dazysheet1 = graphics.newImageSheet( "Image/ActorSel/selector/bubu/selector_bu01.png", DazyData )
	local Dazysheet2 = graphics.newImageSheet( "Image/ActorSel/selector/bubu/selector_bu02.png", DazyData )
	local Dazysheet3 = graphics.newImageSheet( "Image/ActorSel/selector/bubu/selector_bu03.png", DazyData )
	local Dazysheet4 = graphics.newImageSheet( "Image/ActorSel/selector/bubu/selector_bu04.png", DazyData )
	local Dazysheet5 = graphics.newImageSheet( "Image/ActorSel/selector/bubu/selector_bu05.png", DazyData )
	local Dazysheet6 = graphics.newImageSheet( "Image/ActorSel/selector/bubu/selector_bu06.png", DazyData )
	local Dazysheet7 = graphics.newImageSheet( "Image/ActorSel/selector/bubu/selector_bu07.png", DazyData )
	local Dazysheet8 = graphics.newImageSheet( "Image/ActorSel/selector/bubu/selector_bu08.png", DazyData )
	local Dazysheet9 = graphics.newImageSheet( "Image/ActorSel/selector/bubu/selector_bu09.png", DazyData )
	local Dazysheet10 = graphics.newImageSheet( "Image/ActorSel/selector/bubu/selector_bu10.png", DazyData )
	local Dazysheet11 = graphics.newImageSheet( "Image/ActorSel/selector/bubu/selector_bu11.png", DazyData )
	local Dazysheet12 = graphics.newImageSheet( "Image/ActorSel/selector/bubu/selector_bu12.png", DazyData )
	local Dazysheet13 = graphics.newImageSheet( "Image/ActorSel/selector/bubu/selector_bu13.png", DazyData )
	local Dazysheet14 = graphics.newImageSheet( "Image/ActorSel/selector/bubu/selector_bu14.png", DazyData )
	local DazySequenceData = {
                { name="Dazyseq1", sheet=Dazysheet1, start=1, count=1, time=220, loopCount=0 },
                { name="Dazyseq2", sheet=Dazysheet2, start=1, count=1, time=220, loopCount=0 },
                { name="Dazyseq3", sheet=Dazysheet3, start=1, count=1, time=220, loopCount=0 },
                { name="Dazyseq4", sheet=Dazysheet4, start=1, count=1, time=220, loopCount=0 },
                { name="Dazyseq5", sheet=Dazysheet5, start=1, count=1, time=220, loopCount=0 },
                { name="Dazyseq6", sheet=Dazysheet6, start=1, count=1, time=220, loopCount=0 },
                { name="Dazyseq7", sheet=Dazysheet7, start=1, count=1, time=220, loopCount=0 },
                { name="Dazyseq8", sheet=Dazysheet8, start=1, count=1, time=220, loopCount=0 },
                { name="Dazyseq9", sheet=Dazysheet9, start=1, count=1, time=220, loopCount=0 },
                { name="Dazyseq10", sheet=Dazysheet10, start=1, count=1, time=220, loopCount=0 },
                { name="Dazyseq11", sheet=Dazysheet11, start=1, count=1, time=220, loopCount=0 },
                { name="Dazyseq12", sheet=Dazysheet12, start=1, count=1, time=220, loopCount=0 },
                { name="Dazyseq13", sheet=Dazysheet13, start=1, count=1, time=220, loopCount=0 },
                { name="Dazyseq14", sheet=Dazysheet14, start=1, count=1, time=220, loopCount=0 },
                }
    local myAnimation = display.newSprite( Dazysheet1, DazySequenceData )
    myAnimation.id = "DazyAnimation"
    myAnimation.x = display.contentWidth * 0.14
    myAnimation.y = display.contentHeight * 0.62
    sceneGroup:insert( myAnimation )



--tricky角色動畫
	local trickyData = { width=129, height=129, numFrames=1}
	local trickysheet1 = graphics.newImageSheet( "Image/ActorSel/selector/little/selector_little01.png", trickyData )
	local trickysheet2 = graphics.newImageSheet( "Image/ActorSel/selector/little/selector_little02.png", trickyData )
	local trickysheet3 = graphics.newImageSheet( "Image/ActorSel/selector/little/selector_little03.png", trickyData )
	local trickysheet4 = graphics.newImageSheet( "Image/ActorSel/selector/little/selector_little04.png", trickyData )
	local trickysheet5 = graphics.newImageSheet( "Image/ActorSel/selector/little/selector_little05.png", trickyData )
	local trickysheet6 = graphics.newImageSheet( "Image/ActorSel/selector/little/selector_little06.png", trickyData )
	local trickysheet7 = graphics.newImageSheet( "Image/ActorSel/selector/little/selector_little07.png", trickyData )
	local trickysheet8 = graphics.newImageSheet( "Image/ActorSel/selector/little/selector_little08.png", trickyData )
	local trickysheet9 = graphics.newImageSheet( "Image/ActorSel/selector/little/selector_little09.png", trickyData )
	local trickysheet10 = graphics.newImageSheet( "Image/ActorSel/selector/little/selector_little10.png", trickyData )
	local trickysheet11 = graphics.newImageSheet( "Image/ActorSel/selector/little/selector_little11.png", trickyData )
	local trickysheet12 = graphics.newImageSheet( "Image/ActorSel/selector/little/selector_little12.png", trickyData )
	local trickysheet13 = graphics.newImageSheet( "Image/ActorSel/selector/little/selector_little13.png", trickyData )
	local trickysheet14 = graphics.newImageSheet( "Image/ActorSel/selector/little/selector_little14.png", trickyData )
	local trickySequenceData = {
                { name="trickyseq1", sheet=trickysheet1, start=1, count=1, time=220, loopCount=0 },
                { name="trickyseq2", sheet=trickysheet2, start=1, count=1, time=220, loopCount=0 },
                { name="trickyseq3", sheet=trickysheet3, start=1, count=1, time=220, loopCount=0 },
                { name="trickyseq4", sheet=trickysheet4, start=1, count=1, time=220, loopCount=0 },
                { name="trickyseq5", sheet=trickysheet5, start=1, count=1, time=220, loopCount=0 },
                { name="trickyseq6", sheet=trickysheet6, start=1, count=1, time=220, loopCount=0 },
                { name="trickyseq7", sheet=trickysheet7, start=1, count=1, time=220, loopCount=0 },
                { name="trickyseq8", sheet=trickysheet8, start=1, count=1, time=220, loopCount=0 },
                { name="trickyseq9", sheet=trickysheet9, start=1, count=1, time=220, loopCount=0 },
                { name="trickyseq10", sheet=trickysheet10, start=1, count=1, time=220, loopCount=0 },
                { name="trickyseq11", sheet=trickysheet11, start=1, count=1, time=220, loopCount=0 },
                { name="trickyseq12", sheet=trickysheet12, start=1, count=1, time=220, loopCount=0 },
                { name="trickyseq13", sheet=trickysheet13, start=1, count=1, time=220, loopCount=0 },
                { name="trickyseq14", sheet=trickysheet14, start=1, count=1, time=220, loopCount=0 },
                }
    local myAnimation2 = display.newSprite( trickysheet1, trickySequenceData )
    myAnimation2.id = "trickyAnimation"
    myAnimation2.x = display.contentWidth * 0.38
    myAnimation2.y = display.contentHeight * 0.65
    sceneGroup:insert( myAnimation2 )



--Chunk&Eddy角色動畫
    local ChunkandEddyData = { width=123, height=185, numFrames=1}
	local ChunkandEddysheet1 = graphics.newImageSheet( "Image/ActorSel/selector/haha/selector_haha01.png", ChunkandEddyData )
	local ChunkandEddysheet2 = graphics.newImageSheet( "Image/ActorSel/selector/haha/selector_haha02.png", ChunkandEddyData )
	local ChunkandEddysheet3 = graphics.newImageSheet( "Image/ActorSel/selector/haha/selector_haha03.png", ChunkandEddyData )
	local ChunkandEddysheet4 = graphics.newImageSheet( "Image/ActorSel/selector/haha/selector_haha04.png", ChunkandEddyData )
	local ChunkandEddysheet5 = graphics.newImageSheet( "Image/ActorSel/selector/haha/selector_haha05.png", ChunkandEddyData )
	local ChunkandEddysheet6 = graphics.newImageSheet( "Image/ActorSel/selector/haha/selector_haha06.png", ChunkandEddyData )
	local ChunkandEddysheet7 = graphics.newImageSheet( "Image/ActorSel/selector/haha/selector_haha07.png", ChunkandEddyData )
	local ChunkandEddysheet8 = graphics.newImageSheet( "Image/ActorSel/selector/haha/selector_haha08.png", ChunkandEddyData )
	local ChunkandEddysheet9 = graphics.newImageSheet( "Image/ActorSel/selector/haha/selector_haha09.png", ChunkandEddyData )
	local ChunkandEddysheet10 = graphics.newImageSheet( "Image/ActorSel/selector/haha/selector_haha10.png", ChunkandEddyData )
	local ChunkandEddysheet11 = graphics.newImageSheet( "Image/ActorSel/selector/haha/selector_haha11.png", ChunkandEddyData )
	local ChunkandEddysheet12 = graphics.newImageSheet( "Image/ActorSel/selector/haha/selector_haha12.png", ChunkandEddyData )
	local ChunkandEddysheet13 = graphics.newImageSheet( "Image/ActorSel/selector/haha/selector_haha13.png", ChunkandEddyData )
	local ChunkandEddysheet14 = graphics.newImageSheet( "Image/ActorSel/selector/haha/selector_haha14.png", ChunkandEddyData )
	local ChunkandEddySequenceData = {
                { name="ChunkandEddyseq1", sheet=ChunkandEddysheet1, start=1, count=1, time=220, loopCount=0 },
                { name="ChunkandEddyseq2", sheet=ChunkandEddysheet2, start=1, count=1, time=220, loopCount=0 },
                { name="ChunkandEddyseq3", sheet=ChunkandEddysheet3, start=1, count=1, time=220, loopCount=0 },
                { name="ChunkandEddyseq4", sheet=ChunkandEddysheet4, start=1, count=1, time=220, loopCount=0 },
                { name="ChunkandEddyseq5", sheet=ChunkandEddysheet5, start=1, count=1, time=220, loopCount=0 },
                { name="ChunkandEddyseq6", sheet=ChunkandEddysheet6, start=1, count=1, time=220, loopCount=0 },
                { name="ChunkandEddyseq7", sheet=ChunkandEddysheet7, start=1, count=1, time=220, loopCount=0 },
                { name="ChunkandEddyseq8", sheet=ChunkandEddysheet8, start=1, count=1, time=220, loopCount=0 },
                { name="ChunkandEddyseq9", sheet=ChunkandEddysheet9, start=1, count=1, time=220, loopCount=0 },
                { name="ChunkandEddyseq10", sheet=ChunkandEddysheet10, start=1, count=1, time=220, loopCount=0 },
                { name="ChunkandEddyseq11", sheet=ChunkandEddysheet11, start=1, count=1, time=220, loopCount=0 },
                { name="ChunkandEddyseq12", sheet=ChunkandEddysheet12, start=1, count=1, time=220, loopCount=0 },
                { name="ChunkandEddyseq13", sheet=ChunkandEddysheet13, start=1, count=1, time=220, loopCount=0 },
                { name="ChunkandEddyseq14", sheet=ChunkandEddysheet14, start=1, count=1, time=220, loopCount=0 },
                }
    local myAnimation3 = display.newSprite( ChunkandEddysheet1, ChunkandEddySequenceData )
    myAnimation3.id = "ChunkandEddyAnimation"
    myAnimation3.x = display.contentWidth * 0.63
    myAnimation3.y = display.contentHeight * 0.55
    sceneGroup:insert( myAnimation3 )



--Ash角色動畫
    local AshData = { width=143, height=269, numFrames=1}
	local Ashsheet1 = graphics.newImageSheet( "Image/ActorSel/selector/tall/selector_tall01.png", AshData )
	local Ashsheet2 = graphics.newImageSheet( "Image/ActorSel/selector/tall/selector_tall02.png", AshData )
	local Ashsheet3 = graphics.newImageSheet( "Image/ActorSel/selector/tall/selector_tall03.png", AshData )
	local Ashsheet4 = graphics.newImageSheet( "Image/ActorSel/selector/tall/selector_tall04.png", AshData )
	local Ashsheet5 = graphics.newImageSheet( "Image/ActorSel/selector/tall/selector_tall05.png", AshData )
	local Ashsheet6 = graphics.newImageSheet( "Image/ActorSel/selector/tall/selector_tall06.png", AshData )
	local Ashsheet7 = graphics.newImageSheet( "Image/ActorSel/selector/tall/selector_tall07.png", AshData )
	local Ashsheet8 = graphics.newImageSheet( "Image/ActorSel/selector/tall/selector_tall08.png", AshData )
	local Ashsheet9 = graphics.newImageSheet( "Image/ActorSel/selector/tall/selector_tall09.png", AshData )
	local Ashsheet10 = graphics.newImageSheet( "Image/ActorSel/selector/tall/selector_tall10.png", AshData )
	local Ashsheet11 = graphics.newImageSheet( "Image/ActorSel/selector/tall/selector_tall11.png", AshData )
	local Ashsheet12 = graphics.newImageSheet( "Image/ActorSel/selector/tall/selector_tall12.png", AshData )
	local Ashsheet13 = graphics.newImageSheet( "Image/ActorSel/selector/tall/selector_tall13.png", AshData )
	local Ashsheet14 = graphics.newImageSheet( "Image/ActorSel/selector/tall/selector_tall14.png", AshData )
	local AshSequenceData = {
                { name="Ashseq1", sheet=Ashsheet1, start=1, count=1, time=220, loopCount=0 },
                { name="Ashseq2", sheet=Ashsheet2, start=1, count=1, time=220, loopCount=0 },
                { name="Ashseq3", sheet=Ashsheet3, start=1, count=1, time=220, loopCount=0 },
                { name="Ashseq4", sheet=Ashsheet4, start=1, count=1, time=220, loopCount=0 },
                { name="Ashseq5", sheet=Ashsheet5, start=1, count=1, time=220, loopCount=0 },
                { name="Ashseq6", sheet=Ashsheet6, start=1, count=1, time=220, loopCount=0 },
                { name="Ashseq7", sheet=Ashsheet7, start=1, count=1, time=220, loopCount=0 },
                { name="Ashseq8", sheet=Ashsheet8, start=1, count=1, time=220, loopCount=0 },
                { name="Ashseq9", sheet=Ashsheet9, start=1, count=1, time=220, loopCount=0 },
                { name="Ashseq10", sheet=Ashsheet10, start=1, count=1, time=220, loopCount=0 },
                { name="Ashseq11", sheet=Ashsheet11, start=1, count=1, time=220, loopCount=0 },
                { name="Ashseq12", sheet=Ashsheet12, start=1, count=1, time=220, loopCount=0 },
                { name="Ashseq13", sheet=Ashsheet13, start=1, count=1, time=220, loopCount=0 },
                { name="Ashseq14", sheet=Ashsheet14, start=1, count=1, time=220, loopCount=0 },
                }
    local myAnimation4 = display.newSprite( Ashsheet1, AshSequenceData )
    myAnimation4.id = "AshAnimation"
    myAnimation4.x = display.contentWidth * 0.85
    myAnimation4.y = display.contentHeight * 0.42
    sceneGroup:insert( myAnimation4 )


--播放動畫
    local function DazySheet()
    	if i == 14 then
	    	i = 1
	    	myAnimation:setSequence( "Dazyseq"..i )
	    	myAnimation:play()

	    else
	    	i = i + 1
	    	myAnimation:setSequence( "Dazyseq"..i )
	    	myAnimation:play()

	    end
        
	end

	local function trickySheet()
    	if j == 14 then
	    	j = 1
	    
	    	myAnimation2:setSequence( "trickyseq"..j )
	    	myAnimation2:play()

	    	
	    else
	    	j = j + 1
	    	
	    	myAnimation2:setSequence( "trickyseq"..j )
	    	myAnimation2:play()

	    end
        
	end

	local function ChunkandEddySheet()
    	if l == 14 then
	    	l = 1
	   
	    	myAnimation3:setSequence( "ChunkandEddyseq".. l )
	    	myAnimation3:play()

	    else
	    	l = l + 1
	    	
	    	myAnimation3:setSequence( "ChunkandEddyseq"..l)
	    	myAnimation3:play()

	    end
        
	end

	local function AshSheet()
    	if m == 14 then
	    	m = 1

	    	myAnimation4:setSequence( "Ashseq"..m )
	    	myAnimation4:play()

	    else
	    	m = m + 1
	    
	    	myAnimation4:setSequence( "Ashseq"..m )
	    	myAnimation4:play()
	    end
        
	end

	local Dazytimer = timer.performWithDelay( 120, DazySheet,0 )
	local trickytimer = timer.performWithDelay( 120, trickySheet,0 )
	local ChunkandEddytimer = timer.performWithDelay( 120, ChunkandEddySheet,0 )
	local Ashtimer = timer.performWithDelay( 120, AshSheet,0 )

	sceneGroup:insert( topBar )


	function touchListener( event )
		
		if event.phase == "ended" then
			print(#chooserole)

			if(event.target.id == "DazyAnimation") then
				if(chooserole[1] == false)then
					print("Animation pause")
					ready1 = display.newImage( "Image/ActorSel/selector_ok.png" )
					ready1.x = display.contentWidth * 0.15
	    			ready1.y = display.contentHeight * 0.32
					sceneGroup:insert( ready1 )
					timer.pause( Dazytimer )
					myAnimation:pause()
					chooserole[1] = true
				elseif chooserole[1] == true then
					display.remove(ready1)
					timer.resume(Dazytimer)
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
					timer.pause( trickytimer )
					myAnimation:pause()
					chooserole[2] = true
				elseif chooserole[2] == true then
					display.remove(ready2)
					timer.resume(trickytimer)
					chooserole[2] = false
				end
			end

			if(event.target.id == "ChunkandEddyAnimation") then
				if(chooserole[3] == false)then
					print("Animation pause")
					ready3 = display.newImage( "Image/ActorSel/selector_ok.png" )
					ready3.x = display.contentWidth * 0.7
	    			ready3.y = display.contentHeight * 0.5
					sceneGroup:insert( ready3 )
					timer.pause( ChunkandEddytimer )
					myAnimation:pause()
					chooserole[3] = true
				elseif chooserole[3] == true then
					display.remove(ready3)
					timer.resume(ChunkandEddytimer)
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
					timer.pause( Ashtimer )
					myAnimation:pause()
					chooserole[4] = true
				elseif chooserole[4] == true then
					display.remove(ready4)
					timer.resume(Ashtimer)
					chooserole[4] = false
				end
			end
		end
    	
	end
	myAnimation:addEventListener( "touch", touchListener )
	myAnimation2:addEventListener( "touch", touchListener )
	myAnimation3:addEventListener( "touch", touchListener )
	myAnimation4:addEventListener( "touch", touchListener )
	sceneGroup:insert( rolenameImage )

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




