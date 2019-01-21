--GameResult_Scene.lua
local widget= require("widget")
local composer = require( "composer" )
local scene = composer.newScene()

local sceneGroup
--讀取XML
local xml = require("xmlSimple").newParser()
local langXML = xml:loadFile("LanguageXML.xml")
local rulexml = {}
local lang = composer.getVariable( "lang" )

local backgrounkImage 
local gameresult = composer.getVariable( "gameresult" )
local winner = {}
local nextPageButton
local btnAnimation
function nextPageEvent( event )
	
	print("press")
	local btnData = { width=386, height=320, numFrames=1}
	local btnsheet1 = graphics.newImageSheet( "Image/Rank/crack01.png", btnData )
	local btnsheet2 = graphics.newImageSheet( "Image/Rank/crack02.png", btnData )
	local btnsheet3 = graphics.newImageSheet( "Image/Rank/crack03.png", btnData )
	local btnsheet4 = graphics.newImageSheet( "Image/Rank/crack04.png", btnData )
	local btnsheet5 = graphics.newImageSheet( "Image/Rank/crack05.png", btnData )

	local  btnSequenceData = {
                { name="btnseq1", sheet=btnsheet1, start=1, count=1, time=200, loopCount=0 },
                { name="btnseq2", sheet=btnsheet2, start=1, count=1, time=200, loopCount=0 },
                { name="btnseq3", sheet=btnsheet3, start=1, count=1, time=200, loopCount=0 },
                { name="btnseq4", sheet=btnsheet4, start=1, count=1, time=200, loopCount=0 },
                { name="btnseq5", sheet=btnsheet5, start=1, count=1, time=200, loopCount=0 },
                }
    btnAnimation = display.newSprite( btnsheet1, btnSequenceData )
    btnAnimation.x = display.contentWidth * 0.5
	btnAnimation.y = display.contentHeight * 0.5
    sceneGroup:insert( btnAnimation )


	 --動畫播放   
    local function btnPlayAnimation(event)
    	local timersource = event.source
    	local count = event.count
    	display.remove(nextPageButton)
	    print( "Table listener called " .. count .. " time(s)" )
	    if count == 6 then

	        timer.cancel( timersource )
	        composer.gotoScene( "Scenes.penaltyrule_Scene", frad,400)
	        
	    else
	    	print(count)
	    	btnAnimation:setSequence( "btnseq"..count )
	    	btnAnimation:play()
	    end
    	
        
	end
	timer.performWithDelay( 80, btnPlayAnimation,0)
	


    


end

function scene:create( event )
	sceneGroup = self.view
	--print(TWxml.XnaContent.China.Punishment[2]:value())
	--背景圖片

	--[[for i=1,#gameresult do 
		if(gameresult[i]== true)then
			table.insert( winner, i )
		end
	end]]

	if(#winner == 1) then
		if(winner[1] == 1 ) then
			backgrounkImage = display.newImage( "Image/Rank/win_bu.png" )
		elseif(winner[1] == 2) then
			backgrounkImage = display.newImage( "Image/Rank/win_little.png" )
		elseif(winner[1] == 3) then
			backgrounkImage = display.newImage( "Image/Rank/win_haha.png" )
		elseif(winner[1] == 4) then
			backgrounkImage = display.newImage( "Image/Rank/win_tall.png" )
		end
	elseif(#winner == 2)then
		if(winner[1] == 1 and winner[2] == 2 ) then
			backgrounkImage = display.newImage( "Image/Rank/win_little_bu.png" )
		elseif(winner[1] == 1 and winner[2] == 3 ) then
			backgrounkImage = display.newImage( "Image/Rank/win_haha_bu.png" )
		elseif(winner[1] == 1 and winner[2] == 4 ) then
			backgrounkImage = display.newImage( "Image/Rank/win_bu_tall.png" )
		elseif(winner[1] == 2 and winner[2] == 3 ) then
			backgrounkImage = display.newImage( "Image/Rank/win_haha_little.png" )
		elseif(winner[1] == 2 and winner[2] == 4 ) then
			backgrounkImage = display.newImage( "Image/Rank/win_little_tall.png" )
		end
	elseif(#winner == 3)then
		if(winner[1] == 1 and winner[2] == 2 and winner[3] == 3 ) then
			backgrounkImage = display.newImage( "Image/Rank/win_haha_little_bu.png" )
		elseif(winner[1] == 1 and winner[2] == 2 and winner[3] == 4) then
			backgrounkImage = display.newImage( "Image/Rank/win_little_bu_tall.png" )
		elseif(winner[1] == 1 and winner[2] == 3 and winner[3] == 4 ) then
			backgrounkImage = display.newImage( "Image/Rank/win_haha_bu_tall.png" )
		elseif(winner[1] == 2 and winner[2] == 3 and winner[3] == 4 ) then
			backgrounkImage = display.newImage( "Image/Rank/win_haha_little_tall.png" )
		end
	elseif(#winner == 4)then
		if(winner[1] == 1 and winner[2] == 2 and winner[3] == 3 and winner[4] == 4 ) then
			backgrounkImage = display.newImage( "Image/Rank/win_haha_little_bu_tall.png" )
		end
	end
	backgrounkImage = display.newImage( "Image/Rank/win_haha_little_bu_tall.png" )
	backgrounkImage.x = display.contentCenterX
	backgrounkImage.y = display.contentCenterY
	sceneGroup:insert( backgrounkImage )

	nextPageButton  =  widget.newButton(
    {
        
        defaultFile = "Image/Rank/crack01.png",
        onPress = nextPageEvent
    }
    )
    nextPageButton.x = display.contentWidth * 0.5
	nextPageButton.y = display.contentHeight * 0.5
	sceneGroup:insert( nextPageButton )

end
function scene:show( event )
	local phase = event.phase
	if "will" == phase then
		
		composer.removeScene( "Game1_fingerfighting" )
		print( "1: show event, phase will" )
	end
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




