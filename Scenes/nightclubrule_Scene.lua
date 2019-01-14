--nightclubrule_Scene.lua
local widget= require("widget")
local composer = require( "composer" )
local scene = composer.newScene()

local xml = require("xmlSimple").newParser()
local langxml = xml:loadFile("LanguageXML.xml")
local rulexml = {}
local lang = composer.getVariable( "lang" )
local nightclubrulecount = composer.getVariable( "nightclubrulecount" )
local nightclubruledata = {}

local rulenotexist = false

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

for i=1,#rulexml.Nightclubs.item do
	table.insert( nightclubruledata, rulexml.Nightclubs.item[i]:value() )
end


--按鈕
local randomruleButton,nextstepruleButton,allcleanButton

--TableView
local tableView

local function textListener( event )
 
    if ( event.phase == "began" ) then
        -- User begins editing "defaultField"
 
    elseif ( event.phase == "ended" or event.phase == "submitted" ) then
        -- Output resulting text from "defaultField"
        print( event.target.text )
 
    elseif ( event.phase == "editing" ) then
        print( event.newCharacters )
        print( event.oldText )
        print( event.startPosition )
        print( event.text )
    end
end

function scene:create( event )
	local sceneGroup = self.view

--背景圖片	
	local backgrounkImage = display.newImage( "Image/Family/item_back.jpg" )
	backgrounkImage.x = display.contentCenterX
	backgrounkImage.y = display.contentCenterY
	sceneGroup:insert( backgrounkImage )

--類別標題背景
	local categorytitle = display.newImage( "Image/Nightclubs/nightclubs_item.png" )
	categorytitle.x = display.contentWidth * 0.6
	categorytitle.y = display.contentHeight * 0.08
	sceneGroup:insert( categorytitle )

--類別標題文字

	local categorytitleText = display.newText( "",0 , 0, native.systemFontBold, 24 )
	categorytitleText.x = display.contentWidth * 0.33
	categorytitleText.y = display.contentHeight * 0.08
	categorytitleText:setFillColor( 0, 0, 0 )
	sceneGroup:insert( categorytitleText )

--增加輸入框
	local definitionField = native.newTextField( display.contentWidth * 0.6, display.contentHeight * 0.275, display.contentWidth * 0.73, display.contentHeight * 0.15 )
	definitionField.align = "center"
	definitionField.placeholder = "Add new item"
	definitionField.hasBackground = false
	sceneGroup:insert( definitionField )
	definitionField:addEventListener( "userInput", textListener )

	local blockbg = display.newImage( "Image/Family/stickers_back.png" )
	blockbg.x = display.contentWidth * 0.6
	blockbg.y = display.contentHeight * 0.275
	sceneGroup:insert( blockbg )

--規則類型(輕度)
	local MildRuleIcon =  display.newImage( "Image/Arrow/green.png" )
	MildRuleIcon.x = display.contentWidth * 0.065
	MildRuleIcon.y = display.contentHeight * 0.1
	sceneGroup:insert( MildRuleIcon )

	local MildRuleText = display.newText( "",0 , 0, native.systemFontBold, 14 )
	MildRuleText.x = display.contentWidth * 0.16
	MildRuleText.y = display.contentHeight * 0.1
	MildRuleText:setFillColor( 0, 0, 0 )
	sceneGroup:insert( MildRuleText )

--規則類型(中度)
	local ModerateRuleIcon =  display.newImage( "Image/Arrow/blue.png" )
	ModerateRuleIcon.x = display.contentWidth * 0.065
	ModerateRuleIcon.y = display.contentHeight * 0.22
	sceneGroup:insert( ModerateRuleIcon )

	local ModerateRuleText = display.newText( "",0 , 0, native.systemFontBold, 14 )
	ModerateRuleText.x = display.contentWidth * 0.16
	ModerateRuleText.y = display.contentHeight * 0.22
	ModerateRuleText:setFillColor( 0, 0, 0 )
	sceneGroup:insert( ModerateRuleText )


--規則類型(重度)
	local SevereRuleIcon =  display.newImage( "Image/Arrow/red.png" )
	SevereRuleIcon.x = display.contentWidth * 0.065
	SevereRuleIcon.y = display.contentHeight * 0.34
	sceneGroup:insert( SevereRuleIcon )

	local SevereRuleText = display.newText( "",0 , 0, native.systemFontBold, 14 )
	SevereRuleText.x = display.contentWidth * 0.16
	SevereRuleText.y = display.contentHeight * 0.34
	SevereRuleText:setFillColor( 0, 0, 0 )
	sceneGroup:insert( SevereRuleText )



	if(lang == "Japan") then
		categorytitleText.text = langxml.XnaContent.Japan.Punishment[2]:value()
		MildRuleText.text = langxml.XnaContent.Japan.Grade[1]:value()
		ModerateRuleText.text = langxml.XnaContent.Japan.Grade[2]:value()
		SevereRuleText.text = langxml.XnaContent.Japan.Grade[3]:value()
		randomruleButton = widget.newButton(
	    {
	        defaultFile = "Image/Family/random0101.png",
	        onEvent = randomruleButtonEvent
	    }
	    )
	    randomruleButton.x = display.contentWidth * 0.12
		randomruleButton.y = display.contentHeight * 0.6
		sceneGroup:insert( randomruleButton )

		--下一步按鈕
		nextstepruleButton = widget.newButton(
	    {
	        defaultFile = "Image/Family/coutinue0101.png",
	        onEvent = nextstepruleButtonEvent
	    }
	    )
	    nextstepruleButton.x = display.contentWidth * 0.1
		nextstepruleButton.y = display.contentHeight * 0.755
		sceneGroup:insert( nextstepruleButton )

	elseif lang == "Korea" then
		categorytitleText.text = langxml.XnaContent.Korea.Punishment[2]:value()
		MildRuleText.text = langxml.XnaContent.Korea.Grade[1]:value()
		ModerateRuleText.text = langxml.XnaContent.Korea.Grade[2]:value()
		SevereRuleText.text = langxml.XnaContent.Korea.Grade[3]:value()
		randomruleButton = widget.newButton(
	    {
	        defaultFile = "Image/Family/random0201.png",
	        onEvent = randomruleButtonEvent
	    }
	    )
	    randomruleButton.x = display.contentWidth * 0.12
		randomruleButton.y = display.contentHeight * 0.6
		sceneGroup:insert( randomruleButton )

		--下一步按鈕
		nextstepruleButton = widget.newButton(
	    {
	        defaultFile = "Image/Family/coutinue0201.png",
	        onEvent = nextstepruleButtonEvent
	    }
	    )
	    nextstepruleButton.x = display.contentWidth * 0.1
		nextstepruleButton.y = display.contentHeight * 0.755
		sceneGroup:insert( nextstepruleButton )
	elseif lang == "China" then
		categorytitleText.text = langxml.XnaContent.China.Punishment[2]:value()
		MildRuleText.text = langxml.XnaContent.China.Grade[1]:value()
		ModerateRuleText.text = langxml.XnaContent.China.Grade[2]:value()
		SevereRuleText.text = langxml.XnaContent.China.Grade[3]:value()
		randomruleButton = widget.newButton(
	    {
	        defaultFile = "Image/Family/random0301.png",
	        onEvent = randomruleButtonEvent
	    }
	    )
	    randomruleButton.x = display.contentWidth * 0.12
		randomruleButton.y = display.contentHeight * 0.6
		sceneGroup:insert( randomruleButton )

		--下一步按鈕
		nextstepruleButton = widget.newButton(
	    {
	        defaultFile = "Image/Family/coutinue0301.png",
	        onEvent = nextstepruleButtonEvent
	    }
	    )
	    nextstepruleButton.x = display.contentWidth * 0.1
		nextstepruleButton.y = display.contentHeight * 0.755
		sceneGroup:insert( nextstepruleButton )
	elseif lang == "Spain" then
		
		categorytitleText.text = langxml.XnaContent.Spain.Punishment[2]:value()
		MildRuleText.text = langxml.XnaContent.Spain.Grade[1]:value()
		ModerateRuleText.text = langxml.XnaContent.Spain.Grade[2]:value()
		SevereRuleText.text = langxml.XnaContent.Spain.Grade[3]:value()
		randomruleButton = widget.newButton(
	    {
	        defaultFile = "Image/Family/random0401.png",
	        onEvent = randomruleButtonEvent
	    }
	    )
	    randomruleButton.x = display.contentWidth * 0.12
		randomruleButton.y = display.contentHeight * 0.6
		sceneGroup:insert( randomruleButton )

		--下一步按鈕
		nextstepruleButton = widget.newButton(
	    {
	        defaultFile = "Image/Family/coutinue0401.png",
	        onEvent = nextstepruleButtonEvent
	    }
	    )
	    nextstepruleButton.x = display.contentWidth * 0.1
		nextstepruleButton.y = display.contentHeight * 0.755
		sceneGroup:insert( nextstepruleButton )
	elseif lang == "Taiwan" then
		categorytitleText.text = langxml.XnaContent.Taiwan.Punishment[2]:value()
		MildRuleText.text = langxml.XnaContent.Taiwan.Grade[1]:value()
		ModerateRuleText.text = langxml.XnaContent.Taiwan.Grade[2]:value()
		SevereRuleText.text = langxml.XnaContent.Taiwan.Grade[3]:value()

		--隨機按鈕
		randomruleButton = widget.newButton(
	    {
	        defaultFile = "Image/Family/random0501.png",
	        onEvent = randomruleButtonEvent
	    }
	    )
	    randomruleButton.x = display.contentWidth * 0.12
		randomruleButton.y = display.contentHeight * 0.6
		sceneGroup:insert( randomruleButton )

		--下一步按鈕
		nextstepruleButton = widget.newButton(
	    {
	        defaultFile = "Image/Family/coutinue0501.png",
	        onEvent = nextstepruleButtonEvent
	    }
	    )
	    nextstepruleButton.x = display.contentWidth * 0.1
		nextstepruleButton.y = display.contentHeight * 0.755
		sceneGroup:insert( nextstepruleButton )


		--全部清除按鈕
		allcleanButton = widget.newButton(
	    {
	        defaultFile = "Image/Family/clean0501.png",
	        onEvent = allcleanButtonEvent
	    }
	    )
	    allcleanButton.x = display.contentWidth * 0.12
		allcleanButton.y = display.contentHeight * 0.89
		sceneGroup:insert( allcleanButton )
	elseif lang == "America" then
		categorytitleText.text = langxml.XnaContent.America.Punishment[2]:value()
		MildRuleText.text = langxml.XnaContent.America.Grade[1]:value()
		ModerateRuleText.text = langxml.XnaContent.America.Grade[2]:value()
		SevereRuleText.text = langxml.XnaContent.America.Grade[3]:value()
		randomruleButton = widget.newButton(
	    {
	        defaultFile = "Image/Family/random0601.png",
	        onEvent = randomruleButtonEvent
	    }
	    )
	    randomruleButton.x = display.contentWidth * 0.12
		randomruleButton.y = display.contentHeight * 0.6
		sceneGroup:insert( randomruleButton )

		--下一步按鈕
		nextstepruleButton = widget.newButton(
	    {
	        defaultFile = "Image/Family/coutinue0601.png",
	        onEvent = nextstepruleButtonEvent
	    }
	    )
	    nextstepruleButton.x = display.contentWidth * 0.1
		nextstepruleButton.y = display.contentHeight * 0.755
		sceneGroup:insert( nextstepruleButton )
	elseif lang == "France" then
		categorytitleText.text = langxml.XnaContent.France.Punishment[2]:value()
		MildRuleText.text = langxml.XnaContent.France.Grade[1]:value()
		ModerateRuleText.text = langxml.XnaContent.France.Grade[2]:value()
		SevereRuleText.text = langxml.XnaContent.France.Grade[3]:value()
		randomruleButton = widget.newButton(
	    {
	        defaultFile = "Image/Family/random0701.png",
	        onEvent = randomruleButtonEvent
	    }
	    )
	    randomruleButton.x = display.contentWidth * 0.12
		randomruleButton.y = display.contentHeight * 0.6
		sceneGroup:insert( randomruleButton )

		--下一步按鈕
		nextstepruleButton = widget.newButton(
	    {
	        defaultFile = "Image/Family/coutinue0701.png",
	        onEvent = nextstepruleButtonEvent
	    }
	    )
	    nextstepruleButton.x = display.contentWidth * 0.1
		nextstepruleButton.y = display.contentHeight * 0.755
		sceneGroup:insert( nextstepruleButton )
	elseif lang == "Germany" then
		categorytitleText.text = langxml.XnaContent.Germany.Punishment[2]:value()
		MildRuleText.text = langxml.XnaContent.Germany.Grade[1]:value()
		ModerateRuleText.text = langxml.XnaContent.Germany.Grade[2]:value()
		SevereRuleText.text = langxml.XnaContent.Germany.Grade[3]:value()
		randomruleButton = widget.newButton(
	    {
	        defaultFile = "Image/Family/random0801.png",
	        onEvent = randomruleButtonEvent
	    }
	    )
	    randomruleButton.x = display.contentWidth * 0.12
		randomruleButton.y = display.contentHeight * 0.6
		sceneGroup:insert( randomruleButton )

		--下一步按鈕
		nextstepruleButton = widget.newButton(
	    {
	        defaultFile = "Image/Family/coutinue0801.png",
	        onEvent = nextstepruleButtonEvent
	    }
	    )
	    nextstepruleButton.x = display.contentWidth * 0.1
		nextstepruleButton.y = display.contentHeight * 0.755
		sceneGroup:insert( nextstepruleButton )
	elseif lang == "Malaysia" then
		categorytitleText.text = langxml.XnaContent.Malaysia.Punishment[2]:value()
		MildRuleText.text = langxml.XnaContent.Malaysia.Grade[1]:value()
		ModerateRuleText.text = langxml.XnaContent.Malaysia.Grade[2]:value()
		SevereRuleText.text = langxml.XnaContent.Malaysia.Grade[3]:value()
		randomruleButton = widget.newButton(
	    {
	        defaultFile = "Image/Family/random0901.png",
	        onEvent = randomruleButtonEvent
	    }
	    )
	    randomruleButton.x = display.contentWidth * 0.12
		randomruleButton.y = display.contentHeight * 0.6
		sceneGroup:insert( randomruleButton )

		--下一步按鈕
		nextstepruleButton = widget.newButton(
	    {
	        defaultFile = "Image/Family/coutinue0901.png",
	        onEvent = nextstepruleButtonEvent
	    }
	    )
	    nextstepruleButton.x = display.contentWidth * 0.1
		nextstepruleButton.y = display.contentHeight * 0.755
		sceneGroup:insert( nextstepruleButton )
	elseif lang == "Russia" then
		categorytitleText.text = langxml.XnaContent.Russia.Punishment[2]:value()
		MildRuleText.text = langxml.XnaContent.Russia.Grade[1]:value()
		ModerateRuleText.text = langxml.XnaContent.Russia.Grade[2]:value()
		SevereRuleText.text = langxml.XnaContent.Russia.Grade[3]:value()
		randomruleButton = widget.newButton(
	    {
	        defaultFile = "Image/Family/random1001.png",
	        onEvent = randomruleButtonEvent
	    }
	    )
	    randomruleButton.x = display.contentWidth * 0.12
		randomruleButton.y = display.contentHeight * 0.6
		sceneGroup:insert( randomruleButton )

		--下一步按鈕
		nextstepruleButton = widget.newButton(
	    {
	        defaultFile = "Image/Family/coutinue1001.png",
	        onEvent = nextstepruleButtonEvent
	    }
	    )
	    nextstepruleButton.x = display.contentWidth * 0.1
		nextstepruleButton.y = display.contentHeight * 0.755
		sceneGroup:insert( nextstepruleButton )
	elseif lang == "Vientnames" then
		categorytitleText.text = langxml.XnaContent.Vientnames.Punishment[2]:value()
		MildRuleText.text = langxml.XnaContent.Vientnames.Grade[1]:value()
		ModerateRuleText.text = langxml.XnaContent.Vientnames.Grade[2]:value()
		SevereRuleText.text = langxml.XnaContent.Vientnames.Grade[3]:value()
		randomruleButton = widget.newButton(
	    {
	        defaultFile = "Image/Family/random1101.png",
	        onEvent = randomruleButtonEvent
	    }
	    )
	    randomruleButton.x = display.contentWidth * 0.12
		randomruleButton.y = display.contentHeight * 0.6
		sceneGroup:insert( randomruleButton )

		--下一步按鈕
		nextstepruleButton = widget.newButton(
	    {
	        defaultFile = "Image/Family/coutinue1101.png",
	        onEvent = nextstepruleButtonEvent
	    }
	    )
	    nextstepruleButton.x = display.contentWidth * 0.1
		nextstepruleButton.y = display.contentHeight * 0.755
		sceneGroup:insert( nextstepruleButton )
	elseif lang == "Dutch" then
		categorytitleText.text = langxml.XnaContent.Dutch.Punishment[2]:value()
		MildRuleText.text = langxml.XnaContent.Dutch.Grade[1]:value()
		ModerateRuleText.text = langxml.XnaContent.Dutch.Grade[2]:value()
		SevereRuleText.text = langxml.XnaContent.Dutch.Grade[3]:value()
		randomruleButton = widget.newButton(
	    {
	        defaultFile = "Image/Family/random1201.png",
	        onEvent = randomruleButtonEvent
	    }
	    )
	    randomruleButton.x = display.contentWidth * 0.12
		randomruleButton.y = display.contentHeight * 0.6
		sceneGroup:insert( randomruleButton )

		--下一步按鈕
		nextstepruleButton = widget.newButton(
	    {
	        defaultFile = "Image/Family/coutinue1201.png",
	        onEvent = nextstepruleButtonEvent
	    }
	    )
	    nextstepruleButton.x = display.contentWidth * 0.1
		nextstepruleButton.y = display.contentHeight * 0.755
		sceneGroup:insert( nextstepruleButton )
	elseif lang == "Italy" then
		categorytitleText.text = langxml.XnaContent.Italy.Punishment[2]:value()
		MildRuleText.text = langxml.XnaContent.Italy.Grade[1]:value()
		ModerateRuleText.text = langxml.XnaContent.Italy.Grade[2]:value()
		SevereRuleText.text = langxml.XnaContent.Italy.Grade[3]:value()
		randomruleButton = widget.newButton(
	    {
	        defaultFile = "Image/Family/random1301.png",
	        onEvent = randomruleButtonEvent
	    }
	    )
	    randomruleButton.x = display.contentWidth * 0.12
		randomruleButton.y = display.contentHeight * 0.6
		sceneGroup:insert( randomruleButton )

		--下一步按鈕
		nextstepruleButton = widget.newButton(
	    {
	        defaultFile = "Image/Family/coutinue1301.png",
	        onEvent = nextstepruleButtonEvent
	    }
	    )
	    nextstepruleButton.x = display.contentWidth * 0.1
		nextstepruleButton.y = display.contentHeight * 0.755
		sceneGroup:insert( nextstepruleButton )
	end
--加入家庭類選項

	function onRowRender( event )
		local row = event.row
	    local rowIndex = row.index
	    local row_ContentWidth = row.contentWidth
	    local row_ContentHeight = row.contentHeight
	    local nightclubrulecontent
	    local testarray ={}
	    --欄為背景
	    local rowbg = display.newImage( "Image/Family/stickers_back.png" )
	    rowbg.x = row_ContentWidth * 0.5
	    rowbg.y = row_ContentHeight * 0.5 

	    --[[local rowbg2 = display.newImage( "Image/Family/green_01.png" )
	    rowbg2.x = row.contentWidth * 0.7
	    rowbg2.y = row.contentHeight *0.000001]]
	    
	    numbertitle = display.newText( rowIndex,0 , 0, native.systemFontBold, 14 )
		numbertitle.x = row_ContentWidth * 0.1
		numbertitle.y =row_ContentHeight * 0.5
		numbertitle:setFillColor( 0, 0, 0 )

	    nightclubrulecontent = display.newText( "",0 , 0, native.systemFontBold, 14 )
		nightclubrulecontent.align = "left"
		nightclubrulecontent:setFillColor( 0, 0, 0 )
		--testarray = rulexml.Nightclubs.item[rowIndex]:value()
		nightclubrulecontent.text = nightclubruledata[rowIndex]
		
		--文字靠左
		nightclubrulecontent.anchorX = 0
	    nightclubrulecontent.x = row_ContentWidth * 0.15
	    nightclubrulecontent.y = row_ContentHeight * 0.5



	    row:insert( rowbg )
	    --row:insert( rowbg2 )
	    row:insert( numbertitle )
	     row:insert( nightclubrulecontent )
	end
	
	function onRowTouch( event )
	    local phase = event.phase
        local row = event.row
        local rowIndex = row.index
	    --print(event.phase)
	   	if event.phase == "press" then
	    	print(rowIndex)
	    	print(rulenotexist)
	    	for i=1,#nightclubrulecount do
	    		if nightclubrulecount[i] == rowIndex then
	    			table.remove( nightclubrulecount, i )
	    			print("remove")
	    			rulenotexist = true
	    		end
	    	end
	    	if (rulenotexist == false) then
		    	table.insert( nightclubrulecount, rowIndex)
				print(rulexml.Nightclubs.item[rowIndex]:value())
			end
			rulenotexist = false
		end
	   
	end

	tableView = widget.newTableView(
	    {
	        height = display.contentHeight * 0.7,
	        width = display.contentWidth * 0.73,
	        onRowRender = onRowRender,
	        onRowTouch = onRowTouch,
	        listener = tableViewListener,
	    }
	)
	tableView.x = display.contentWidth * 0.6
	tableView.y = display.contentHeight * 0.7

	-- Insert 40 rows
	for i = 1, #nightclubruledata do
	    -- Insert a row into the tableView

	    tableView:insertRow{}
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




