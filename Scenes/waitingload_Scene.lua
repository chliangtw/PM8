--waitingload_Scene.lua
local widget= require("widget")
local composer = require( "composer" )
local scene = composer.newScene()

local xml = require("xmlSimple").newParser()
local langxml = xml:loadFile("LanguageXML.xml")
local lang = composer.getVariable( "lang" )
local i = 1
local reciprocal = {"02","01","Go"}

function scene:create( event )
	local sceneGroup = self.view

--背景動畫	
	local BGData = { width=480, height=320, numFrames=1}
	local BGsheet1 = graphics.newImageSheet( "Image/Game/noise01.png", BGData )
	local BGsheet2 = graphics.newImageSheet( "Image/Game/noise02.png", BGData )
	local BGsheet3 = graphics.newImageSheet( "Image/Game/noise03.png", BGData )
	local BGSequenceData = {
                { name="BGseq1", sheet=BGsheet1, start=1, count=1, time=220, loopCount=0 },
                { name="BGseq2", sheet=BGsheet2, start=1, count=1, time=220, loopCount=0 },
                { name="BGseq3", sheet=BGsheet3, start=1, count=1, time=220, loopCount=0 },
                }
    local myAnimation = display.newSprite( BGsheet1, BGSequenceData )
    myAnimation.x = display.contentWidth * 0.5
    myAnimation.y = display.contentHeight * 0.5
    sceneGroup:insert( myAnimation )

    --執行背景動畫
     local function swapSheet()
     	--print(i)
    	if i == 3 then
	    	i = 1
	    	myAnimation:setSequence( "BGseq"..i )
	    	myAnimation:play()

	    else
	    	i = i + 1
	    	myAnimation:setSequence( "BGseq"..i )
	    	myAnimation:play()

	    end
        
	end
	timer.performWithDelay( 100, swapSheet,0 )

	local numberText = display.newText( "03",0 , 0, native.systemFontBold, 120 )
	numberText.x = display.contentWidth * 0.5
	numberText.y = display.contentHeight * 0.5
	numberText:setFillColor(1,1, 1 )
	sceneGroup:insert( numberText )
	function countdown(event)
		local count = event.count
    	
		numberText.text = reciprocal[count]
	end

	timer.performWithDelay( 1000, countdown,3)	
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




