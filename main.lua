-----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------

-- Your code here

local composer = require( "composer" )
composer.setVariable( "lang", "EN" )
--到遊戲主畫面
composer.gotoScene( "Scenes.Game1_fingerfighting", frad,400)