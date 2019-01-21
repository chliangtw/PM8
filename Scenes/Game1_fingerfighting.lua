--Game1_fingerfighting.lua
local widget= require("widget")
local composer = require( "composer" )
local scene = composer.newScene()
local sceneGroup
--請動多點觸碰
system.activate( "multitouch" )


--Seed randomizer
local seed = os.time();
math.randomseed( seed )

--讀取XML
local xml = require("xmlSimple").newParser()
local TWxml = xml:loadFile("LanguageXML.xml")

--local chooserole = composer.getVariable( "chooserole" )
local chooserole = {true,true,true,true}
local c = {30,25,20,15,10,5}
local i = 1

local DazyIcon,TrickyIcon,ChunkandEddyIcon,AshIcon,IconButton
local DazyScoreText ,TrickyScoreText,ChunkandEddyScoreText,AshScoreText
local touchDazyIcon,touchTrickyIcon,touchChunkandEddyIcon,touchAshIcon
local touchsamllDazyIcon,touchsamllTrickyIcon,touchsamllCandEIcon,touchsamllAshIcon

local DazyScore,TrickyScore,CandEScore,AshScore = 0,0,0,0

local iconlocation,smalliconlocation

local GameTimeText
local GameTime = 30

local BGAnimation,DazyAnimation,TrickyAnimation,CandEAnimation,AshAnimation

local bgtimer,createicontimmer,createicontimmer2,createicontimmer3,createicontimmer4

local gameresult = {false,false,false,false}

function GameTimecountdown( ... )
	function countdown(event)
		local count = event.count
		local source = event.source
		if GameTime > 0 then
			GameTime = GameTime - 1
			GameTimeText.text = GameTime
		else
			timer.cancel( source)
		end

		if GameTime % 2 == 0 and GameTime > 1 then
			touchDazyIcon.x = math.random(touchDazyIcon.width / 2,display.contentWidth - (touchDazyIcon.width / 2))
			touchDazyIcon.y = math.random(touchDazyIcon.height / 2,display.contentHeight - (touchDazyIcon.height / 2))

			touchTrickyIcon.x = math.random(touchTrickyIcon.width / 2,display.contentWidth - (touchTrickyIcon.width / 2))
			touchTrickyIcon.y = math.random(touchTrickyIcon.height / 2,display.contentHeight - (touchTrickyIcon.height / 2))

			touchChunkandEddyIcon.x = math.random(touchChunkandEddyIcon.width / 2,display.contentWidth - (touchChunkandEddyIcon.width / 2))
			touchChunkandEddyIcon.y = math.random(touchChunkandEddyIcon.height / 2,display.contentHeight - (touchChunkandEddyIcon.height / 2))

			touchAshIcon.x = math.random(touchAshIcon.width / 2,display.contentWidth - (touchAshIcon.width / 2))
			touchAshIcon.y = math.random(touchAshIcon.height / 2,display.contentHeight - (touchAshIcon.height / 2))

			if(touchDazyIcon.isVisible) then
				print("test1")
				touchDazyIcon.isVisible=false
			else
				print("test2")
				touchDazyIcon.isVisible=true
			end

			if(touchTrickyIcon.isVisible) then
				print("test1")
				touchTrickyIcon.isVisible=false
			else
				print("test2")
				touchTrickyIcon.isVisible=true
			end

			if(touchChunkandEddyIcon.isVisible) then
				print("test1")
				touchChunkandEddyIcon.isVisible=false
			else
				print("test2")
				touchChunkandEddyIcon.isVisible=true
			end

			if(touchAshIcon.isVisible) then
				print("test1")
				touchAshIcon.isVisible=false
			else
				print("test2")
				touchAshIcon.isVisible=true
			end
		end

		if GameTime == 20 then
			
			if(chooserole[1] == true and chooserole[2] == true and chooserole[3] == true and chooserole[4] == true) then
				print("1234")
				--[[randomlocation(touchsamllDazyIcon,1500,800,touchsamllDazyIcon.width * 0.6 / 2,touchsamllDazyIcon.height * 0.6 / 2)
				randomlocation(touchsamllTrickyIcon,1500,800,touchsamllTrickyIcon.width * 0.6 / 2,touchsamllTrickyIcon.height * 0.6 / 2)
				randomlocation(touchsamllCandEIcon,1500,800,touchsamllCandEIcon.width * 0.6 / 2,touchsamllCandEIcon.height * 0.6 / 2)
				randomlocation(touchsamllAshIcon,1500,800,touchsamllAshIcon.width * 0.6 / 2,touchsamllAshIcon.height * 0.6 / 2)
			]]
			elseif(chooserole[1] == true and chooserole[2] == true and chooserole[3] == true) then
				
				randomlocation(touchsamllDazyIcon,1500,800,touchsamllDazyIcon.width * 0.6 / 2,touchsamllDazyIcon.height * 0.6 / 2)
				randomlocation(touchsamllTrickyIcon,1500,800,touchsamllTrickyIcon.width * 0.6 / 2,touchsamllTrickyIcon.height * 0.6 / 2)
				randomlocation(touchsamllCandEIcon,1500,800,touchsamllCandEIcon.width * 0.6 / 2,touchsamllCandEIcon.height * 0.6 / 2)
				

			elseif(chooserole[1] == true and chooserole[2] == true and chooserole[4] == true) then
				
				randomlocation(touchsamllDazyIcon,1500,800,touchsamllDazyIcon.width * 0.6 / 2,touchsamllDazyIcon.height * 0.6 / 2)
				randomlocation(touchsamllTrickyIcon,1500,800,touchsamllTrickyIcon.width * 0.6 / 2,touchsamllTrickyIcon.height * 0.6 / 2)
				randomlocation(touchsamllAshIcon,1500,800,touchsamllAshIcon.width * 0.6 / 2,touchsamllAshIcon.height * 0.6 / 2)

			elseif(chooserole[1] == true and chooserole[3] == true and chooserole[4] == true) then

				randomlocation(touchsamllDazyIcon,1500,800,touchsamllDazyIcon.width * 0.6 / 2,touchsamllDazyIcon.height * 0.6 / 2)
				randomlocation(touchsamllCandEIcon,1500,800,touchsamllCandEIcon.width * 0.6 / 2,touchsamllCandEIcon.height * 0.6 / 2)
				randomlocation(touchsamllAshIcon,1500,800,touchsamllAshIcon.width * 0.6 / 2,touchsamllAshIcon.height * 0.6 / 2)

			elseif(chooserole[2] == true and chooserole[3] == true and chooserole[4] == true) then

				randomlocation(touchsamllTrickyIcon,1500,800,touchsamllTrickyIcon.width * 0.6 / 2,touchsamllTrickyIcon.height * 0.6 / 2)
				randomlocation(touchsamllCandEIcon,1500,800,touchsamllCandEIcon.width * 0.6 / 2,touchsamllCandEIcon.height * 0.6 / 2)
				randomlocation(touchsamllAshIcon,1500,800,touchsamllAshIcon.width * 0.6 / 2,touchsamllAshIcon.height * 0.6 / 2)

			elseif(chooserole[1] == true and chooserole[2] == true) then

				randomlocation(touchsamllDazyIcon,1500,800,touchsamllDazyIcon.width * 0.6 / 2,touchsamllDazyIcon.height * 0.6 / 2)
				randomlocation(touchsamllTrickyIcon,1500,800,touchsamllTrickyIcon.width * 0.6 / 2,touchsamllTrickyIcon.height * 0.6 / 2)

			elseif(chooserole[1] == true and chooserole[3] == true) then

				randomlocation(touchDazyIcon,1000,1000, touchDazyIcon.width * 0.8 / 2, touchDazyIcon.height * 0.8 / 2)
				randomlocation(touchsamllCandEIcon,1000,1000, touchsamllCandEIcon.width * 0.8 / 2, touchsamllCandEIcon.height * 0.8 / 2)

			elseif(chooserole[1] == true and chooserole[4] == true) then

				randomlocation(touchsamllDazyIcon,1500,800,touchsamllDazyIcon.width * 0.6 / 2,touchsamllDazyIcon.height * 0.6 / 2)
				randomlocation(touchsamllAshIcon,1500,800,touchsamllAshIcon.width * 0.6 / 2,touchsamllAshIcon.height * 0.6 / 2)

			elseif(chooserole[2] == true and chooserole[3] == true) then

				randomlocation(touchsamllTrickyIcon,1500,800,touchsamllTrickyIcon.width * 0.6 / 2,touchsamllTrickyIcon.height * 0.6 / 2)
				randomlocation(touchsamllCandEIcon,1500,800,touchsamllCandEIcon.width * 0.6 / 2,touchsamllCandEIcon.height * 0.6 / 2)

			elseif(chooserole[2] == true and chooserole[4] == true) then

				randomlocation(touchsamllTrickyIcon,1500,800,touchsamllTrickyIcon.width * 0.6 / 2,touchsamllTrickyIcon.height * 0.6 / 2)
				randomlocation(touchsamllCandEIcon,1500,800,touchsamllCandEIcon.width * 0.6 / 2,touchsamllCandEIcon.height * 0.6 / 2)

			elseif(chooserole[3] == true and chooserole[4] == true) then

				randomlocation(touchsamllCandEIcon,1500,800,touchsamllCandEIcon.width * 0.6 / 2,touchsamllCandEIcon.height * 0.6 / 2)
				randomlocation(touchsamllAshIcon,1500,800,touchsamllAshIcon.width * 0.6 / 2,touchsamllAshIcon.height * 0.6 / 2)

			elseif(chooserole[1] == true) then

				randomlocation(touchsamllDazyIcon,1500,800,touchsamllDazyIcon.width * 0.6 / 2,touchsamllDazyIcon.height * 0.6 / 2)
			
			elseif(chooserole[2] == true) then
				
				randomlocation(touchsamllTrickyIcon,1500,800,touchsamllTrickyIcon.width * 0.6 / 2,touchsamllTrickyIcon.height * 0.6 / 2)

			elseif(chooserole[3] == true) then

				randomlocation(touchsamllCandEIcon,1500,800,touchsamllCandEIcon.width * 0.6 / 2,touchsamllCandEIcon.height * 0.6 / 2)
				
			elseif(chooserole[4] == true) then
				
				randomlocation(touchsamllAshIcon,1500,800,touchsamllAshIcon.width * 0.6 / 2,touchsamllAshIcon.height * 0.6 / 2)
			
			end
		end

		if GameTime == 15 then
		
		    --執行背景動畫
		     local function swapSheet()
		     	--print(i)
		    	if i == 4 then
			    	i = 1
			    	BGAnimation:setSequence( "BGseq"..i )
			    	BGAnimation:play()

			    else
			    	i = i + 1
			    	BGAnimation:setSequence( "BGseq"..i )
			    	BGAnimation:play()

			    end
		        
			end
			bgtimer = timer.performWithDelay( 300, swapSheet,0 )
		end

		if GameTime == 10 then
			GameTimeText:setFillColor(136/255,0, 0 )
		end
		
		if GameTime == 0 then
			if(DazyScore>TrickyScore and DazyScore>CandEScore and DazyScore>AshScore)then
				gameresult[1] = true
			elseif(TrickyScore>DazyScore and TrickyScore>CandEScore and TrickyScore>AshScore)then
				gameresult[2] = true
			elseif(CandEScore>DazyScore and CandEScore>TrickyScore and CandEScore>AshScore)then
				gameresult[3] = true
			elseif(AshScore>DazyScore and AshScore>TrickyScore and AshScore>CandEScore)then
				gameresult[4] = true
			elseif(DazyScore==TrickyScore and DazyScore>CandEScore and DazyScore>AshScore)then
				gameresult[1] = true
				gameresult[2] = true
			elseif(DazyScore == CandEScore and DazyScore>TrickyScore and DazyScore>AshScore)then
				gameresult[1] = true
				gameresult[3] = true
			elseif(DazyScore == AshScore and DazyScore>TrickyScore and DazyScore>CandEScore)then
				gameresult[1] = true
				gameresult[4] = true
			elseif(TrickyScore == CandEScore and TrickyScore>DazyScore and TrickyScore>AshScore)then
				gameresult[2] = true
				gameresult[3] = true
			elseif(TrickyScore == AshScore and TrickyScore>DazyScore and TrickyScore>CandEScore)then
				gameresult[2] = true
				gameresult[4] = true
			elseif(CandEScore == AshScore and CandEScore>DazyScore and CandEScore>TrickyScore ) then
				gameresult[3] = true
				gameresult[4] = true
			elseif(DazyScore==TrickyScore and DazyScore==CandEScore and DazyScore>AshScore)then
				gameresult[1] = true
				gameresult[2] = true
				gameresult[3] = true
			elseif(DazyScore==TrickyScore and DazyScore==AshScore and DazyScore>CandEScore)then
				gameresult[1] = true
				gameresult[2] = true
				gameresult[4] = true
			elseif(DazyScore==CandEScore and DazyScore==AshScore and DazyScore>TrickyScore)then
				gameresult[1] = true
				gameresult[3] = true
				gameresult[4] = true
			elseif(TrickyScore==CandEScore and TrickyScore==AshScore and TrickyScore>DazyScore)then
				gameresult[2] = true
				gameresult[3] = true
				gameresult[4] = true
			elseif(DazyScore==TrickyScore and DazyScore==CandEScore and DazyScore==AshScore)then
				gameresult[1] = true
				gameresult[2] = true
				gameresult[3] = true
				gameresult[4] = true
			end

			timer.cancel( source)

			composer.setVariable( "gameresult", gameresult)
			composer.gotoScene( "Scenes.GameResult_Scene", frad,400)
		end

	end

	timer.performWithDelay( 1000, countdown,0)	
end


--[[function randomlocation( obj,seconds,dis_seconds,wid,hei)
	function CreatetouchIcon( event )
		local creattimer = event.source
		function afterTimer()
		    print(obj)
		    obj.isVisible=false
		    timer.resume(creattimer)
		    --timer.performWithDelay( math.random(1000,2000), CreatetouchIcon,0)
		end
		 
		timer.performWithDelay(dis_seconds, afterTimer, 1)

		obj.isVisible=true
		
		obj.x = math.random(wid,display.contentWidth-wid)
		obj.y = math.random(hei,display.contentHeight-hei)
		--timer.pause( creattimer )
		timer.cancel( creattimer )
		

	end
	createicontimmer = timer.performWithDelay( math.random(500,2000), CreatetouchIcon,0)
end]]

--[[ 測試創建按鈕
function randomlocation2(ImageFile,B_id)
	function CreatetouchIcon( event )
		local creattimer = event.source
		local wid,hei
		IconButton = widget.newButton(
	    {
	        defaultFile = ImageFile,
	        id = B_id,
	        onPress  = touchIconEvent
	    }
	    )
	    IconButton.xScale = 0.8
		IconButton.yScale = 0.8
		wid = IconButton.width * 0.8 / 2
		hei = IconButton.height * 0.8 / 2
		IconButton.x = math.random(wid,display.contentWidth-wid)
		IconButton.y = math.random(hei,display.contentHeight-hei)
		sceneGroup:insert( IconButton )
		timer.pause( creattimer )
		function afterTimer()
		    
		    --obj.isVisible=false
		    display.remove(IconButton)
		    timer.resume(creattimer)
		    --timer.performWithDelay( math.random(1000,2000), CreatetouchIcon,0)
		end
		 
		timer.performWithDelay(1000, afterTimer, 1)
		
		

		
		--timer.pause( creattimer )
		--timer.cancel( creattimer )
		

	end
	timer.performWithDelay( math.random(500,2000), CreatetouchIcon,0)

end]]

function touchIconEvent( event )
	local button_id = event.target.id
	--print(event.target.id)


	if button_id == "DazyIcon" then
		display.remove(IconButton)
		touchDazyIcon.isVisible=false
		--playiconAnimation(touchDazyIcon,touchDazyIcon.x,touchDazyIcon.y)
		DazyScore = DazyScore + 50
	elseif button_id == "samllDazyIcon" then
		touchsamllDazyIcon.isVisible=false
		DazyScore = DazyScore + 100
	elseif button_id == "TrickyIcon" then
		touchTrickyIcon.isVisible=false
		TrickyScore = TrickyScore + 50
	elseif button_id == "samllTrickyIcon" then
		touchsamllTrickyIcon.isVisible=false
		TrickyScore = TrickyScore + 100
	elseif button_id == "CandEIcon" then
		touchChunkandEddyIcon.isVisible=false
		CandEScore = CandEScore + 50
	elseif button_id == "samllCandEIcon" then
		print("samllCandEIcon")
		touchsamllCandEIcon.isVisible=false
		CandEScore = CandEScore + 100
	elseif button_id == "AshIcon" then
		touchAshIcon.isVisible=false
		AshScore = AshScore + 50
	elseif button_id == "samllAshIcon" then
		touchsamllAshIcon.isVisible=false
		AshScore = AshScore + 100
	end

	DazyScoreText.text = DazyScore
	TrickyScoreText.text = TrickyScore
	ChunkandEddyScoreText.text = CandEScore
	AshScoreText.text = AshScore

	print("DazyScore : " .. DazyScore)
	print("TrickyScore : " .. TrickyScore)
	print("CandEScore : " .. CandEScore)
	print("AshScore : " .. AshScore)
end


--動畫會卡(未完成)
function playiconAnimation( obj,Animation_x,Animation_y)

	local iconData = { width=153, height=150, numFrames=1}
	local Dazyiconsheet1 = graphics.newImageSheet( "Image/Game/BallImage/bubu/bubu_01.png", iconData )
	local Dazyiconsheet2 = graphics.newImageSheet( "Image/Game/BallImage/bubu/bubu_02.png", iconData )
	local Dazyiconsheet3 = graphics.newImageSheet( "Image/Game/BallImage/bubu/bubu_03.png", iconData )

	local DazyiconSequenceData = {
                { name="Dazyiconseq1", sheet=Dazyiconsheet1, start=1, count=1, time=1000, loopCount=0 },
                { name="Dazyiconseq2", sheet=Dazyiconsheet2, start=1, count=1, time=1000, loopCount=0 },
                { name="Dazyiconseq3", sheet=Dazyiconsheet3, start=1, count=1, time=1000, loopCount=0 },
                }
    DazyAnimation = display.newSprite( Dazyiconsheet1, DazyiconSequenceData )
    DazyAnimation.xScale = 0.8
	DazyAnimation.yScale = 0.8
    DazyAnimation.x = display.contentWidth * 0.3
    DazyAnimation.y = display.contentHeight * 0.4
    DazyAnimation.isVisible = false
    sceneGroup:insert( DazyAnimation )

	local function iconAnimation(event)
    	local count = event.count
	    if count == 4 then

	        timer.cancel( event.source )
	       	obj.isVisible=false
	       	
	       	display.remove(DazyAnimation)
	       	display.remove(DazyiconSequenceData)
	       	

	    else
	    	DazyAnimation.x = Animation_x
	    	DazyAnimation.y = Animation_y
	    	DazyAnimation.isVisible = true
	    	DazyAnimation:setSequence( "Dazyiconseq"..count )
	    	DazyAnimation:play()
	    end
    	
        
	end
	timer.performWithDelay( 70, iconAnimation,0)
end

function scene:create( event )
	sceneGroup = self.view
	

--背景圖片
	local backgrounkImage = display.newImage( "Image/Game/back_01.png" )
	backgrounkImage.x = display.contentCenterX
	backgrounkImage.y = display.contentCenterY
	sceneGroup:insert( backgrounkImage )

	local BGData = { width=480, height=320, numFrames=1}
	local BGsheet1 = graphics.newImageSheet( "Image/Game/back_01.png", BGData )
	local BGsheet2 = graphics.newImageSheet( "Image/Game/back_02.png", BGData )
	local BGsheet3 = graphics.newImageSheet( "Image/Game/back_03.png", BGData )
	local BGsheet4 = graphics.newImageSheet( "Image/Game/back_04.png", BGData )
	local BGSequenceData = {
                { name="BGseq1", sheet=BGsheet1, start=1, count=1, time=220, loopCount=0 },
                { name="BGseq2", sheet=BGsheet2, start=1, count=1, time=220, loopCount=0 },
                { name="BGseq3", sheet=BGsheet3, start=1, count=1, time=220, loopCount=0 },
                { name="BGseq4", sheet=BGsheet4, start=1, count=1, time=220, loopCount=0 },
                }
    BGAnimation = display.newSprite( BGsheet1, BGSequenceData )
    BGAnimation.x = display.contentWidth * 0.5
    BGAnimation.y = display.contentHeight * 0.5
    sceneGroup:insert( BGAnimation )

	GameTimeText= display.newText( 30,0 , 0, native.systemFont, 120 )
	GameTimeText.x = display.contentWidth * 0.5
	GameTimeText.y = display.contentHeight * 0.5
	GameTimeText:setFillColor(1,1, 1 )
	sceneGroup:insert( GameTimeText )
	

	if(chooserole[1] == true) then
		DazyIcon = display.newImage( "Image/Scoreboard/icon/bubu_icon.png" )
		DazyIcon.alpha = 0.5
		DazyIcon.xScale = 0.28
		DazyIcon.yScale = 0.25
		sceneGroup:insert( DazyIcon)

		DazyScoreText = display.newText( 0,0 , 0, native.systemFontBold, 12 )
		DazyScoreText:setFillColor( 0, 0, 0, 0.4 )
		sceneGroup:insert( DazyScoreText )

		touchDazyIcon = widget.newButton(
	    {
	        defaultFile = "Image/Game/BallImage/bubu/bubu.png",
	        id = "DazyIcon",
	        onPress  = touchIconEvent
	    }
	    )
	    touchDazyIcon.xScale = 0.8
		touchDazyIcon.yScale = 0.8
		touchDazyIcon.isVisible=false
		sceneGroup:insert( touchDazyIcon )

		touchsamllDazyIcon = widget.newButton(
	    {
	        defaultFile = "Image/Game/BallImage/bubu/bubu.png",
	        id = "samllDazyIcon",
	        onPress  = touchIconEvent
	    }
	    )
	    touchsamllDazyIcon.xScale = 0.6
		touchsamllDazyIcon.yScale = 0.6
		touchsamllDazyIcon.isVisible=false
		sceneGroup:insert( touchsamllDazyIcon )
	end

	if(chooserole[2] == true) then
		TrickyIcon = display.newImage( "Image/Scoreboard/icon/little_icon.png" )
		TrickyIcon.alpha = 0.5
		TrickyIcon.xScale = 0.28
		TrickyIcon.yScale = 0.25
		sceneGroup:insert( TrickyIcon)

		TrickyScoreText = display.newText( 0,0 , 0, native.systemFontBold, 12 )
		TrickyScoreText:setFillColor( 0, 0, 0 ,0.4)
		sceneGroup:insert( TrickyScoreText )

		touchTrickyIcon = widget.newButton(
	    {
	        defaultFile = "Image/Game/BallImage/little/little.png",
	        id = "TrickyIcon",
	        onPress  = touchIconEvent
	    }
	    )
	    touchTrickyIcon.xScale = 0.8
		touchTrickyIcon.yScale = 0.8
		touchTrickyIcon.isVisible=false
		sceneGroup:insert( touchTrickyIcon )

		touchsamllTrickyIcon = widget.newButton(
	    {
	        defaultFile = "Image/Game/BallImage/little/little.png",
	        id = "samllTrickyIcon",
	        onPress  = touchIconEvent
	    }
	    )
	    touchsamllTrickyIcon.xScale = 0.6
		touchsamllTrickyIcon.yScale = 0.6
		touchsamllTrickyIcon.isVisible=false
		sceneGroup:insert( touchsamllTrickyIcon )
	end

	if(chooserole[3] == true) then
		ChunkandEddyIcon = display.newImage( "Image/Scoreboard/icon/haha_icon.png" )
		ChunkandEddyIcon.alpha = 0.5
		ChunkandEddyIcon.xScale = 0.28
		ChunkandEddyIcon.yScale = 0.25
		sceneGroup:insert( ChunkandEddyIcon)

		ChunkandEddyScoreText = display.newText( 0,0 , 0, native.systemFontBold, 12 )
		ChunkandEddyScoreText:setFillColor( 0, 0, 0, 0.4 )
		sceneGroup:insert( ChunkandEddyScoreText )

		touchChunkandEddyIcon = widget.newButton(
	    {
	        defaultFile = "Image/Game/BallImage/haha/haha.png",
	        id = "CandEIcon",
	        onPress  = touchIconEvent
	    }
	    )
	    touchChunkandEddyIcon.xScale = 0.8
		touchChunkandEddyIcon.yScale = 0.8
		touchChunkandEddyIcon.isVisible=false
		sceneGroup:insert( touchChunkandEddyIcon )

		touchsamllCandEIcon = widget.newButton(
	    {
	        defaultFile = "Image/Game/BallImage/haha/haha.png",
	        id = "samllCandEIcon",
	        onPress  = touchIconEvent
	    }
	    )
	    touchsamllCandEIcon.xScale = 0.6
		touchsamllCandEIcon.yScale = 0.6
		touchsamllCandEIcon.isVisible=false
		sceneGroup:insert( touchsamllCandEIcon )
	end

	if(chooserole[4] == true) then
		AshIcon = display.newImage( "Image/Scoreboard/icon/tall_icon.png" )
		AshIcon.alpha = 0.5
		AshIcon.xScale = 0.28
		AshIcon.yScale = 0.25
		sceneGroup:insert( AshIcon)

		AshScoreText = display.newText( 0,0 , 0, native.systemFontBold, 14 )
		AshIcon.alpha = 0.5
		AshScoreText:setFillColor( 0, 0, 0, 0.4 )
		sceneGroup:insert( AshScoreText )

		touchAshIcon = widget.newButton(
	    {
	        defaultFile = "Image/Game/BallImage/tall/tall.png",
	        id = "AshIcon",
	        onPress  = touchIconEvent
	    }
	    )
	    touchAshIcon.xScale = 0.8
		touchAshIcon.yScale = 0.8
		touchAshIcon.isVisible=false
		sceneGroup:insert( touchAshIcon )

		touchsamllAshIcon = widget.newButton(
	    {
	        defaultFile = "Image/Game/BallImage/tall/tall.png",
	        id = "samllAshIcon",
	        onPress  = touchIconEvent
	    }
	    )
	    touchsamllAshIcon.xScale = 0.6
		touchsamllAshIcon.yScale = 0.6
		touchsamllAshIcon.isVisible = false
		sceneGroup:insert( touchsamllAshIcon )
	end

	--[[TrickyIcon.x = display.contentWidth * 0.15
	TrickyIcon.y = display.contentHeight * 0.2
	TrickyScoreText.x = display.contentWidth * 0.15
	TrickyScoreText.y = display.contentHeight * 0.3
	touchTrickyIcon.x = display.contentWidth * 0.5
	touchTrickyIcon.y = display.contentHeight * 0.5]]
	if(chooserole[1] == true and chooserole[2] == true and chooserole[3] == true and chooserole[4] == true) then

		DazyIcon.x = display.contentWidth * 0.15
		DazyIcon.y = display.contentHeight * 0.2

		DazyScoreText.x = display.contentWidth * 0.15
		DazyScoreText.y = display.contentHeight * 0.3

		TrickyIcon.x = display.contentWidth * 0.15
		TrickyIcon.y = display.contentHeight * 0.4

		TrickyScoreText.x = display.contentWidth * 0.15
		TrickyScoreText.y = display.contentHeight * 0.5

		ChunkandEddyIcon.x = display.contentWidth * 0.15
		ChunkandEddyIcon.y = display.contentHeight * 0.6

		ChunkandEddyScoreText.x = display.contentWidth * 0.15
		ChunkandEddyScoreText.y = display.contentHeight * 0.7

		AshIcon.x = display.contentWidth * 0.15
		AshIcon.y = display.contentHeight * 0.8

		AshScoreText.x = display.contentWidth * 0.15
		AshScoreText.y = display.contentHeight * 0.9

	elseif(chooserole[1] == true and chooserole[2] == true and chooserole[3] == true) then
		
		DazyIcon.x = display.contentWidth * 0.15
		DazyIcon.y = display.contentHeight * 0.2

		DazyScoreText.x = display.contentWidth * 0.15
		DazyScoreText.y = display.contentHeight * 0.3

		TrickyIcon.x = display.contentWidth * 0.15
		TrickyIcon.y = display.contentHeight * 0.4

		TrickyScoreText.x = display.contentWidth * 0.15
		TrickyScoreText.y = display.contentHeight * 0.5

		ChunkandEddyIcon.x = display.contentWidth * 0.15
		ChunkandEddyIcon.y = display.contentHeight * 0.6

		ChunkandEddyScoreText.x = display.contentWidth * 0.15
		ChunkandEddyScoreText.y = display.contentHeight * 0.7

	elseif(chooserole[1] == true and chooserole[2] == true and chooserole[4] == true) then

		DazyIcon.x = display.contentWidth * 0.15
		DazyIcon.y = display.contentHeight * 0.2

		DazyScoreText.x = display.contentWidth * 0.15
		DazyScoreText.y = display.contentHeight * 0.3

		TrickyIcon.x = display.contentWidth * 0.15
		TrickyIcon.y = display.contentHeight * 0.4

		TrickyScoreText.x = display.contentWidth * 0.15
		TrickyScoreText.y = display.contentHeight * 0.5

		AshIcon.x = display.contentWidth * 0.15
		AshIcon.y = display.contentHeight * 0.6

		AshScoreText.x = display.contentWidth * 0.15
		AshScoreText.y = display.contentHeight * 0.7

	elseif(chooserole[1] == true and chooserole[3] == true and chooserole[4] == true) then

		DazyIcon.x = display.contentWidth * 0.15
		DazyIcon.y = display.contentHeight * 0.2

		DazyScoreText.x = display.contentWidth * 0.15
		DazyScoreText.y = display.contentHeight * 0.3

		ChunkandEddyIcon.x = display.contentWidth * 0.15
		ChunkandEddyIcon.y = display.contentHeight * 0.4

		ChunkandEddyScoreText.x = display.contentWidth * 0.15
		ChunkandEddyScoreText.y = display.contentHeight * 0.5

		AshIcon.x = display.contentWidth * 0.15
		AshIcon.y = display.contentHeight * 0.6

		AshScoreText.x = display.contentWidth * 0.15
		AshScoreText.y = display.contentHeight * 0.7

	elseif(chooserole[2] == true and chooserole[3] == true and chooserole[4] == true) then

		TrickyIcon.x = display.contentWidth * 0.15
		TrickyIcon.y = display.contentHeight * 0.2

		TrickyScoreText.x = display.contentWidth * 0.15
		TrickyScoreText.y = display.contentHeight * 0.3

		ChunkandEddyIcon.x = display.contentWidth * 0.15
		ChunkandEddyIcon.y = display.contentHeight * 0.4

		ChunkandEddyScoreText.x = display.contentWidth * 0.15
		ChunkandEddyScoreText.y = display.contentHeight * 0.5

		AshIcon.x = display.contentWidth * 0.15
		AshIcon.y = display.contentHeight * 0.6

		AshScoreText.x = display.contentWidth * 0.15
		AshScoreText.y = display.contentHeight * 0.7

	elseif(chooserole[1] == true and chooserole[2] == true) then

		DazyIcon.x = display.contentWidth * 0.15
		DazyIcon.y = display.contentHeight * 0.2

		DazyScoreText.x = display.contentWidth * 0.15
		DazyScoreText.y = display.contentHeight * 0.3

		TrickyIcon.x = display.contentWidth * 0.15
		TrickyIcon.y = display.contentHeight * 0.4

		TrickyScoreText.x = display.contentWidth * 0.15
		TrickyScoreText.y = display.contentHeight * 0.5

	elseif(chooserole[1] == true and chooserole[3] == true) then

		DazyIcon.x = display.contentWidth * 0.15
		DazyIcon.y = display.contentHeight * 0.2

		DazyScoreText.x = display.contentWidth * 0.15
		DazyScoreText.y = display.contentHeight * 0.3

		ChunkandEddyIcon.x = display.contentWidth * 0.15
		ChunkandEddyIcon.y = display.contentHeight * 0.4

		ChunkandEddyScoreText.x = display.contentWidth * 0.15
		ChunkandEddyScoreText.y = display.contentHeight * 0.5

	elseif(chooserole[1] == true and chooserole[4] == true) then

		DazyIcon.x = display.contentWidth * 0.15
		DazyIcon.y = display.contentHeight * 0.2

		DazyScoreText.x = display.contentWidth * 0.15
		DazyScoreText.y = display.contentHeight * 0.3

		AshIcon.x = display.contentWidth * 0.15
		AshIcon.y = display.contentHeight * 0.4

		AshScoreText.x = display.contentWidth * 0.15
		AshScoreText.y = display.contentHeight * 0.5

	elseif(chooserole[2] == true and chooserole[3] == true) then

		TrickyIcon.x = display.contentWidth * 0.15
		TrickyIcon.y = display.contentHeight * 0.2

		TrickyScoreText.x = display.contentWidth * 0.15
		TrickyScoreText.y = display.contentHeight * 0.3

		ChunkandEddyIcon.x = display.contentWidth * 0.15
		ChunkandEddyIcon.y = display.contentHeight * 0.4

		ChunkandEddyScoreText.x = display.contentWidth * 0.15
		ChunkandEddyScoreText.y = display.contentHeight * 0.5

	elseif(chooserole[2] == true and chooserole[4] == true) then

		TrickyIcon.x = display.contentWidth * 0.15
		TrickyIcon.y = display.contentHeight * 0.2

		TrickyScoreText.x = display.contentWidth * 0.15
		TrickyScoreText.y = display.contentHeight * 0.3

		AshIcon.x = display.contentWidth * 0.15
		AshIcon.y = display.contentHeight * 0.4

		AshScoreText.x = display.contentWidth * 0.15
		AshScoreText.y = display.contentHeight * 0.5

	elseif(chooserole[3] == true and chooserole[4] == true) then

		ChunkandEddyIcon.x = display.contentWidth * 0.15
		ChunkandEddyIcon.y = display.contentHeight * 0.2

		ChunkandEddyScoreText.x = display.contentWidth * 0.15
		ChunkandEddyScoreText.y = display.contentHeight * 0.3

		AshIcon.x = display.contentWidth * 0.15
		AshIcon.y = display.contentHeight * 0.4

		AshScoreText.x = display.contentWidth * 0.15
		AshScoreText.y = display.contentHeight * 0.5

	
	end


	


	

	timer.performWithDelay( 500, GameTimecountdown,1)	

	--[[
	local iconData = { width=153, height=150, numFrames=1}
	local Dazyiconsheet1 = graphics.newImageSheet( "Image/Game/BallImage/bubu/bubu_01.png", iconData )
	local Dazyiconsheet2 = graphics.newImageSheet( "Image/Game/BallImage/bubu/bubu_02.png", iconData )
	local Dazyiconsheet3 = graphics.newImageSheet( "Image/Game/BallImage/bubu/bubu_03.png", iconData )

	local DazyiconSequenceData = {
                { name="Dazyiconseq1", sheet=Dazyiconsheet1, start=1, count=1, time=1000, loopCount=0 },
                { name="Dazyiconseq2", sheet=Dazyiconsheet2, start=1, count=1, time=1000, loopCount=0 },
                { name="Dazyiconseq3", sheet=Dazyiconsheet3, start=1, count=1, time=1000, loopCount=0 },
                }
    DazyAnimation = display.newSprite( Dazyiconsheet1, DazyiconSequenceData )
    DazyAnimation.x = display.contentWidth * 0.3
    DazyAnimation.y = display.contentHeight * 0.4
    DazyAnimation.isVisible = false
    sceneGroup:insert( DazyAnimation )

    local TrickyiconData = { width=215, height=215, numFrames=1}
	local Trickyiconsheet1 = graphics.newImageSheet( "Image/Game/BallImage/little/little_01.png", TrickyiconData )
	local Trickyiconsheet2 = graphics.newImageSheet( "Image/Game/BallImage/little/little_02.png", TrickyiconData )
	local Trickyiconsheet3 = graphics.newImageSheet( "Image/Game/BallImage/little/little_03.png", TrickyiconData )

	local TrickyiconSequenceData = {
                { name="Trickyiconseq1", sheet=Trickyiconsheet1, start=1, count=1, time=1000, loopCount=0 },
                { name="Trickyiconseq2", sheet=Trickyiconsheet2, start=1, count=1, time=1000, loopCount=0 },
                { name="Trickyiconseq3", sheet=Trickyiconsheet3, start=1, count=1, time=1000, loopCount=0 },
                }
    TrickyAnimation = display.newSprite( Trickyiconsheet1, TrickyiconSequenceData )
    TrickyAnimation.x = display.contentWidth * 0.3
    TrickyAnimation.y = display.contentHeight * 0.4
    TrickyAnimation.isVisible = false
    sceneGroup:insert( TrickyAnimation )


    local CandEiconsheet1 = graphics.newImageSheet( "Image/Game/BallImage/haha/haha_01.png", iconData )
	local CandEiconsheet2 = graphics.newImageSheet( "Image/Game/BallImage/haha/haha_02.png", iconData )
	local CandEiconsheet3 = graphics.newImageSheet( "Image/Game/BallImage/haha/haha_03.png", iconData )

	local CandEiconSequenceData = {
                { name="CandEiconseq1", sheet=CandEiconsheet1, start=1, count=1, time=1000, loopCount=0 },
                { name="CandEiconseq2", sheet=CandEiconsheet2, start=1, count=1, time=1000, loopCount=0 },
                { name="CandEiconseq3", sheet=CandEiconsheet3, start=1, count=1, time=1000, loopCount=0 },
                }
    CandEAnimation = display.newSprite( CandEiconsheet1, CandEiconSequenceData )
    CandEAnimation.x = display.contentWidth * 0.3
    CandEAnimation.y = display.contentHeight * 0.4
    CandEAnimation.isVisible = false
    sceneGroup:insert( CandEAnimation )

    local Ashiconsheet1 = graphics.newImageSheet( "Image/Game/BallImage/tall/tall_01.png", iconData )
	local Ashiconsheet2 = graphics.newImageSheet( "Image/Game/BallImage/tall/tall_02.png", iconData )
	local Ashiconsheet3 = graphics.newImageSheet( "Image/Game/BallImage/tall/tall_03.png", iconData )

	local AshiconSequenceData = {
                { name="Ashiconseq1", sheet=Ashiconsheet1, start=1, count=1, time=1000, loopCount=0 },
                { name="Ashiconseq2", sheet=Ashiconsheet2, start=1, count=1, time=1000, loopCount=0 },
                { name="Ashiconseq3", sheet=Ashiconsheet3, start=1, count=1, time=1000, loopCount=0 },
                }
    AshAnimation = display.newSprite( Ashiconsheet1, AshiconSequenceData )
    AshAnimation.x = display.contentWidth * 0.3
    AshAnimation.y = display.contentHeight * 0.4
    AshAnimation.isVisible = false
    sceneGroup:insert( AshAnimation )]]

	
end
function scene:show( event )
	local phase = event.phase

	if "did" == phase then
		print( "1: show event, phase did" )

		--[[if(chooserole[1] == true) then
			randomlocation(touchDazyIcon,1000,1000, touchDazyIcon.width * 0.8 / 2, touchDazyIcon.height * 0.8 / 2)
		end
		if(chooserole[2] == true) then
			randomlocation(touchTrickyIcon,1000,1000, touchTrickyIcon.width * 0.8 / 2, touchTrickyIcon.height * 0.8 / 2)
		end
		if(chooserole[3] == true) then
			randomlocation(touchChunkandEddyIcon,1000,1000, touchChunkandEddyIcon.width * 0.8 / 2, touchChunkandEddyIcon.height * 0.8 / 2)
		end
		if(chooserole[4] == true) then
			randomlocation(touchAshIcon,1000,1000, touchAshIcon.width * 0.8 / 2, touchAshIcon.height * 0.8 / 2)
		end]]
		
		--[[if(chooserole[1] == true and chooserole[2] == true and chooserole[3] == true and chooserole[4] == true) then
			--randomlocation2("Image/Game/BallImage/bubu/bubu.png","DazyIcon")


			randomlocation(touchDazyIcon,1000,1000, touchDazyIcon.width * 0.8 / 2, touchDazyIcon.height * 0.8 / 2)
			randomlocation(touchTrickyIcon,1000,1000, touchTrickyIcon.width * 0.8 / 2, touchTrickyIcon.height * 0.8 / 2)
			randomlocation(touchChunkandEddyIcon,1000,1000, touchChunkandEddyIcon.width * 0.8 / 2, touchChunkandEddyIcon.height * 0.8 / 2)
			randomlocation(touchAshIcon,1000,1000, touchAshIcon.width * 0.8 / 2, touchAshIcon.height * 0.8 / 2)
		
		elseif(chooserole[1] == true and chooserole[2] == true and chooserole[3] == true) then
			
			randomlocation(touchDazyIcon,1000,1000, touchDazyIcon.width * 0.8 / 2, touchDazyIcon.height * 0.8 / 2)
			randomlocation(touchTrickyIcon,1000,1000, touchTrickyIcon.width * 0.8 / 2, touchTrickyIcon.height * 0.8 / 2)
			randomlocation(touchChunkandEddyIcon,1000,1000, touchChunkandEddyIcon.width * 0.8 / 2, touchChunkandEddyIcon.height * 0.8 / 2)

		elseif(chooserole[1] == true and chooserole[2] == true and chooserole[4] == true) then

			randomlocation(touchDazyIcon,1000,1000, touchDazyIcon.width * 0.8 / 2, touchDazyIcon.height * 0.8 / 2)
			randomlocation(touchTrickyIcon,1000,1000, touchTrickyIcon.width * 0.8 / 2, touchTrickyIcon.height * 0.8 / 2)
			randomlocation(touchAshIcon,1000,1000, touchAshIcon.width * 0.8 / 2, touchAshIcon.height * 0.8 / 2)

		elseif(chooserole[1] == true and chooserole[3] == true and chooserole[4] == true) then

			randomlocation(touchDazyIcon,1000,1000, touchDazyIcon.width * 0.8 / 2, touchDazyIcon.height * 0.8 / 2)
			randomlocation(touchChunkandEddyIcon,1000,1000, touchChunkandEddyIcon.width * 0.8 / 2, touchChunkandEddyIcon.height * 0.8 / 2)
			randomlocation(touchAshIcon,1000,1000, touchAshIcon.width * 0.8 / 2, touchAshIcon.height * 0.8 / 2)

		elseif(chooserole[2] == true and chooserole[3] == true and chooserole[4] == true) then

			randomlocation(touchTrickyIcon,1000,1000, touchTrickyIcon.width * 0.8 / 2, touchTrickyIcon.height * 0.8 / 2)
			randomlocation(touchChunkandEddyIcon,1000,1000, touchChunkandEddyIcon.width * 0.8 / 2, touchChunkandEddyIcon.height * 0.8 / 2)
			randomlocation(touchAshIcon,1000,1000, touchAshIcon.width * 0.8 / 2, touchAshIcon.height * 0.8 / 2)

		elseif(chooserole[1] == true and chooserole[2] == true) then

			randomlocation(touchDazyIcon,1000,1000, touchDazyIcon.width * 0.8 / 2, touchDazyIcon.height * 0.8 / 2)
			randomlocation(touchTrickyIcon,1000,1000, touchTrickyIcon.width * 0.8 / 2, touchTrickyIcon.height * 0.8 / 2)

		elseif(chooserole[1] == true and chooserole[3] == true) then

			randomlocation(touchDazyIcon,1000,1000, touchDazyIcon.width * 0.8 / 2, touchDazyIcon.height * 0.8 / 2)
			randomlocation(touchChunkandEddyIcon,1000,1000, touchChunkandEddyIcon.width * 0.8 / 2, touchChunkandEddyIcon.height * 0.8 / 2)

		elseif(chooserole[1] == true and chooserole[4] == true) then

			randomlocation(touchDazyIcon,1000,1000, touchDazyIcon.width * 0.8 / 2, touchDazyIcon.height * 0.8 / 2)
			randomlocation(touchAshIcon,1000,1000, touchAshIcon.width * 0.8 / 2, touchAshIcon.height * 0.8 / 2)

		elseif(chooserole[2] == true and chooserole[3] == true) then

			randomlocation(touchTrickyIcon,1000,1000, touchTrickyIcon.width * 0.8 / 2, touchTrickyIcon.height * 0.8 / 2)
			randomlocation(touchChunkandEddyIcon,1000,1000, touchChunkandEddyIcon.width * 0.8 / 2, touchChunkandEddyIcon.height * 0.8 / 2)

		elseif(chooserole[2] == true and chooserole[4] == true) then

			randomlocation(touchTrickyIcon,1000,1000, touchTrickyIcon.width * 0.8 / 2, touchTrickyIcon.height * 0.8 / 2)
			randomlocation(touchAshIcon,1000,1000, touchAshIcon.width * 0.8 / 2, touchAshIcon.height * 0.8 / 2)

		elseif(chooserole[3] == true and chooserole[4] == true) then

			randomlocation(touchChunkandEddyIcon,1000,1000, touchChunkandEddyIcon.width * 0.8 / 2, touchChunkandEddyIcon.height * 0.8 / 2)
			randomlocation(touchAshIcon,1000,1000, touchAshIcon.width * 0.8 / 2, touchAshIcon.height * 0.8 / 2)

		elseif(chooserole[1] == true) then
			randomlocation(touchDazyIcon,1000,1000, touchDazyIcon.width * 0.8 / 2, touchDazyIcon.height * 0.8 / 2)
		
		elseif(chooserole[2] == true) then
			randomlocation(touchTrickyIcon,1000,1000, touchTrickyIcon.width * 0.8 / 2, touchTrickyIcon.height * 0.8 / 2)
		elseif(chooserole[3] == true) then
			randomlocation(touchChunkandEddyIcon,1000,1000, touchChunkandEddyIcon.width * 0.8 / 2, touchChunkandEddyIcon.height * 0.8 / 2)
		elseif(chooserole[4] == true) then
			randomlocation(touchAshIcon,1000,1000, touchAshIcon.width * 0.8 / 2, touchAshIcon.height * 0.8 / 2)
		
		end]]



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





