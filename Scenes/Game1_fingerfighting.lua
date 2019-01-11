--Game1_fingerfighting.lua
local widget= require("widget")
local composer = require( "composer" )
local scene = composer.newScene()
--讀取XML
local xml = require("xmlSimple").newParser()
local TWxml = xml:loadFile("LanguageXML.xml")

local i = 1

function scene:create( event )
	local sceneGroup = self.view
	

--背景圖片
	local backgrounkImage = display.newImage( "Image/Game/back_01.png" )
	backgrounkImage.x = display.contentCenterX
	backgrounkImage.y = display.contentCenterY
	sceneGroup:insert( backgrounkImage )

	--[[local BGData = { width=480, height=320, numFrames=1}
	local BGsheet1 = graphics.newImageSheet( "Image/Game/back_01.png", BGData )
	local BGsheet2 = graphics.newImageSheet( "Image/Game/back_02.png", BGData )
	local BGsheet3 = graphics.newImageSheet( "Image/Game/back_03.png", BGData )
	local BGsheet4 = graphics.newImageSheet( "Image/Game/back_04.png", BGData )
	local BGSequenceData = {
                { name="BGseq1", sheet=BGsheet1, start=1, count=1, time=220, loopCount=0 },
                { name="BGseq2", sheet=BGsheet2, start=1, count=1, time=220, loopCount=0 },
                { name="BGseq3", sheet=BGsheet3, start=1, count=1, time=220, loopCount=0 },
                { name="BGseq4", sheet=BGsheet4, start=1, count=1, time=220, loopCount=0 },
                }
    local myAnimation = display.newSprite( BGsheet1, BGSequenceData )
    myAnimation.x = display.contentWidth * 0.5
    myAnimation.y = display.contentHeight * 0.5
    sceneGroup:insert( myAnimation )

    --執行背景動畫
     local function swapSheet()
     	--print(i)
    	if i == 4 then
	    	i = 1
	    	myAnimation:setSequence( "BGseq"..i )
	    	myAnimation:play()

	    else
	    	i = i + 1
	    	myAnimation:setSequence( "BGseq"..i )
	    	myAnimation:play()

	    end
        
	end
	timer.performWithDelay( 300, swapSheet,0 )]]





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





