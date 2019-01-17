--GameResult_Scene.lua
 --ruleoptionScene.lua
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

function scene:create( event )
	sceneGroup = self.view
	--print(TWxml.XnaContent.China.Punishment[2]:value())
	--背景圖片

	for i=1,#gameresult do 
		if(gameresult[i]== true)then
			table.insert( winner, i )
		end
	end

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
		backgrounkImage = display.newImage( "Image/Rank/win_haha_little_bu_tall.png" )
	end
	backgrounkImage.x = display.contentCenterX
	backgrounkImage.y = display.contentCenterY
	sceneGroup:insert( backgrounkImage )



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




