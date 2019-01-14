--Showrule_Scene.lua
local widget= require("widget")
local composer = require( "composer" )
local scene = composer.newScene()

local sceneGroup
--讀取XML
local xml = require("xmlSimple").newParser()
local langXML = xml:loadFile("LanguageXML.xml")
local rulexml = {}
local lang = composer.getVariable( "lang" )

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


function backButtonEvent( ... )
	composer.gotoScene( "Scenes.ruleoptionScene", frad,400)
end

function startButtonEvent( ... )
	composer.gotoScene( "Scenes.Selectrole_Scene", frad,400)
end

function scene:create( event )
	sceneGroup = self.view

	--背景圖片
	local backgrounkImage = display.newImage( "Image/AllStricky/sticker_book.jpg" )
	backgrounkImage.x = display.contentCenterX
	backgrounkImage.y = display.contentCenterY
	sceneGroup:insert( backgrounkImage )

--返回上一頁按鈕
	local backButton  =  widget.newButton(
    {
        
        label = "Back",
        labelColor = { default={ 0.8, 0, 0 }},
        font = native.systemFont,
        onEvent = backButtonEvent
    }
    )
    backButton.x = display.contentWidth * 0.1
	backButton.y = display.contentHeight * 0.3
	sceneGroup:insert( backButton )

--開始按鈕
	local startButton  =  widget.newButton(
    {
        
        label = "Start",
        labelColor = { default={ 0.8, 0, 0 }},
        font = native.systemFont,
        onEvent = startButtonEvent
    }
    )
    startButton.x = display.contentWidth * 0.935
	startButton.y = display.contentHeight * 0.63
	sceneGroup:insert( startButton )

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




