--GameDescription_Scene.lua
local widget= require("widget")
local composer = require( "composer" )
local scene = composer.newScene()

local xml = require("xmlSimple").newParser()
local langxml = xml:loadFile("LanguageXML.xml")
local lang = composer.getVariable( "lang" )
local rulexml

--[[if(lang == "Japan") then
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
end]]

function nextPageButtonEvent( ... )
	composer.gotoScene( "Scenes.GameDescription2_Scene", frad,400)
end

function scene:create( event )
	local sceneGroup = self.view
	
--背景圖片
	local backgrounkImage = display.newImage( "Image/HowTo/background.png" )
	backgrounkImage.x = display.contentCenterX
	backgrounkImage.y = display.contentCenterY
	sceneGroup:insert( backgrounkImage )

--Chunk&Eddy角色
	local ChunkandEddy = display.newImage( "Image/HowTo/haha.png" )
	ChunkandEddy.x = display.contentWidth * 0.15
	ChunkandEddy.y = display.contentHeight * 0.32
	ChunkandEddy.xScale = 0.67
	ChunkandEddy.yScale = 0.67
	sceneGroup:insert( ChunkandEddy )

	local arrow1 =  display.newImage( "Image/HowTo/arrow.png" )
	arrow1.x = display.contentWidth * 0.3
	arrow1.y = display.contentHeight * 0.32
	sceneGroup:insert( arrow1 )
	
	local ChunkandEddyIcon = display.newImage( "Image/Game/BallImage/haha/haha.png" )
	ChunkandEddyIcon.x = display.contentWidth * 0.43
	ChunkandEddyIcon.y = display.contentHeight * 0.42
	ChunkandEddyIcon.xScale = 0.85
	ChunkandEddyIcon.yScale = 0.85
	sceneGroup:insert( ChunkandEddyIcon )

--tricky角色
	local tricky = display.newImage( "Image/HowTo/little.png" )
	tricky.x = display.contentWidth * 0.61
	tricky.y = display.contentHeight * 0.3
	tricky.xScale = 0.67
	tricky.yScale = 0.67
	sceneGroup:insert( tricky )

	local arrow2 =  display.newImage( "Image/HowTo/arrow.png" )
	arrow2.x = display.contentWidth * 0.75
	arrow2.y = display.contentHeight * 0.35
	sceneGroup:insert( arrow2 )
	
	local trickyIcon = display.newImage( "Image/Game/BallImage/little/little.png" )
	trickyIcon.x = display.contentWidth * 0.88
	trickyIcon.y = display.contentHeight * 0.41
	trickyIcon.xScale = 0.9
	trickyIcon.yScale = 0.9
	sceneGroup:insert( trickyIcon )


--Dazy角色
	local Dazy = display.newImage( "Image/HowTo/bu.png" )
	Dazy.x = display.contentWidth * 0.17
	Dazy.y = display.contentHeight * 0.75
	Dazy.xScale = 0.67
	Dazy.yScale = 0.67
	sceneGroup:insert( Dazy )

	local arrow3 =  display.newImage( "Image/HowTo/arrow.png" )
	arrow3.x = display.contentWidth * 0.3
	arrow3.y = display.contentHeight * 0.75
	sceneGroup:insert( arrow3 )
	
	local DazyIcon = display.newImage( "Image/Game/BallImage/bubu/bubu.png" )
	DazyIcon.x = display.contentWidth * 0.43
	DazyIcon.y = display.contentHeight * 0.8
	DazyIcon.xScale = 0.9
	DazyIcon.yScale = 0.9
	sceneGroup:insert( DazyIcon )


--Ash角色
	local Ash = display.newImage( "Image/HowTo/tall.png" )
	Ash.x = display.contentWidth * 0.61
	Ash.y = display.contentHeight * 0.73
	sceneGroup:insert( Ash )

	local arrow4 =  display.newImage( "Image/HowTo/arrow.png" )
	arrow4.x = display.contentWidth * 0.75
	arrow4.y = display.contentHeight * 0.73
	sceneGroup:insert( arrow4 )
	
	local AshIcon = display.newImage( "Image/Game/BallImage/tall/tall.png" )
	AshIcon.x = display.contentWidth * 0.88
	AshIcon.y = display.contentHeight * 0.75
	AshIcon.xScale = 0.9
	AshIcon.yScale = 0.9
	sceneGroup:insert( AshIcon )

	local nextPageButton  =  widget.newButton(
    {
        
        label =  "> >",
        labelColor = { default={ 0, 0, 0 }},
        font = native.systemFontBold,
        fontSize = 28,
        onEvent = nextPageButtonEvent
    }
    )
    nextPageButton.x = display.contentWidth * 0.92
	nextPageButton.y = display.contentHeight * 0.93
	sceneGroup:insert( nextPageButton )

	local descriptionText = display.newText( "20\n20",0 , 0, native.systemFontBold, 16 )
	descriptionText.x = display.contentWidth * 0.53
	descriptionText.y = display.contentHeight * 0.1
	descriptionText:setFillColor( 0, 0, 0 )
	--descriptionText.text = TWxml.XnaContent.Taiwan.Punishment[3]:value()
	sceneGroup:insert( descriptionText )

	if(lang == "Japan") then
		descriptionText.text = langxml.XnaContent.Japan.Explain[1]:value().."\n"..langxml.XnaContent.Japan.Explain[2]:value()
	elseif lang == "Korea" then
		descriptionText.text = langxml.XnaContent.Korea.Explain[1]:value().."\n"..langxml.XnaContent.Korea.Explain[2]:value()
	elseif lang == "China" then
		descriptionText.text = langxml.XnaContent.China.Explain[1]:value().."\n"..langxml.XnaContent.China.Explain[2]:value()
	elseif lang == "Spain" then
		descriptionText.text = langxml.XnaContent.Spain.Explain[1]:value().."\n"..langxml.XnaContent.Spain.Explain[2]:value()
	elseif lang == "Taiwan" then
		descriptionText.text = langxml.XnaContent.Taiwan.Explain[1]:value().."\n"..langxml.XnaContent.Taiwan.Explain[2]:value()
	elseif lang == "America" then
		descriptionText.text = langxml.XnaContent.America.Explain[1]:value().."\n"..langxml.XnaContent.America.Explain[2]:value()
	elseif lang == "France" then
		descriptionText.text = langxml.XnaContent.France.Explain[1]:value().."\n"..langxml.XnaContent.France.Explain[2]:value()
	elseif lang == "Germany" then
		descriptionText.text = langxml.XnaContent.Germany.Explain[1]:value().."\n"..langxml.XnaContent.Germany.Explain[2]:value()
	elseif lang == "Malaysia" then
		descriptionText.text = langxml.XnaContent.Malaysia.Explain[1]:value().."\n"..langxml.XnaContent.Malaysia.Explain[2]:value()
	elseif lang == "Russia" then
		descriptionText.text = langxml.XnaContent.Russia.Explain[1]:value().."\n"..langxml.XnaContent.Russia.Explain[2]:value()
	elseif lang == "Vientnames" then
		descriptionText.text = langxml.XnaContent.Vientnames.Explain[1]:value().."\n"..langxml.XnaContent.Vientnames.Explain[2]:value()
	elseif lang == "Dutch" then
		descriptionText.text = langxml.XnaContent.Dutch.Explain[1]:value().."\n"..langxml.XnaContent.Dutch.Explain[2]:value()
	elseif lang == "Italy" then
		descriptionText.text = langxml.XnaContent.Italy.Explain[1]:value().."\n"..langxml.XnaContent.Italy.Explain[2]:value()
	end
	
end
function scene:show( event )
	local phase = event.phase

	if "did" == phase then
		composer.removeScene( "Selectrole_Scene" )
		composer.removeScene( "GameDescription2_Scene" )
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




