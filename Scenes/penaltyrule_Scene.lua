--penaltyrule_Scene.lua
local widget= require("widget")
local composer = require( "composer" )
local scene = composer.newScene()

local xml = require("xmlSimple").newParser()
local langxml = xml:loadFile("LanguageXML.xml")
local lang = composer.getVariable( "lang" )

local t = 1
local k = 1

local numrandom 

local spawnTimer
local updateTimer

local totalrule = composer.getVariable( "totalrule" )

local rule1_Text,rule2_Text,rule3_Text,rule4_Text,rule5_Text,rule6_Text,rule7_Text,rule8_Text

local replaybutton,mainmenubutton


function mainmenuEvent( ... )
	 composer.gotoScene( "Scenes.GameSelectionScene", frad,400)
end

function scene:create( event )
	local sceneGroup = self.view
	local rowheight = display.contentHeight * 0.1
--背景圖片
	local backgrounkImage = display.newImage( "Image/Runner/roulette_back.jpg" )
	backgrounkImage.x = display.contentCenterX
	backgrounkImage.y = display.contentCenterY
	sceneGroup:insert( backgrounkImage )

	local arrow = display.newImage( "Image/Runner/roulette_arrow1.png" )
	arrow.x = display.contentWidth * 0.48
    arrow.y = display.contentHeight * 0.18

    local titleText = display.newText( "20",0 , 0, native.systemFontBold, 20 )
	titleText.x = display.contentWidth * 0.71
	titleText.y = display.contentHeight * 0.1
	titleText:setFillColor(0, 0, 0 )
	sceneGroup:insert( titleText )
	
	local redText =  display.newText( "",0 , 0, native.systemFontBold, 16 )
	redText.x = display.contentWidth * 0.2
	redText.y = display.contentHeight * 0.04
	redText:setFillColor( 1, 0, 0 )
	sceneGroup:insert( redText )


	rule1_Text = display.newText( "",0 , 0, native.systemFontBold, 14 )
	rule1_Text.x = display.contentWidth * 0.5
	rule1_Text.y = display.contentHeight * 0.19 
	rule1_Text.anchorX = 0
	rule1_Text:setFillColor( 0, 0, 0 )
	sceneGroup:insert( rule1_Text )

	rule2_Text = display.newText( "",0 , 0, native.systemFontBold, 14 )
	rule2_Text.x = display.contentWidth * 0.5
	rule2_Text.y = display.contentHeight * 0.19 + rowheight
	rule2_Text.anchorX = 0
	rule2_Text:setFillColor( 0, 0, 0 )
	sceneGroup:insert( rule2_Text )

	rule3_Text = display.newText( "",0 , 0, native.systemFontBold, 14 )
	rule3_Text.x = display.contentWidth * 0.5
	rule3_Text.y = display.contentHeight * 0.19 + (rowheight * 2)
	rule3_Text.anchorX = 0
	rule3_Text:setFillColor( 0, 0, 0 )
	sceneGroup:insert( rule3_Text )

	rule4_Text = display.newText( "",0 , 0, native.systemFontBold, 14 )
	rule4_Text.x = display.contentWidth * 0.5
	rule4_Text.y = display.contentHeight * 0.19 + (rowheight * 3)
	rule4_Text.anchorX = 0
	rule4_Text:setFillColor( 0, 0, 0 )
	sceneGroup:insert( rule4_Text )

	rule5_Text = display.newText( "",0 , 0, native.systemFontBold, 14 )
	rule5_Text.x = display.contentWidth * 0.5
	rule5_Text.y = display.contentHeight * 0.19 + (rowheight * 4)
	rule5_Text.anchorX = 0
	rule5_Text:setFillColor( 0, 0, 0 )
	sceneGroup:insert( rule5_Text )

	rule6_Text = display.newText( "",0 , 0, native.systemFontBold, 14 )
	rule6_Text.x = display.contentWidth * 0.5
	rule6_Text.y = display.contentHeight * 0.19 + (rowheight * 5)
	rule6_Text.anchorX = 0
	rule6_Text:setFillColor( 0, 0, 0 )
	sceneGroup:insert( rule6_Text )

	rule7_Text = display.newText( "",0 , 0, native.systemFontBold, 14 )
	rule7_Text.x = display.contentWidth * 0.5
	rule7_Text.y = display.contentHeight * 0.19 + (rowheight * 6)
	rule7_Text.anchorX = 0
	rule7_Text:setFillColor( 0, 0, 0 )
	sceneGroup:insert( rule7_Text )

	rule8_Text = display.newText( "",0 , 0, native.systemFontBold, 14 )
	rule8_Text.x = display.contentWidth * 0.5
	rule8_Text.y = display.contentHeight * 0.19 + (rowheight * 7)
	rule8_Text.anchorX = 0
	rule8_Text:setFillColor( 0, 0, 0 )
	sceneGroup:insert( rule8_Text )

	


	rule1_Text.text = "1 "..totalrule[1]
	rule2_Text.text = "2 "..totalrule[2]
	rule3_Text.text = "3 "..totalrule[3]
	rule4_Text.text = "4 "..totalrule[4]
	rule5_Text.text = "5 "..totalrule[5]
	rule6_Text.text = "6 "..totalrule[6]
	rule7_Text.text = "7 "..totalrule[7]
	rule8_Text.text = "8 "..totalrule[8] 
	

	--[[rule1_Text.text = "1"
	rule2_Text.text = "2"
	rule3_Text.text = "3"
	rule4_Text.text = "4"
	rule5_Text.text = "5"
	rule6_Text.text = "6"
	rule7_Text.text = "7"
	rule8_Text.text = "8"]]

	if(lang == "Japan") then
		redText.text =  langxml.XnaContent.Japan.RRedTitle:value()
		titleText.text =  langxml.XnaContent.Japan.RListTitle:value()
		

	elseif lang == "Korea" then
		redText.text =  langxml.XnaContent.Korea.RRedTitle:value()
		titleText.text =  langxml.XnaContent.Korea.RListTitle:value()
	elseif lang == "China" then
		redText.text =  langxml.XnaContent.China.RRedTitle:value()
		titleText.text =  langxml.XnaContent.China.RListTitle:value()
	elseif lang == "Spain" then
		redText.text =  langxml.XnaContent.Spain.RRedTitle:value()
		titleText.text =  langxml.XnaContent.Spain.RListTitle:value()
	elseif lang == "Taiwan" then
		redText.text =  langxml.XnaContent.Taiwan.RRedTitle:value()
		titleText.text =  langxml.XnaContent.Taiwan.RListTitle:value()
	elseif lang == "America" then
		redText.text =  langxml.XnaContent.America.RRedTitle:value()
		titleText.text =  langxml.XnaContent.America.RListTitle:value()
	elseif lang == "France" then
		redText.text =  langxml.XnaContent.France.RRedTitle:value()
		titleText.text =  langxml.XnaContent.France.RListTitle:value()
	elseif lang == "Germany" then
		redText.text =  langxml.XnaContent.Germany.RRedTitle:value()
		titleText.text =  langxml.XnaContent.Germany.RListTitle:value()
	elseif lang == "Malaysia" then
		redText.text =  langxml.XnaContent.Malaysia.RRedTitle:value()
		titleText.text =  langxml.XnaContent.Malaysia.RListTitle:value()
	elseif lang == "Russia" then
		redText.text =  langxml.XnaContent.Russia.RRedTitle:value()
		titleText.text =  langxml.XnaContent.Russia.RListTitle:value()
	elseif lang == "Vientnames" then
		redText.text =  langxml.XnaContent.Vientnames.RRedTitle:value()
		titleText.text =  langxml.XnaContent.Vientnames.RListTitle:value()
	elseif lang == "Dutch" then
		redText.text =  langxml.XnaContent.Dutch.RRedTitle:value()
		titleText.text =  langxml.XnaContent.Dutch.RListTitle:value()
	elseif lang == "Italy" then
		redText.text =  langxml.XnaContent.Italy.RRedTitle:value()
		titleText.text =  langxml.XnaContent.Italy.RListTitle:value()
	end


	function flickertext(event )
		local count = event.count
		if( count%2 == 1 ) then
			redText.isVisible = false
		else
			redText.isVisible = true
		end
	end
	
	timer.performWithDelay( 590, flickertext,0)

	local rouletteData = { width=240, height=240, numFrames=1}
	local roulettesheet1 = graphics.newImageSheet( "Image/Runner/roulette_01.png", rouletteData )
	local roulettesheet2 = graphics.newImageSheet( "Image/Runner/roulette_02.png", rouletteData )
	local roulettesheet3 = graphics.newImageSheet( "Image/Runner/roulette_03.png", rouletteData )
	local roulettesheet4 = graphics.newImageSheet( "Image/Runner/roulette_04.png", rouletteData )
	local roulettesheet5 = graphics.newImageSheet( "Image/Runner/roulette_05.png", rouletteData )
	local roulettesheet6 = graphics.newImageSheet( "Image/Runner/roulette_06.png", rouletteData )
	local roulettesheet7 = graphics.newImageSheet( "Image/Runner/roulette_07.png", rouletteData )
	local roulettesheet8 = graphics.newImageSheet( "Image/Runner/roulette_08.png", rouletteData )

	local  rouletteSequenceData = {
                { name="rouletteseq1", sheet=roulettesheet1, start=1, count=1, time=1000, loopCount=0 },
                { name="rouletteseq2", sheet=roulettesheet2, start=1, count=1, time=1000, loopCount=0 },
                { name="rouletteseq3", sheet=roulettesheet3, start=1, count=1, time=1000, loopCount=0 },
                { name="rouletteseq4", sheet=roulettesheet4, start=1, count=1, time=1000, loopCount=0 },
                { name="rouletteseq5", sheet=roulettesheet5, start=1, count=1, time=1000, loopCount=0 },
                { name="rouletteseq6", sheet=roulettesheet6, start=1, count=1, time=1000, loopCount=0 },
                { name="rouletteseq7", sheet=roulettesheet7, start=1, count=1, time=1000, loopCount=0 },
                { name="rouletteseq8", sheet=roulettesheet8, start=1, count=1, time=1000, loopCount=0 },
                }
    local rouletteAnimation = display.newSprite( roulettesheet1, rouletteSequenceData )
    rouletteAnimation.x = display.contentWidth * 0.28
    rouletteAnimation.y = display.contentHeight * 0.48
    sceneGroup:insert( rouletteAnimation )
    sceneGroup:insert( arrow )



    local function iconAnimation(event)
    	
    	local count = event.count
    	local source = event.source
    	
    	rule1_Text:setFillColor( 0.5, 0.5, 0.5)
    	rule2_Text:setFillColor( 0.5, 0.5, 0.5)
    	rule3_Text:setFillColor( 0.5, 0.5, 0.5)
    	rule4_Text:setFillColor( 0.5, 0.5, 0.5)
    	rule5_Text:setFillColor( 0.5, 0.5, 0.5)
    	rule6_Text:setFillColor( 0.5, 0.5, 0.5)
    	rule7_Text:setFillColor( 0.5, 0.5, 0.5)
    	rule8_Text:setFillColor( 0.5, 0.5, 0.5)

    	--[[rule1_Text.text = "1"
    	rule2_Text.text = "2"
    	rule3_Text.text = "3"
    	rule4_Text.text = "4"
    	rule5_Text.text = "5"
    	rule6_Text.text = "6"
    	rule7_Text.text = "7"
    	rule8_Text.text = "8"]]

    	print(numrandom)
	    --print(t)
	    k = k + 1


	    


	    if t == 8 then
	    	rule8_Text:setFillColor( 0, 0, 0)
	    	rouletteAnimation:setSequence( "rouletteseq"..t )
	    	rouletteAnimation:play()
	        t = 1
	    else
	    	if t == 1 then
	    		rule1_Text:setFillColor( 0, 0, 0)
	    	elseif t == 2 then
	    		rule2_Text:setFillColor( 0, 0, 0)
	    	elseif t == 3 then
	    		rule3_Text:setFillColor( 0, 0, 0)
	    	elseif t == 4 then
	    		rule4_Text:setFillColor( 0, 0, 0)
	    	elseif t == 5 then
	    		rule5_Text:setFillColor( 0, 0, 0)
	    	elseif t == 6 then
	    		rule6_Text:setFillColor( 0, 0, 0)
	    	elseif t == 7 then
	    		rule7_Text:setFillColor( 0, 0, 0)
	    	end

	    	rouletteAnimation:setSequence( "rouletteseq"..t )
	    	rouletteAnimation:play()

	    	t = t + 1
	    	
	    end

	    --[[if t == 1 then
    		rule1_Text:setFillColor( 0, 0, 0)
    	elseif t == 2 then
    		rule2_Text:setFillColor( 0, 0, 0)
    	elseif t == 3 then
    		rule3_Text:setFillColor( 0, 0, 0)
    	elseif t == 4 then
    		rule4_Text:setFillColor( 0, 0, 0)
    	elseif t == 5 then
    		rule5_Text:setFillColor( 0, 0, 0)
    	elseif t == 6 then
    		rule6_Text:setFillColor( 0, 0, 0)
    	elseif t == 7 then
    		rule7_Text:setFillColor( 0, 0, 0)
    	elseif t == 8 then
    		rule8_Text:setFillColor( 0, 0, 0)
    	
    	end]]

	    if k == 59 then
	    	timer.cancel( source )
	    	spawnTimer = timer.performWithDelay( 200, iconAnimation ,0)
	    end

    	if k == numrandom then
    		timer.pause( source )
    		rouletteAnimation:pause()

    		if t == 1 then
	    		rule8_Text:setFillColor( 0, 191/255, 1)
	    	elseif t == 2 then
	    		rule1_Text:setFillColor( 0, 191/255, 1)
	    	elseif t == 3 then
	    		rule2_Text:setFillColor( 0, 191/255, 1)
	    	elseif t == 4 then
	    		rule3_Text:setFillColor( 0, 191/255, 1)
	    	elseif t == 5 then
	    		rule4_Text:setFillColor( 0, 191/255, 1)
	    	elseif t == 6 then
	    		rule5_Text:setFillColor( 0, 191/255, 1)
	    	elseif t == 7 then
	    		rule6_Text:setFillColor( 0, 191/255, 1)
	    	elseif t == 8 then
	    		rule7_Text:setFillColor( 0, 191/255, 1)
	    	end


	    	function replayEvent( ... )
	    		numrandom = math.random(70,82)
				if(k >= 70 and k <= 82) then
					k =1
					timer.cancel( spawnTimer )
					display.remove(replaybutton)
					display.remove(mainmenubutton)
					spawnTimer = timer.performWithDelay( 90, iconAnimation,0)
				end
	    	end

	    	replaybutton  =  widget.newButton(
		    {
		        
		        defaultFile = "Image/Runner/replay03.png",
		        onPress = replayEvent
		    }
		    )
		    replaybutton.x = display.contentWidth * 0.2
			replaybutton.y = display.contentHeight * 0.9
			sceneGroup:insert( replaybutton )


			mainmenubutton  =  widget.newButton(
		    {
		        
		        defaultFile = "Image/Runner/roulette_notes.png",
		        onPress = mainmenuEvent
		    }
		    )
		    mainmenubutton.x = display.contentWidth * 0.9
			mainmenubutton.y = display.contentHeight * 0.88
			sceneGroup:insert( mainmenubutton )
    	end
        
	end



	function touchListener( event)
		if event.phase == "ended" then
			numrandom = math.random(70,82)
			
			spawnTimer = timer.performWithDelay( 90, iconAnimation,0)
			
		end
	end
	
	
	rouletteAnimation:addEventListener( "touch", touchListener )


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




