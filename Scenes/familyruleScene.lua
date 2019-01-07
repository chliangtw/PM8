--familyruleScene.lua
local widget= require("widget")
local composer = require( "composer" )
local scene = composer.newScene()

local xml = require("xmlSimple").newParser()
local TWxml = xml:loadFile("LanguageXML.xml")

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

--類別標題
	local categorytitle = display.newImage( "Image/Family/family_item.png" )
	categorytitle.x = display.contentWidth * 0.6
	categorytitle.y = display.contentHeight * 0.08
	sceneGroup:insert( categorytitle )

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

--加入家庭類選項

	function onRowRender( event )
		local row = event.row
	    local rowIndex = row.index
	    local row_ContentWidth = row.contentWidth
	    local row_ContentHeight = row.contentHeight
	    --欄為背景
	    local rowbg = display.newImage( "Image/Family/stickers_back.png" )
	    rowbg.x = row_ContentWidth * 0.5
	    rowbg.y = row_ContentHeight * 0.5

	    row:insert( rowbg )
	end
	

	local tableView = widget.newTableView(
	    {
	        height = 330,
	        width = display.contentWidth * 0.73,
	        onRowRender = onRowRender,
	        onRowTouch = onRowTouch,
	        listener = scrollListener
	    }
	)
	tableView.x = display.contentWidth * 0.6
	tableView.y = display.contentHeight * 0.865
	-- Insert 40 rows
	for i = 1, 40 do
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




