--GameSelectionScene.lua
local widget= require("widget")
local composer = require( "composer" )
local scene = composer.newScene()
local scrollView

local familyrulecount = {}
local nightclubrulecount = {}
local partyrulecount = {}
local queuerulecount = {}
local totalrule = {}

function fingerfightingButtonEvent( ... )
	composer.setVariable( "familyrulecount", familyrulecount )
	composer.setVariable( "nightclubrulecount", nightclubrulecount)
	composer.setVariable( "partyrulecount", partyrulecount )
	composer.setVariable( "queuerulecount", queuerulecount )
	composer.setVariable( "totalrule", totalrule )
	composer.gotoScene( "Scenes.ruleoptionScene", frad , 400)
end

function scene:create( event )
	local sceneGroup = self.view
	print("Width2: "..display.contentWidth)
	print("Height2: "..display.contentHeight)
	--scrollView
	scrollView = widget.newScrollView {
		width = display.contentWidth,
		height = display.contentHeight,
		hideBackground = true,
		backgroundColor =  { 0, 0, 0},
		--isBounceEnabled = false,
		horizontalScrollDisabled = false,
		verticalScrollDisabled = true,
		listener = scrollListener
	}
	scrollView.x = display.contentWidth * 0.5
	scrollView.y = display.contentHeight * 0.5
	scrollView:setScrollWidth( display.contentWidth * 2 )
	sceneGroup:insert( scrollView )

	--背景圖片
	local backgrounkImage = display.newImage( "Image/SelectGame/main_background.png" )
	backgrounkImage.x = display.contentCenterX
	backgrounkImage.y = display.contentCenterY
	scrollView:insert( backgrounkImage )

	local backgrounkImage2 = display.newImage( "Image/SelectGame/main_background1.png" )
	backgrounkImage2.x = display.contentCenterX + display.contentWidth
	backgrounkImage2.y = display.contentCenterY 
	scrollView:insert( backgrounkImage2 )

	local fingerfightingButton  = widget.newButton(
    {
        defaultFile = "Image/SelectGame/main_game1_01.png",
        onEvent = fingerfightingButtonEvent
    }
    )
    fingerfightingButton.x = display.contentWidth * 0.3
	fingerfightingButton.y = display.contentHeight * 0.55
	fingerfightingButton.xScale = 0.7
	fingerfightingButton.yScale = 0.7
	scrollView:insert( fingerfightingButton ) 


	local dyamicbomberButton = widget.newButton(
    {
        defaultFile = "Image/SelectGame/main_game2_01.png",
        onEvent = dyamicbomberButtonEvent
    }
    )
    dyamicbomberButton.x = display.contentWidth * 0.72
	dyamicbomberButton.y = display.contentHeight * 0.55
	dyamicbomberButton.xScale = 0.65
	dyamicbomberButton.yScale = 0.65
	scrollView:insert( dyamicbomberButton ) 


	local numbertrapButton  = widget.newButton(
    {
        defaultFile = "Image/SelectGame/main_game1_01.png",
        onEvent = numbertrapButtonEvent
    }
    )
    numbertrapButton.x = display.contentWidth * 1.3
	numbertrapButton.y = display.contentHeight * 0.55
	numbertrapButton.xScale = 0.7
	numbertrapButton.yScale = 0.7
	scrollView:insert( numbertrapButton ) 



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




