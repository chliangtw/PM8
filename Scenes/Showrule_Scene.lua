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

local familyrulecount = composer.getVariable( "familyrulecount" )
local nightclubrulecount = composer.getVariable( "nightclubrulecount" )
local partyrulecount = composer.getVariable( "partyrulecount" )
local queuerulecount = composer.getVariable( "queuerulecount" )
local familyruledata = {}
local nightclubsdata = {}
local queuedata = {}
local totalrule = composer.getVariable( "totalrule" )

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
--[[
-- 將XML的文字加入陣列中
for i=1,#rulexml.Family.item do
	table.insert( familyruledata, rulexml.Family.item[i]:value() )
end

for i=1,#rulexml.Nightclubs.item do
	table.insert( nightclubsdata, rulexml.Nightclubs.item[i]:value() )
end

for i=1,#rulexml.Queue.item do
	table.insert( queuedata, rulexml.Queue.item[i]:value() )
end

-- 將選取的每一個的陣列的規則整理成一個陣列
for j=1,#familyrulecount do
	local index = familyrulecount[j]
	table.insert( totalrule, rulexml.Family.item[index]:value())
end

for j=1,#nightclubrulecount do
	local index = nightclubrulecount[j]
	table.insert( totalrule, rulexml.Nightclubs.item[index]:value())
end

for j=1,#queuerulecount do
	local index = queuerulecount[j]
	table.insert( totalrule, rulexml.Queue.item[index]:value())
end
]]
function backButtonEvent( ... )
	composer.gotoScene( "Scenes.ruleoptionScene", frad,400)
end

function startButtonEvent( ... )
	composer.gotoScene( "Scenes.Selectrole_Scene", frad,400)

	--測試懲罰規則
	--composer.gotoScene( "Scenes.penaltyrule_Scene", frad,400)
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

	for i=1,8 do 
		k = display.contentWidth * 0.02
		local NumTitle = display.newText( i..".",0 , 0, native.systemFontBold, 12 )
		NumTitle.x = display.contentWidth * 0.19 
		NumTitle.y = display.contentHeight * (0.09+i/10)
		local ruleText = display.newText( totalrule[i],0 , 0, native.systemFontBold, 12 )
		ruleText.anchorX = 0
		ruleText.x = display.contentWidth * 0.21
		ruleText.y = display.contentHeight * (0.09+i/10)
		if((i >= 2 and i <= 4) or (i >=7 and i <= 8)) then
			NumTitle.x = display.contentWidth * 0.19 + k
			NumTitle.y = display.contentHeight * (0.09+i/10)
			ruleText.x = display.contentWidth * 0.21 + k
			ruleText.y = display.contentHeight * (0.09+i/10)
		end
		if(i == 5) then
			NumTitle.x = display.contentWidth * 0.19 + (k*2)
			NumTitle.y = display.contentHeight * (0.09+i/10)
			ruleText.x = display.contentWidth * 0.21 + (k*2)
			ruleText.y = display.contentHeight * (0.09+i/10)
		end
		ruleText:setFillColor( 0, 0, 0 )
		sceneGroup:insert( ruleText )
		NumTitle:setFillColor( 0, 0, 0 )
		sceneGroup:insert( NumTitle )
	end

end
function scene:show( event )
	local phase = event.phase
	if "will" == phase then
		familyrulecount = composer.getVariable( "familyrulecount" )
		nightclubrulecount = composer.getVariable( "nightclubrulecount" )
		partyrulecount = composer.getVariable( "partyrulecount" )
		queuerulecount = composer.getVariable( "queuerulecount" )
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




