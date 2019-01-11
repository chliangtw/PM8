 --ruleoptionScene.lua
local widget= require("widget")
local composer = require( "composer" )
local scene = composer.newScene()
--讀取XML
local xml = require("xmlSimple").newParser()
local TWxml = xml:loadFile("LanguageXML.xml")

function scene:create( event )
	local sceneGroup = self.view
	print(TWxml.XnaContent.China.Punishment[2]:value())
	--背景圖片
	local backgrounkImage = display.newImage( "Image/Punishment/punishment_back.jpg" )
	backgrounkImage.x = display.contentCenterX
	backgrounkImage.y = display.contentCenterY
	sceneGroup:insert( backgrounkImage )

--家庭類規則按鈕
	local familyruleButton =  widget.newButton(
    {
        defaultFile = "Image/Punishment/family01.png",
        onEvent = familyruleButtonEvent
    }
    )
    familyruleButton.x = display.contentWidth * 0.18
	familyruleButton.y = display.contentHeight * 0.275
	sceneGroup:insert( familyruleButton )

--夜店類規則按鈕
	local nightclubruleButton =  widget.newButton(
    {
        defaultFile = "Image/Punishment/nightclubs01.png",
        onEvent = nightclubruleButtonEvent
    }
    )
    nightclubruleButton.x = display.contentWidth * 0.505
	nightclubruleButton.y = display.contentHeight * 0.275
	sceneGroup:insert( nightclubruleButton )


--聚會類規則按鈕
	local partyruleButton =  widget.newButton(
    {
        defaultFile = "Image/Punishment/party01.png",
        onEvent = partyruleButtonEvent
    }
    )
    partyruleButton.x = display.contentWidth * 0.18
	partyruleButton.y = display.contentHeight * 0.74
	sceneGroup:insert( partyruleButton )

--排隊類規則按鈕
	local queueruleButton =  widget.newButton(
    {
        defaultFile = "Image/Punishment/queue01.png",
        onEvent = queueruleButtonEvent
    }
    )
    queueruleButton.x = display.contentWidth * 0.505
	queueruleButton.y = display.contentHeight * 0.74
	sceneGroup:insert( queueruleButton )


--家庭規則文字
	local fameilyText = display.newText( "",0 , 0, native.systemFontBold, 22 )
	fameilyText.x = display.contentWidth * 0.14
	fameilyText.y = display.contentHeight * 0.14
	fameilyText:setFillColor( 0, 0, 0 )
	fameilyText.text = TWxml.XnaContent.Taiwan.Punishment[1]:value()
	sceneGroup:insert( fameilyText )
	
--夜店規則文字
	local nightclubText = display.newText( "",0 , 0, native.systemFontBold, 22 )
	nightclubText.x = display.contentWidth * 0.47
	nightclubText.y = display.contentHeight * 0.14
	nightclubText:setFillColor( 0, 0, 0 )
	nightclubText.text = TWxml.XnaContent.Taiwan.Punishment[2]:value()
	sceneGroup:insert( nightclubText )

--聚會規則文字
	local partyclubText = display.newText( "",0 , 0, native.systemFontBold, 22 )
	partyclubText.x = display.contentWidth * 0.14
	partyclubText.y = display.contentHeight * 0.61
	partyclubText:setFillColor( 0, 0, 0 )
	partyclubText.text = TWxml.XnaContent.Taiwan.Punishment[3]:value()
	sceneGroup:insert( partyclubText )

--排隊規則文字
	local queueclubText = display.newText( "",0 , 0, native.systemFontBold, 22 )
	queueclubText.x = display.contentWidth * 0.47
	queueclubText.y = display.contentHeight * 0.61
	queueclubText:setFillColor( 0, 0, 0 )
	queueclubText.text = TWxml.XnaContent.Taiwan.Punishment[4]:value()
	sceneGroup:insert( queueclubText )

--隨機規則按鈕
	local randomruleButton =  widget.newButton(
    {
        
        label =  TWxml.XnaContent.Taiwan.Select[1]:value(),
        labelColor = { default={ 0, 0, 0 }},
        font = native.systemFontBold,
        onEvent = randomruleButtonEvent
    }
    )
    randomruleButton.x = display.contentWidth * 0.83
	randomruleButton.y = display.contentHeight * 0.49
	sceneGroup:insert( randomruleButton )


--說明規則按鈕
	local descriptionruleButton =  widget.newButton(
    {
        
        label =  TWxml.XnaContent.Taiwan.Select[2]:value(),
        labelColor = { default={ 0, 0, 0 }},
        font = native.systemFontBold,
        onEvent = descriptionruleButtonEvent
    }
    )
    descriptionruleButton.x = display.contentWidth * 0.83
	descriptionruleButton.y = display.contentHeight * 0.635
	sceneGroup:insert( descriptionruleButton )


--下一步按鈕
	local nextStepButton =  widget.newButton(
    {
        
        label =  TWxml.XnaContent.Taiwan.Select[3]:value(),
        labelColor = { default={ 0, 0, 0 }},
        font = native.systemFontBold,
        onEvent = nextStepButtonEvent
    }
    )
    nextStepButton.x = display.contentWidth * 0.83
	nextStepButton.y = display.contentHeight * 0.82
	sceneGroup:insert( nextStepButton )


--標題文字
	local titleText = display.newText( "",0 , 0, native.systemFontBold, 22 )
	titleText.x = display.contentWidth * 0.7
	titleText.y = display.contentHeight * 0.2
	sceneGroup:insert( titleText )
	if(lang == TW) then
		 
	end



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




