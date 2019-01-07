--Game1_fingerfighting.lua
local widget= require("widget")
local composer = require( "composer" )
local scene = composer.newScene()
local scrollView
local i = 1
function scene:create( event )
	local sceneGroup = self.view
	
	--背景圖片
	local backgrounkImage = display.newImage( "Image/ActorSel/selector_back.jpg" )
	backgrounkImage.x = display.contentCenterX
	backgrounkImage.y = display.contentCenterY
	sceneGroup:insert( backgrounkImage )

	local topBar = display.newImage( "Image/ActorSel/selector_curtain.png" )
	topBar.x = display.contentCenterX
	topBar.y = display.contentHeight * 0.07
	


	local startButton =  widget.newButton(
    {
        defaultFile = "Image/ActorSel/selector_cant_start.png",
        onEvent = startButtonEvent
    }
    )
    startButton.x = display.contentWidth * 0.37
	startButton.y = display.contentHeight * 0.18
	sceneGroup:insert( startButton ) 
	

---------------------------------------------------------------------------------------------------------------------

--bubu角色動畫
	local bubuData = { width=91, height=210, numFrames=1}
	local bubusheet1 = graphics.newImageSheet( "Image/ActorSel/selector/bubu/selector_bu01.png", bubuData )
	local bubusheet2 = graphics.newImageSheet( "Image/ActorSel/selector/bubu/selector_bu02.png", bubuData )
	local bubusheet3 = graphics.newImageSheet( "Image/ActorSel/selector/bubu/selector_bu03.png", bubuData )
	local bubusheet4 = graphics.newImageSheet( "Image/ActorSel/selector/bubu/selector_bu04.png", bubuData )
	local bubusheet5 = graphics.newImageSheet( "Image/ActorSel/selector/bubu/selector_bu05.png", bubuData )
	local bubusheet6 = graphics.newImageSheet( "Image/ActorSel/selector/bubu/selector_bu06.png", bubuData )
	local bubusheet7 = graphics.newImageSheet( "Image/ActorSel/selector/bubu/selector_bu07.png", bubuData )
	local bubusheet8 = graphics.newImageSheet( "Image/ActorSel/selector/bubu/selector_bu08.png", bubuData )
	local bubusheet9 = graphics.newImageSheet( "Image/ActorSel/selector/bubu/selector_bu09.png", bubuData )
	local bubusheet10 = graphics.newImageSheet( "Image/ActorSel/selector/bubu/selector_bu10.png", bubuData )
	local bubusheet11 = graphics.newImageSheet( "Image/ActorSel/selector/bubu/selector_bu11.png", bubuData )
	local bubusheet12 = graphics.newImageSheet( "Image/ActorSel/selector/bubu/selector_bu12.png", bubuData )
	local bubusheet13 = graphics.newImageSheet( "Image/ActorSel/selector/bubu/selector_bu13.png", bubuData )
	local bubusheet14 = graphics.newImageSheet( "Image/ActorSel/selector/bubu/selector_bu14.png", bubuData )
	local  bubuSequenceData = {
                { name="bubuseq1", sheet=bubusheet1, start=1, count=1, time=220, loopCount=0 },
                { name="bubuseq2", sheet=bubusheet2, start=1, count=1, time=220, loopCount=0 },
                { name="bubuseq3", sheet=bubusheet3, start=1, count=1, time=220, loopCount=0 },
                { name="bubuseq4", sheet=bubusheet4, start=1, count=1, time=220, loopCount=0 },
                { name="bubuseq5", sheet=bubusheet5, start=1, count=1, time=220, loopCount=0 },
                { name="bubuseq6", sheet=bubusheet6, start=1, count=1, time=220, loopCount=0 },
                { name="bubuseq7", sheet=bubusheet7, start=1, count=1, time=220, loopCount=0 },
                { name="bubuseq8", sheet=bubusheet8, start=1, count=1, time=220, loopCount=0 },
                { name="bubuseq9", sheet=bubusheet9, start=1, count=1, time=220, loopCount=0 },
                { name="bubuseq10", sheet=bubusheet10, start=1, count=1, time=220, loopCount=0 },
                { name="bubuseq11", sheet=bubusheet11, start=1, count=1, time=220, loopCount=0 },
                { name="bubuseq12", sheet=bubusheet12, start=1, count=1, time=220, loopCount=0 },
                { name="bubuseq13", sheet=bubusheet13, start=1, count=1, time=220, loopCount=0 },
                { name="bubuseq14", sheet=bubusheet14, start=1, count=1, time=220, loopCount=0 },
                }
    local myAnimation = display.newSprite( bubusheet1, bubuSequenceData )
    myAnimation.x = display.contentWidth * 0.14
    myAnimation.y = display.contentHeight * 0.62
    sceneGroup:insert( myAnimation )



--little角色動畫
	local littlData = { width=129, height=129, numFrames=1}
	local littlesheet1 = graphics.newImageSheet( "Image/ActorSel/selector/little/selector_little01.png", littlData )
	local littlesheet2 = graphics.newImageSheet( "Image/ActorSel/selector/little/selector_little02.png", littlData )
	local littlesheet3 = graphics.newImageSheet( "Image/ActorSel/selector/little/selector_little03.png", littlData )
	local littlesheet4 = graphics.newImageSheet( "Image/ActorSel/selector/little/selector_little04.png", littlData )
	local littlesheet5 = graphics.newImageSheet( "Image/ActorSel/selector/little/selector_little05.png", littlData )
	local littlesheet6 = graphics.newImageSheet( "Image/ActorSel/selector/little/selector_little06.png", littlData )
	local littlesheet7 = graphics.newImageSheet( "Image/ActorSel/selector/little/selector_little07.png", littlData )
	local littlesheet8 = graphics.newImageSheet( "Image/ActorSel/selector/little/selector_little08.png", littlData )
	local littlesheet9 = graphics.newImageSheet( "Image/ActorSel/selector/little/selector_little09.png", littlData )
	local littlesheet10 = graphics.newImageSheet( "Image/ActorSel/selector/little/selector_little10.png", littlData )
	local littlesheet11 = graphics.newImageSheet( "Image/ActorSel/selector/little/selector_little11.png", littlData )
	local littlesheet12 = graphics.newImageSheet( "Image/ActorSel/selector/little/selector_little12.png", littlData )
	local littlesheet13 = graphics.newImageSheet( "Image/ActorSel/selector/little/selector_little13.png", littlData )
	local littlesheet14 = graphics.newImageSheet( "Image/ActorSel/selector/little/selector_little14.png", littlData )
	local littleSequenceData = {
                { name="littleseq1", sheet=littlesheet1, start=1, count=1, time=220, loopCount=0 },
                { name="littleseq2", sheet=littlesheet2, start=1, count=1, time=220, loopCount=0 },
                { name="littleseq3", sheet=littlesheet3, start=1, count=1, time=220, loopCount=0 },
                { name="littleseq4", sheet=littlesheet4, start=1, count=1, time=220, loopCount=0 },
                { name="littleseq5", sheet=littlesheet5, start=1, count=1, time=220, loopCount=0 },
                { name="littleseq6", sheet=littlesheet6, start=1, count=1, time=220, loopCount=0 },
                { name="littleseq7", sheet=littlesheet7, start=1, count=1, time=220, loopCount=0 },
                { name="littleseq8", sheet=littlesheet8, start=1, count=1, time=220, loopCount=0 },
                { name="littleseq9", sheet=littlesheet9, start=1, count=1, time=220, loopCount=0 },
                { name="littleseq10", sheet=littlesheet10, start=1, count=1, time=220, loopCount=0 },
                { name="littleseq11", sheet=littlesheet11, start=1, count=1, time=220, loopCount=0 },
                { name="littleseq12", sheet=littlesheet12, start=1, count=1, time=220, loopCount=0 },
                { name="littleseq13", sheet=littlesheet13, start=1, count=1, time=220, loopCount=0 },
                { name="littleseq14", sheet=littlesheet14, start=1, count=1, time=220, loopCount=0 },
                }
    local myAnimation2 = display.newSprite( littlesheet1, littleSequenceData )
    myAnimation2.x = display.contentWidth * 0.38
    myAnimation2.y = display.contentHeight * 0.65
    sceneGroup:insert( myAnimation2 )



--haha角色動畫
    local hahaData = { width=123, height=185, numFrames=1}
	local hahasheet1 = graphics.newImageSheet( "Image/ActorSel/selector/haha/selector_haha01.png", hahaData )
	local hahasheet2 = graphics.newImageSheet( "Image/ActorSel/selector/haha/selector_haha02.png", hahaData )
	local hahasheet3 = graphics.newImageSheet( "Image/ActorSel/selector/haha/selector_haha03.png", hahaData )
	local hahasheet4 = graphics.newImageSheet( "Image/ActorSel/selector/haha/selector_haha04.png", hahaData )
	local hahasheet5 = graphics.newImageSheet( "Image/ActorSel/selector/haha/selector_haha05.png", hahaData )
	local hahasheet6 = graphics.newImageSheet( "Image/ActorSel/selector/haha/selector_haha06.png", hahaData )
	local hahasheet7 = graphics.newImageSheet( "Image/ActorSel/selector/haha/selector_haha07.png", hahaData )
	local hahasheet8 = graphics.newImageSheet( "Image/ActorSel/selector/haha/selector_haha08.png", hahaData )
	local hahasheet9 = graphics.newImageSheet( "Image/ActorSel/selector/haha/selector_haha09.png", hahaData )
	local hahasheet10 = graphics.newImageSheet( "Image/ActorSel/selector/haha/selector_haha10.png", hahaData )
	local hahasheet11 = graphics.newImageSheet( "Image/ActorSel/selector/haha/selector_haha11.png", hahaData )
	local hahasheet12 = graphics.newImageSheet( "Image/ActorSel/selector/haha/selector_haha12.png", hahaData )
	local hahasheet13 = graphics.newImageSheet( "Image/ActorSel/selector/haha/selector_haha13.png", hahaData )
	local hahasheet14 = graphics.newImageSheet( "Image/ActorSel/selector/haha/selector_haha14.png", hahaData )
	local hahaSequenceData = {
                { name="hahaseq1", sheet=hahasheet1, start=1, count=1, time=220, loopCount=0 },
                { name="hahaseq2", sheet=hahasheet2, start=1, count=1, time=220, loopCount=0 },
                { name="hahaseq3", sheet=hahasheet3, start=1, count=1, time=220, loopCount=0 },
                { name="hahaseq4", sheet=hahasheet4, start=1, count=1, time=220, loopCount=0 },
                { name="hahaseq5", sheet=hahasheet5, start=1, count=1, time=220, loopCount=0 },
                { name="hahaseq6", sheet=hahasheet6, start=1, count=1, time=220, loopCount=0 },
                { name="hahaseq7", sheet=hahasheet7, start=1, count=1, time=220, loopCount=0 },
                { name="hahaseq8", sheet=hahasheet8, start=1, count=1, time=220, loopCount=0 },
                { name="hahaseq9", sheet=hahasheet9, start=1, count=1, time=220, loopCount=0 },
                { name="hahaseq10", sheet=hahasheet10, start=1, count=1, time=220, loopCount=0 },
                { name="hahaseq11", sheet=hahasheet11, start=1, count=1, time=220, loopCount=0 },
                { name="hahaseq12", sheet=hahasheet12, start=1, count=1, time=220, loopCount=0 },
                { name="hahaseq13", sheet=hahasheet13, start=1, count=1, time=220, loopCount=0 },
                { name="hahaseq14", sheet=hahasheet14, start=1, count=1, time=220, loopCount=0 },
                }
    local myAnimation3 = display.newSprite( hahasheet1, hahaSequenceData )
    myAnimation3.x = display.contentWidth * 0.63
    myAnimation3.y = display.contentHeight * 0.55
    sceneGroup:insert( myAnimation3 )



--tall角色動畫
    local tallData = { width=143, height=269, numFrames=1}
	local tallsheet1 = graphics.newImageSheet( "Image/ActorSel/selector/tall/selector_tall01.png", tallData )
	local tallsheet2 = graphics.newImageSheet( "Image/ActorSel/selector/tall/selector_tall02.png", tallData )
	local tallsheet3 = graphics.newImageSheet( "Image/ActorSel/selector/tall/selector_tall03.png", tallData )
	local tallsheet4 = graphics.newImageSheet( "Image/ActorSel/selector/tall/selector_tall04.png", tallData )
	local tallsheet5 = graphics.newImageSheet( "Image/ActorSel/selector/tall/selector_tall05.png", tallData )
	local tallsheet6 = graphics.newImageSheet( "Image/ActorSel/selector/tall/selector_tall06.png", tallData )
	local tallsheet7 = graphics.newImageSheet( "Image/ActorSel/selector/tall/selector_tall07.png", tallData )
	local tallsheet8 = graphics.newImageSheet( "Image/ActorSel/selector/tall/selector_tall08.png", tallData )
	local tallsheet9 = graphics.newImageSheet( "Image/ActorSel/selector/tall/selector_tall09.png", tallData )
	local tallsheet10 = graphics.newImageSheet( "Image/ActorSel/selector/tall/selector_tall10.png", tallData )
	local tallsheet11 = graphics.newImageSheet( "Image/ActorSel/selector/tall/selector_tall11.png", tallData )
	local tallsheet12 = graphics.newImageSheet( "Image/ActorSel/selector/tall/selector_tall12.png", tallData )
	local tallsheet13 = graphics.newImageSheet( "Image/ActorSel/selector/tall/selector_tall13.png", tallData )
	local tallsheet14 = graphics.newImageSheet( "Image/ActorSel/selector/tall/selector_tall14.png", tallData )
	local tallSequenceData = {
                { name="tallseq1", sheet=tallsheet1, start=1, count=1, time=220, loopCount=0 },
                { name="tallseq2", sheet=tallsheet2, start=1, count=1, time=220, loopCount=0 },
                { name="tallseq3", sheet=tallsheet3, start=1, count=1, time=220, loopCount=0 },
                { name="tallseq4", sheet=tallsheet4, start=1, count=1, time=220, loopCount=0 },
                { name="tallseq5", sheet=tallsheet5, start=1, count=1, time=220, loopCount=0 },
                { name="tallseq6", sheet=tallsheet6, start=1, count=1, time=220, loopCount=0 },
                { name="tallseq7", sheet=tallsheet7, start=1, count=1, time=220, loopCount=0 },
                { name="tallseq8", sheet=tallsheet8, start=1, count=1, time=220, loopCount=0 },
                { name="tallseq9", sheet=tallsheet9, start=1, count=1, time=220, loopCount=0 },
                { name="tallseq10", sheet=tallsheet10, start=1, count=1, time=220, loopCount=0 },
                { name="tallseq11", sheet=tallsheet11, start=1, count=1, time=220, loopCount=0 },
                { name="tallseq12", sheet=tallsheet12, start=1, count=1, time=220, loopCount=0 },
                { name="tallseq13", sheet=tallsheet13, start=1, count=1, time=220, loopCount=0 },
                { name="tallseq14", sheet=tallsheet14, start=1, count=1, time=220, loopCount=0 },
                }
    local myAnimation4 = display.newSprite( tallsheet1, tallSequenceData )
    myAnimation4.x = display.contentWidth * 0.85
    myAnimation4.y = display.contentHeight * 0.42
    sceneGroup:insert( myAnimation4 )


--播放動畫
    local function swapSheet()
    	if i == 14 then
	    	i = 1
	    	myAnimation:setSequence( "bubuseq"..i )
	    	myAnimation:play()

	    	myAnimation2:setSequence( "littleseq"..i )
	    	myAnimation2:play()

	    	myAnimation3:setSequence( "hahaseq"..i )
	    	myAnimation3:play()

	    	myAnimation4:setSequence( "tallseq"..i )
	    	myAnimation4:play()
	    else
	    	i = i + 1
	    	myAnimation:setSequence( "bubuseq"..i )
	    	myAnimation:play()

	    	myAnimation2:setSequence( "littleseq"..i )
	    	myAnimation2:play()

	    	myAnimation3:setSequence( "hahaseq"..i )
	    	myAnimation3:play()

	    	myAnimation4:setSequence( "tallseq"..i )
	    	myAnimation4:play()
	    end
        
	end
	timer.performWithDelay( 120, swapSheet,0 )

	sceneGroup:insert( topBar )

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




