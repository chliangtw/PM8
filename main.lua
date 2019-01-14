-----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------

-- Your code here
local composer = require( "composer" )
display.setStatusBar(display.HiddenStatusBar)
composer.setVariable( "lang", "Taiwan" )
--到遊戲主畫面
composer.gotoScene( "Scenes.Showrule_Scene", frad,400)

--[[ 
	 Japan 日本 01
	 Korea 韓國 02
	 China 中國 03
	 Spain 西班牙 04
	 Taiwan 台灣 05
	 America 美國 06
	 France 法國 07
	 Germany 德國 08
	 Malaysia 馬來西亞 09
	 Russia 俄羅斯 10
	 Vientnames 越南 11
	 Dutch 荷蘭 12
	 Italy 義大利 13
]]--
