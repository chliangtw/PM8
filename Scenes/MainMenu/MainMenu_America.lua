--MainMenu_America.lua
local widget= require("widget")
local composer = require( "composer" )
local scene = composer.newScene()

function languageButtonEvent( ... )
	composer.gotoScene( "Scenes.LanguageoptionScene", frad , 400)
end

function scene:create( event )
	local sceneGroup = self.view
	
	--背景圖片
	local backgrounkImage = display.newImage( "Image/MainMenu/party_magic.jpg" )
	backgrounkImage.x = display.contentCenterX
	backgrounkImage.y = display.contentCenterY

	--版本數字圖片
	local versionImage = display.newImage( "Image/MainMenu/three3.png" )
	versionImage.x = display.contentWidth * 0.9
	versionImage.y = display.contentHeight * 0.1

	sceneGroup:insert( backgrounkImage )
	sceneGroup:insert( versionImage )

	--more按鈕
	local moreButton = widget.newButton(
    {
        width = 90,
        height = 40,
        defaultFile = "Image/MainMenu/morep.png",
        onEvent = moreButtonEvent
    }
    )
    moreButton.x = display.contentWidth * 0.15
	moreButton.y = display.contentHeight * 0.92
	sceneGroup:insert( moreButton )

	--資訊按鈕
	local infoButton = widget.newButton(
    {
        width = 35,
        height = 35,
        defaultFile = "Image/MainMenu/infomation.png",
        onEvent = infoButtonEvent
    }
    )
    infoButton.x = display.contentWidth * 0.1
	infoButton.y = display.contentHeight * 0.1
	sceneGroup:insert( infoButton )
	

	--開始按鈕
	local startButton = widget.newButton(
    {
        width = 165,
        height = 135,
        defaultFile = "Image/MainMenu/America/play02.png",
        onEvent = startButtonEvent
    }
    )
    startButton.x = display.contentWidth * 0.85
	startButton.y = display.contentHeight * 0.4
	sceneGroup:insert( startButton )

	--語言按鈕
	local languageButton = widget.newButton(
    {
        width = 230,
        height = 70,
        defaultFile = "Image/MainMenu/America/langt02.png",
        onEvent = languageButtonEvent
    }
    )
    languageButton.x = display.contentWidth * 0.75
	languageButton.y = display.contentHeight * 0.88
	sceneGroup:insert( languageButton )


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


