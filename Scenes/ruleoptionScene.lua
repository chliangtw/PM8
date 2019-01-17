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

local familyrulecount = composer.getVariable( "familyrulecount" )
local nightclubrulecount = composer.getVariable( "nightclubrulecount" )
local partyrulecount = composer.getVariable( "partyrulecount" )
local queuerulecount = composer.getVariable( "queuerulecount" )

local fameilyText,nightclubText,partyText,queueText
local familyruletotal,nightclubruletotal,partyruletotal,queueruletotal
local familycount,nightclubcount,partycount,queuecount

local familyruleButton,nightclubruleButton,partyruleButton,queueruleButton

local rulecount

if(lang == "Japan") then
	rulexml = xml:loadFile("JapanXML.xml")
elseif lang == "Korea" then
	rulexml = xml:loadFile("KoreaXML.xml")
elseif lang == "China" then
	rulexml = xml:loadFile("ChinaXML.xml")
elseif lang == "Spain" then
	rulexml = xml:loadFile("SpainXML.xml")
elseif lang == "Taiwan" then
	rulexml = xml:loadFile("TaiwanXML.xml")
elseif lang == "America" then
	rulexml = xml:loadFile("AmericaXML.xml")
elseif lang == "France" then
	rulexml = xml:loadFile("FranceXML.xml")
elseif lang == "Germany" then
	rulexml = xml:loadFile("GermanyXML.xml")
elseif lang == "Malaysia" then
	rulexml = xml:loadFile("MalaysiaXML.xml")
elseif lang == "Russia" then
	rulexml = xml:loadFile("RussiaXML.xml")
elseif lang == "Vientnames" then
	rulexml = xml:loadFile("VientnamesXML.xml")
elseif lang == "Dutch" then
	rulexml = xml:loadFile("DutchXML.xml")
elseif lang == "Italy" then
	rulexml = xml:loadFile("ItalyXML.xml")
end

--提示說明視窗
function descriptionruleButtonEvent( ... )
	local function onComplete( event )

	end
	  
	
	local alert = native.showAlert( "Party magic 8", langXML.XnaContent.Taiwan.Dialog.Explain:value(), { "Done" }, onComplete )
end

function familyruleButtonEvent( event )

	if event.phase == "began" then
		familyruleButton =  widget.newButton(
	    {
	        defaultFile = "Image/Punishment/family02.png",
	        onEvent   = familyruleButtonEvent
	    }
	    )
	    familyruleButton.x = display.contentWidth * 0.175
		familyruleButton.y = display.contentHeight * 0.75

		fameilyText.x = display.contentWidth * 0.11
		fameilyText.y = display.contentHeight * 0.65

		familyruletotal.x = display.contentWidth * 0.28
		familyruletotal.y = display.contentHeight * 0.84

		familycount.x = display.contentWidth * 0.245
		familycount.y = display.contentHeight * 0.82

		sceneGroup:insert( familyruleButton )
		sceneGroup:insert( fameilyText )
		sceneGroup:insert( familyruletotal )
		sceneGroup:insert( familycount )

	elseif event.phase == "ended" then
		composer.setVariable( "familyrulecount", familyrulecount )
		composer.setVariable( "nightclubrulecount", nightclubrulecount)
		composer.setVariable( "partyrulecount", partyrulecount )
		composer.setVariable( "queuerulecount", queuerulecount )
		print(familyrulecount)
		composer.gotoScene( "Scenes.familyrule_Scene", frad,400)
	end

	
end

function nightclubruleButtonEvent( event)
	if event.phase == "began" then
		nightclubruleButton =  widget.newButton(
	    {
	        defaultFile = "Image/Punishment/nightclubs02.png",
	        onEvent   = nightclubruleButtonruleButtonEvent
	    }
	    )
	    nightclubruleButton.x = display.contentWidth * 0.505
		nightclubruleButton.y = display.contentHeight * 0.275

		nightclubText.x = display.contentWidth * 0.44
		nightclubText.y = display.contentHeight * 0.165

		nightclubruletotal.x = display.contentWidth * 0.61
		nightclubruletotal.y = display.contentHeight * 0.37

		nightclubcount.x = display.contentWidth * 0.575
		nightclubcount.y = display.contentHeight * 0.345

		sceneGroup:insert( nightclubruleButton )
		sceneGroup:insert( nightclubText )
		sceneGroup:insert( nightclubruletotal )
		sceneGroup:insert( nightclubcount )

	elseif event.phase == "ended" then
		composer.setVariable( "familyrulecount", familyrulecount )
		composer.setVariable( "nightclubrulecount", nightclubrulecount)
		composer.setVariable( "partyrulecount", partyrulecount )
		composer.setVariable( "queuerulecount", queuerulecount )
		
		composer.gotoScene( "Scenes.nightclubrule_Scene", frad,400)
	end
end


function queueruleButtonEvent( event )
	if event.phase == "began" then
		queueruleButton =  widget.newButton(
	    {
	        defaultFile = "Image/Punishment/queue02.png",
	        onEvent   = nightclubruleButtonruleButtonEvent
	    }
	    )
	    queueruleButton.x = display.contentWidth * 0.505
		queueruleButton.y = display.contentHeight * 0.74

		queueclubText.x = display.contentWidth * 0.435
		queueclubText.y = display.contentHeight * 0.635

		queueruletotal.x = display.contentWidth * 0.61
		queueruletotal.y = display.contentHeight * 0.82

		queuecount.x = display.contentWidth * 0.575
		queuecount.y = display.contentHeight * 0.8

		sceneGroup:insert( queueruleButton )
		sceneGroup:insert( queueclubText )
		sceneGroup:insert( queueruletotal )
		sceneGroup:insert( queuecount )

	elseif event.phase == "ended" then
		composer.setVariable( "familyrulecount", familyrulecount )
		composer.setVariable( "nightclubrulecount", nightclubrulecount)
		composer.setVariable( "partyrulecount", partyrulecount )
		composer.setVariable( "queuerulecount", queuerulecount )
		
		composer.gotoScene( "Scenes.queuerule_Scene", frad,400)
	end
end


function nextStepButtonEvent( ... )
	
	rulecount = #familyrulecount + #nightclubrulecount + #partyrulecount + #queuerulecount
	if(rulecount == 8 ) then
		composer.gotoScene( "Scenes.Showrule_Scene", frad,400)
	end
end


function scene:create( event )
	sceneGroup = self.view
	--print(TWxml.XnaContent.China.Punishment[2]:value())
	--背景圖片
	local backgrounkImage = display.newImage( "Image/Punishment/punishment_back.jpg" )
	backgrounkImage.x = display.contentCenterX
	backgrounkImage.y = display.contentCenterY
	sceneGroup:insert( backgrounkImage )

--家庭類規則按鈕
	familyruleButton =  widget.newButton(
    {
        defaultFile = "Image/Punishment/family01.png",
        onEvent   = familyruleButtonEvent
    }
    )
    familyruleButton.x = display.contentWidth * 0.18
	familyruleButton.y = display.contentHeight * 0.74
	sceneGroup:insert( familyruleButton )

--夜店類規則按鈕
	nightclubruleButton =  widget.newButton(
    {
        defaultFile = "Image/Punishment/nightclubs01.png",
        onEvent = nightclubruleButtonEvent
    }
    )
    nightclubruleButton.x = display.contentWidth * 0.505
	nightclubruleButton.y = display.contentHeight * 0.275
	sceneGroup:insert( nightclubruleButton )


--自訂類規則按鈕

	partyruleButton =  widget.newButton(
    {
        defaultFile = "Image/Punishment/party01.png",
        onEvent = partyruleButtonEvent
    }
    )
    partyruleButton.x = display.contentWidth * 0.18
	partyruleButton.y = display.contentHeight * 0.275
	sceneGroup:insert( partyruleButton )

--排隊類規則按鈕
	queueruleButton =  widget.newButton(
    {
        defaultFile = "Image/Punishment/queue01.png",
        onEvent = queueruleButtonEvent
    }
    )
    queueruleButton.x = display.contentWidth * 0.505
	queueruleButton.y = display.contentHeight * 0.74
	sceneGroup:insert( queueruleButton )


--家庭規則文字
	fameilyText = display.newText( "",0 , 0, native.systemFontBold, 22 )
	fameilyText.x = display.contentWidth * 0.14
	fameilyText.y = display.contentHeight * 0.61
	fameilyText:setFillColor( 0, 0, 0 )
	fameilyText.text = langXML.XnaContent.Taiwan.Punishment[1]:value()
	sceneGroup:insert( fameilyText )
	
--夜店規則文字
	nightclubText = display.newText( "",0 , 0, native.systemFontBold, 22 )
	nightclubText.x = display.contentWidth * 0.47
	nightclubText.y = display.contentHeight * 0.14
	nightclubText:setFillColor( 0, 0, 0 )
	nightclubText.text = langXML.XnaContent.Taiwan.Punishment[2]:value()
	sceneGroup:insert( nightclubText )

--自訂規則文字
	partyclubText = display.newText( "",0 , 0, native.systemFontBold, 22 )
	partyclubText.x = display.contentWidth * 0.14
	partyclubText.y = display.contentHeight * 0.14
	partyclubText:setFillColor( 0, 0, 0 )
	partyclubText.text = langXML.XnaContent.Taiwan.Punishment[3]:value()
	sceneGroup:insert( partyclubText )

--排隊規則文字
	queueclubText = display.newText( "",0 , 0, native.systemFontBold, 22 )
	queueclubText.x = display.contentWidth * 0.47
	queueclubText.y = display.contentHeight * 0.61
	queueclubText:setFillColor( 0, 0, 0 )
	queueclubText.text = langXML.XnaContent.Taiwan.Punishment[4]:value()
	sceneGroup:insert( queueclubText )


--規則總數
	familyruletotal = display.newText( "",0 , 0, native.systemFont, 10.5 )
	familyruletotal.x = display.contentWidth * 0.31
	familyruletotal.y = display.contentHeight * 0.79
	familyruletotal:setFillColor( 1, 0, 0 )
	familyruletotal.text = #rulexml.Family.item
	sceneGroup:insert( familyruletotal )

	nightclubruletotal = display.newText( "",0 , 0, native.systemFont, 10.5 )
	nightclubruletotal.x = display.contentWidth * 0.635
	nightclubruletotal.y = display.contentHeight * 0.33
	nightclubruletotal:setFillColor( 1, 0, 0 )
	nightclubruletotal.text = #rulexml.Nightclubs.item
	sceneGroup:insert( nightclubruletotal )

	partyruletotal = display.newText( "",0 , 0, native.systemFont, 10.5 )
	partyruletotal.x = display.contentWidth * 0.31
	partyruletotal.y = display.contentHeight * 0.33
	partyruletotal:setFillColor( 1, 0, 0 )
	partyruletotal.text = 0
	sceneGroup:insert( partyruletotal )

	queueruletotal = display.newText( "",0 , 0, native.systemFont, 10.5 )
	queueruletotal.x = display.contentWidth * 0.635
	queueruletotal.y = display.contentHeight * 0.79
	queueruletotal:setFillColor( 1, 0, 0 )
	queueruletotal.text = #rulexml.Queue.item
	sceneGroup:insert( queueruletotal )


--規則數量
	--家庭類
	familycount = display.newText( "",0 , 0, native.systemFont, 10.5 )
	familycount.x = display.contentWidth * 0.277
	familycount.y = display.contentHeight * 0.77
	familycount:setFillColor( 1, 0, 0 )
	
	sceneGroup:insert( familycount )

	--夜店類
	nightclubcount = display.newText( "",0 , 0, native.systemFont, 10.5 )
	nightclubcount.x = display.contentWidth * 0.6
	nightclubcount.y = display.contentHeight * 0.31
	nightclubcount:setFillColor( 1, 0, 0 )
	
	sceneGroup:insert( nightclubcount )


	--自訂類
	partycount = display.newText( "",0 , 0, native.systemFont, 10.5 )
	partycount.x = display.contentWidth * 0.277
	partycount.y = display.contentHeight * 0.31
	partycount:setFillColor( 1, 0, 0 )
	
	sceneGroup:insert( partycount )

	--排隊時
	queuecount = display.newText( "",0 , 0, native.systemFont, 10.5 )
	queuecount.x = display.contentWidth * 0.6
	queuecount.y = display.contentHeight * 0.77
	queuecount:setFillColor( 1, 0, 0 )
	
	sceneGroup:insert( queuecount )



--隨機規則按鈕
	local randomruleButton =  widget.newButton(
    {
        
        label =  langXML.XnaContent.Taiwan.Select[1]:value(),
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
        
        label =  langXML.XnaContent.Taiwan.Select[2]:value(),
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
        
        label =  langXML.XnaContent.Taiwan.Select[3]:value(),
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
	if "will" == phase then
		familyrulecount = composer.getVariable( "familyrulecount" )
		nightclubrulecount = composer.getVariable( "nightclubrulecount" )
		partyrulecount = composer.getVariable( "partyrulecount" )
		queuerulecount = composer.getVariable( "queuerulecount" )
		familycount.text = #familyrulecount
		nightclubcount.text = #nightclubrulecount
		partycount.text = #partyrulecount
		queuecount.text = #queuerulecount
		composer.removeScene( "GameSelectionScene" )
		composer.removeScene( "familyrule_Scene" )
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




