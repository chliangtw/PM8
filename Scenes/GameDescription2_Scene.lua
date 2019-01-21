--GameDescription2_Scene.lua
local widget= require("widget")
local composer = require( "composer" )
local scene = composer.newScene()
local sceneGroup

local xml = require("xmlSimple").newParser()
local langxml = xml:loadFile("LanguageXML.xml")
local lang = composer.getVariable( "lang" )

local iconButton,smalliconButton

local i = 1

local pointText,point2Text = 1 , 1
local description3Text,description4Text

--上一頁
function previousPageButtonEvent( ... )
	composer.gotoScene( "Scenes.GameDescription_Scene", frad,400)
end

--創建icon(大)按鈕
function creaticonbutton( ... )
	iconButton = widget.newButton(
    {
        defaultFile = "Image/Game/BallImage/haha/haha.png",
        onEvent = iconButtonEvent
    }
    )
    iconButton.x = display.contentWidth * 0.3
	iconButton.y = display.contentHeight * 0.4
	iconButton.xScale = 0.8
	iconButton.yScale = 0.8
	sceneGroup:insert( iconButton )

end

function creatsmalliconbutton( ... )
	smalliconButton = widget.newButton(
    {
        defaultFile = "Image/Game/BallImage/haha/haha.png",
        onEvent = smalliconButtonEvent
    }
    )
    smalliconButton.x = display.contentWidth * 0.7
	smalliconButton.y = display.contentHeight * 0.43
	smalliconButton.xScale = 0.6
	smalliconButton.yScale = 0.6
	sceneGroup:insert( smalliconButton )

end


function addScoreText( ... )
	pointText = display.newText( "+50",0 , 0, native.systemFont, 20 )
	pointText.x = display.contentWidth * 0.29
	pointText.y = display.contentHeight * 0.23
	pointText:setFillColor( 0, 0, 0 )
	sceneGroup:insert( pointText )

	description3Text = display.newText( "+50",0 , 0, native.systemFontBold, 15 )
	description3Text.x = display.contentWidth * 0.3
	description3Text.y = display.contentHeight * 0.55
	description3Text:setFillColor( 0, 0, 0.98 )
	sceneGroup:insert( description3Text )
	if(lang == "Japan") then
		description3Text.text =  langxml.XnaContent.Japan.BigNote:value()
	elseif lang == "Korea" then
		description3Text.text =  langxml.XnaContent.Korea.BigNote:value()
	elseif lang == "China" then
		description3Text.text =  langxml.XnaContent.China.BigNote:value()
	elseif lang == "Spain" then
		description3Text.text =  langxml.XnaContent.Spain.BigNote:value()
	elseif lang == "Taiwan" then
		description3Text.text =  langxml.XnaContent.Taiwan.BigNote:value()
	elseif lang == "America" then
		description3Text.text =  langxml.XnaContent.America.BigNote:value()
	elseif lang == "France" then
		description3Text.text =  langxml.XnaContent.France.BigNote:value()
	elseif lang == "Germany" then
		description3Text.text =  langxml.XnaContent.Germany.BigNote:value()
	elseif lang == "Malaysia" then
		description3Text.text =  langxml.XnaContent.Malaysia.BigNote:value()
	elseif lang == "Russia" then
		description3Text.text =  langxml.XnaContent.Russia.BigNote:value()
	elseif lang == "Vientnames" then
		description3Text.text =  langxml.XnaContent.Vientnames.BigNote:value()
	elseif lang == "Dutch" then
		description3Text.text =  langxml.XnaContent.Dutch.BigNote:value()
	elseif lang == "Italy" then
		description3Text.text =  langxml.XnaContent.Italy.BigNote:value()
	end

end

function startButtonEvent( ... )
	composer.gotoScene( "Scenes.waitingload_Scene", frad,400)
end

function addScore2Text( ... )
	point2Text = display.newText( "+100",0 , 0, native.systemFont, 20 )
	point2Text.x = display.contentWidth * 0.7
	point2Text.y = display.contentHeight * 0.28
	point2Text:setFillColor( 0, 0, 0 )
	sceneGroup:insert( point2Text )

	description4Text = display.newText( "+50",0 , 0, native.systemFontBold, 15 )
	description4Text.x = display.contentWidth * 0.75
	description4Text.y = display.contentHeight * 0.58
	description4Text:setFillColor( 0, 0, 0.98 )
	sceneGroup:insert( description4Text )

	if(lang == "Japan") then
		description4Text.text =  langxml.XnaContent.Japan.SmallNote[1]:value().."\n"..langxml.XnaContent.Japan.SmallNote[2]:value()
	elseif lang == "Korea" then
		description4Text.text =  langxml.XnaContent.Korea.SmallNote[1]:value().."\n"..langxml.XnaContent.Korea.SmallNote[2]:value().."\n"..langxml.XnaContent.Korea.SmallNote[3]:value()
	elseif lang == "China" then
		description4Text.text =  langxml.XnaContent.China.SmallNote[1]:value().."\n"..langxml.XnaContent.China.SmallNote[2]:value()
	elseif lang == "Spain" then
		description4Text.text =  langxml.XnaContent.Spain.SmallNote[1]:value().."\n"..langxml.XnaContent.Spain.SmallNote[2]:value().."\n"..langxml.XnaContent.Spain.SmallNote[3]:value().."\n"..langxml.XnaContent.Spain.SmallNote[4]:value()
	elseif lang == "Taiwan" then
		description4Text.text =  langxml.XnaContent.Taiwan.SmallNote[1]:value().."\n"..langxml.XnaContent.Taiwan.SmallNote[2]:value()
	elseif lang == "America" then
		description4Text.text =  langxml.XnaContent.America.SmallNote[1]:value().."\n"..langxml.XnaContent.America.SmallNote[2]:value().."\n"..langxml.XnaContent.America.SmallNote[3]:value().."\n"..langxml.XnaContent.America.SmallNote[4]:value()
	elseif lang == "France" then
		description4Text.text =  langxml.XnaContent.France.SmallNote[1]:value().."\n"..langxml.XnaContent.France.SmallNote[2]:value().."\n"..langxml.XnaContent.France.SmallNote[3]:value().."\n"..langxml.XnaContent.France.SmallNote[4]:value()
	elseif lang == "Germany" then
		description4Text.text =  langxml.XnaContent.Germany.SmallNote[1]:value().."\n"..langxml.XnaContent.Germany.SmallNote[2]:value().."\n"..langxml.XnaContent.Germany.SmallNote[3]:value().."\n"..langxml.XnaContent.Germany.SmallNote[4]:value()
	elseif lang == "Malaysia" then
		description4Text.text =  langxml.XnaContent.Malaysia.SmallNote[1]:value().."\n"..langxml.XnaContent.Malaysia.SmallNote[2]:value().."\n"..langxml.XnaContent.Malaysia.SmallNote[3]:value().."\n"..langxml.XnaContent.Malaysia.SmallNote[4]:value()
	elseif lang == "Russia" then
		description4Text.text =  langxml.XnaContent.Russia.SmallNote[1]:value().."\n"..langxml.XnaContent.Russia.SmallNote[2]:value().."\n"..langxml.XnaContent.Russia.SmallNote[3]:value().."\n"..langxml.XnaContent.Russia.SmallNote[4]:value()
	elseif lang == "Vientnames" then
		description4Text.text =  langxml.XnaContent.Vientnames.SmallNote[1]:value().."\n"..langxml.XnaContent.Vientnames.SmallNote[2]:value().."\n"..langxml.XnaContent.Vientnames.SmallNote[3]:value().."\n"..langxml.XnaContent.Vientnames.SmallNote[4]:value()
	elseif lang == "Dutch" then
		description4Text.text =  langxml.XnaContent.Dutch.SmallNote[1]:value().."\n"..langxml.XnaContent.Dutch.SmallNote[2]:value().."\n"..langxml.XnaContent.Dutch.SmallNote[3]:value().."\n"..langxml.XnaContent.Dutch.SmallNote[4]:value()
	elseif lang == "Italy" then
		description4Text.text =  langxml.XnaContent.Italy.SmallNote[1]:value().."\n"..langxml.XnaContent.Italy.SmallNote[2]:value().."\n"..langxml.XnaContent.Italy.SmallNote[3]:value()
	end

end


function iconButtonEvent( ... )
	local iconData = { width=153, height=150, numFrames=1}
	local iconsheet1 = graphics.newImageSheet( "Image/Game/BallImage/haha/haha_01.png", iconData )
	local iconsheet2 = graphics.newImageSheet( "Image/Game/BallImage/haha/haha_02.png", iconData )
	local iconsheet3 = graphics.newImageSheet( "Image/Game/BallImage/haha/haha_03.png", iconData )

	local  iconSequenceData = {
                { name="iconseq1", sheet=iconsheet1, start=1, count=1, time=1000, loopCount=0 },
                { name="iconseq2", sheet=iconsheet2, start=1, count=1, time=1000, loopCount=0 },
                { name="iconseq3", sheet=iconsheet3, start=1, count=1, time=1000, loopCount=0 },
                }
    local myAnimation = display.newSprite( iconsheet1, iconSequenceData )
    myAnimation.x = display.contentWidth * 0.3
    myAnimation.y = display.contentHeight * 0.4
    sceneGroup:insert( myAnimation )
    
  	if pointText == 1 then
  		addScoreText()
  	end


    --動畫播放   
    local function iconAnimation(event)
    	display.remove(iconButton)
    	local count = event.count
	    print( "Table listener called " .. count .. " time(s)" )
	    if count == 4 then

	        timer.cancel( event.source )
	        display.remove(myAnimation)
	        creaticonbutton()
	    else
	    	myAnimation:setSequence( "iconseq"..count )
	    	myAnimation:play()
	    end
    	
        
	end
	timer.performWithDelay( 80, iconAnimation,0)

end


function smalliconButtonEvent( ... )
	local iconData = { width=153, height=150, numFrames=1}
	local iconsheet1 = graphics.newImageSheet( "Image/Game/BallImage/haha/haha_01.png", iconData )
	local iconsheet2 = graphics.newImageSheet( "Image/Game/BallImage/haha/haha_02.png", iconData )
	local iconsheet3 = graphics.newImageSheet( "Image/Game/BallImage/haha/haha_03.png", iconData )

	local  iconSequenceData = {
                { name="iconseq1", sheet=iconsheet1, start=1, count=1, time=1000, loopCount=0 },
                { name="iconseq2", sheet=iconsheet2, start=1, count=1, time=1000, loopCount=0 },
                { name="iconseq3", sheet=iconsheet3, start=1, count=1, time=1000, loopCount=0 },
                }
     local myAnimation = display.newSprite( iconsheet1, iconSequenceData )
    myAnimation.x = display.contentWidth * 0.7
    myAnimation.y = display.contentHeight * 0.43
    sceneGroup:insert( myAnimation )
    myAnimation.xScale = 0.6
	myAnimation.yScale = 0.6

	if point2Text == 1 then
  		addScore2Text()
  	end

    --動畫播放   
    local function iconAnimation(event)
    	display.remove(smalliconButton)
    	local count = event.count
	    print( "Table listener called " .. count .. " time(s)" )
	    if count == 4 then

	        timer.cancel( event.source )
	        display.remove(myAnimation)
	        creatsmalliconbutton() 
	    else
	    	myAnimation:setSequence( "iconseq"..count )
	    	myAnimation:play()
	    end
    	
        
	end
	timer.performWithDelay( 80, iconAnimation,0)
    
end

function scene:create( event )
	sceneGroup = self.view
	
--背景圖片
	local backgrounkImage = display.newImage( "Image/HowTo/background.png" )
	backgrounkImage.x = display.contentCenterX
	backgrounkImage.y = display.contentCenterY
	sceneGroup:insert( backgrounkImage )

--上一頁按鈕
	local previousPageButton  =  widget.newButton(
    {
        
        label =  "< <",
        labelColor = { default={ 0, 0, 0 }},
        font = native.systemFontBold,
        fontSize = 28,
        onEvent = previousPageButtonEvent
    }
    )
    previousPageButton.x = display.contentWidth * 0.1
	previousPageButton.y = display.contentHeight * 0.85
	sceneGroup:insert( previousPageButton )

--開始按鈕
	local  startButton =  widget.newButton(
    {
        
        label =  "start",
        labelColor = { default={ 0, 0, 0 }},
        font = native.systemFontBold,
        fontSize = 24,
        onEvent = startButtonEvent
    }
    )
    startButton.x = display.contentWidth * 0.9
	startButton.y = display.contentHeight * 0.85
	sceneGroup:insert( startButton )

--iCon Button
	iconButton = widget.newButton(
    {
        defaultFile = "Image/Game/BallImage/haha/haha.png",
        onEvent = iconButtonEvent
    }
    )
    iconButton.x = display.contentWidth * 0.3
	iconButton.y = display.contentHeight * 0.4
	iconButton.xScale = 0.8
	iconButton.yScale = 0.8
	sceneGroup:insert( iconButton )

--smallicon Button
	smalliconButton = widget.newButton(
    {
        defaultFile = "Image/Game/BallImage/haha/haha.png",
        onEvent = smalliconButtonEvent
    }
    )
    smalliconButton.x = display.contentWidth * 0.7
	smalliconButton.y = display.contentHeight * 0.43
	smalliconButton.xScale = 0.6
	smalliconButton.yScale = 0.6
	sceneGroup:insert( smalliconButton )


--文字說明1
	local descriptionText = display.newText( "20\n20",0 , 0, native.systemFontBold, 16 )
	descriptionText.x = display.contentWidth * 0.5
	descriptionText.y = display.contentHeight * 0.08
	descriptionText:setFillColor( 0, 0.55, 0 )
	--descriptionText.text = TWxml.XnaContent.Taiwan.Punishment[3]:value()
	sceneGroup:insert( descriptionText )

--文字說明2
	local description2Text = display.newText( "20\n20",0 , 0, native.systemFontBold, 16 )
	description2Text.x = display.contentWidth * 0.5
	description2Text.y = display.contentHeight * 0.84
	description2Text:setFillColor( 0.88, 0, 0 )
	--descriptionText.text = TWxml.XnaContent.Taiwan.Punishment[3]:value()
	sceneGroup:insert( description2Text )

--各國語言顯示
	if(lang == "Japan") then
		descriptionText.text = langxml.XnaContent.Japan.TestPlay:value()
		description2Text.text = langxml.XnaContent.Japan.GetNote[1]:value().."\n"..langxml.XnaContent.Japan.GetNote[2]:value()
		startButton:setLabel(langxml.XnaContent.Japan.Start:value())
	elseif lang == "Korea" then
		descriptionText.text = langxml.XnaContent.Korea.TestPlay:value()
		description2Text.text = langxml.XnaContent.Korea.GetNote[1]:value().."\n"..langxml.XnaContent.Korea.GetNote[2]:value()
		startButton:setLabel(langxml.XnaContent.Korea.Start:value())
	elseif lang == "China" then
		descriptionText.text = langxml.XnaContent.China.TestPlay:value()
		description2Text.text = langxml.XnaContent.China.GetNote[1]:value().."\n"..langxml.XnaContent.China.GetNote[2]:value().."\n"..langxml.XnaContent.China.GetNote[3]:value()
		startButton:setLabel(langxml.XnaContent.China.Start:value())
	elseif lang == "Spain" then
		descriptionText.text = langxml.XnaContent.Spain.TestPlay:value()
		description2Text.text = langxml.XnaContent.Spain.GetNote[1]:value().."\n"..langxml.XnaContent.Spain.GetNote[2]:value()
		startButton:setLabel(langxml.XnaContent.Spain.Start:value())
	elseif lang == "Taiwan" then
		descriptionText.text = langxml.XnaContent.Taiwan.TestPlay:value()
		description2Text.text = langxml.XnaContent.Taiwan.GetNote[1]:value().."\n"..langxml.XnaContent.Taiwan.GetNote[2]:value().."\n"..langxml.XnaContent.Taiwan.GetNote[3]:value()
		startButton:setLabel(langxml.XnaContent.Taiwan.Start:value())
	elseif lang == "America" then
		descriptionText.text = langxml.XnaContent.America.TestPlay:value()
		description2Text.text = langxml.XnaContent.America.GetNote[1]:value().."\n"..langxml.XnaContent.America.GetNote[2]:value()
		startButton:setLabel(langxml.XnaContent.America.Start:value())
	elseif lang == "France" then
		descriptionText.text = langxml.XnaContent.France.TestPlay:value()
		description2Text.text = langxml.XnaContent.France.GetNote[1]:value().."\n"..langxml.XnaContent.France.GetNote[2]:value().."\n"..langxml.XnaContent.France.GetNote[3]:value()
		startButton:setLabel(langxml.XnaContent.France.Start:value())
	elseif lang == "Germany" then
		descriptionText.text = langxml.XnaContent.Germany.TestPlay:value()
		description2Text.text = langxml.XnaContent.Germany.GetNote[1]:value().."\n"..langxml.XnaContent.Germany.GetNote[2]:value().."\n"..langxml.XnaContent.Germany.GetNote[3]:value()
		startButton:setLabel(langxml.XnaContent.Germany.Start:value())
	elseif lang == "Malaysia" then
		descriptionText.text = langxml.XnaContent.Malaysia.TestPlay:value()
		description2Text.text = langxml.XnaContent.Malaysia.GetNote[1]:value().."\n"..langxml.XnaContent.Malaysia.GetNote[2]:value().."\n"..langxml.XnaContent.Malaysia.GetNote[3]:value()
		startButton:setLabel(langxml.XnaContent.Malaysia.Start:value())
	elseif lang == "Russia" then
		descriptionText.text = langxml.XnaContent.Russia.TestPlay:value()
		description2Text.text = langxml.XnaContent.Russia.GetNote[1]:value().."\n"..langxml.XnaContent.Russia.GetNote[2]:value().."\n"..langxml.XnaContent.Russia.GetNote[3]:value()
		startButton:setLabel(langxml.XnaContent.Russia.Start:value())
	elseif lang == "Vientnames" then
		descriptionText.text = langxml.XnaContent.Vientnames.TestPlay:value()
		description2Text.text = langxml.XnaContent.Vientnames.GetNote[1]:value().."\n"..langxml.XnaContent.Vientnames.GetNote[2]:value()
		startButton:setLabel(langxml.XnaContent.Vientnames.Start:value())
	elseif lang == "Dutch" then
		descriptionText.text = langxml.XnaContent.Dutch.TestPlay:value()
		description2Text.text = langxml.XnaContent.Dutch.GetNote[1]:value().."\n"..langxml.XnaContent.Dutch.GetNote[2]:value()
		startButton:setLabel(langxml.XnaContent.Dutch.Start:value())
	elseif lang == "Italy" then
		descriptionText.text = langxml.XnaContent.Italy.TestPlay:value()
		description2Text.text = langxml.XnaContent.Italy.GetNote[1]:value().."\n"..langxml.XnaContent.Italy.GetNote[2]:value()
		startButton:setLabel(langxml.XnaContent.Italy.Start:value())
	end
	
end
function scene:show( event )
	local phase = event.phase

	if "did" == phase then
		composer.removeScene( "GameDescription_Scene" )
		print( "1: show event, phase did" )
	end	
end

function scene:hide( event )
	local phase = event.phase
	if "will" == phase then
		print( "1: hide event, phase will" )
	elseif "did" == phase then
		--display.remove(pointText)
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




