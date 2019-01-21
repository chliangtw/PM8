--MainMenu_America.lua
local widget= require("widget")
local composer = require( "composer" )
local scene = composer.newScene()
local sceneGroup 
local LanguagesetText
local ConfirmButton
local scrollView
local scrollViewcontent_x, scrollViewcontent_y 
local totalpageText,currentpageText 
local currentpage = "1"
local Character1Image
local AmericalangButton,ChinalangButton,TaiwanlangButton,KorealangButton,JapanlangButton,SpainlangButton,
FrancelangButton,dnlangButton,RussialangButton,GermanylangButton,IDlangButton,
VientnameslangButton,ItalylangButton
local lang = composer.getVariable( "lang" )
local airplaneImage = display.newImage( "Image/Languages/lang_airplain.png" )

function createbutton(image,buttonobj,B_x,B_y)
	display.remove( buttonobj )
	buttonobj = widget.newButton(
    {
        
        defaultFile = image,
        onEvent = AmericalangButtonEvent
    }
    )
    buttonobj.x = B_x
	buttonobj.y = B_y
	scrollView:insert( buttonobj )
end

function createlangbutton( ... )

	display.remove( AmericalangButton )
	--Language: America
	AmericalangButton = widget.newButton(
    {
        
        defaultFile = "Image/Languages/Lang/lang_0601.png",
        onEvent = AmericalangButtonEvent
    }
    )
    AmericalangButton.x = display.contentWidth * 0.15
	AmericalangButton.y = display.contentHeight * 0.38
	scrollView:insert( AmericalangButton )
	
	display.remove( ChinalangButton )
	--Language: China
	ChinalangButton = widget.newButton(
    {
        
        defaultFile = "Image/Languages/Lang/lang_0301.png",
        onEvent = ChinalangButtonEvent
    }
    )
    ChinalangButton.x = display.contentWidth * 0.29
	ChinalangButton.y = display.contentHeight * 0.25
	scrollView:insert( ChinalangButton )

	display.remove( TaiwanlangButton )
	--Language: Taiwan
	TaiwanlangButton = widget.newButton(
    {
        
        defaultFile = "Image/Languages/Lang/lang_0501.png",
        onEvent = TaiwanlangButtonEvent
    }
    )
    TaiwanlangButton.x = display.contentWidth * 0.43
	TaiwanlangButton.y = display.contentHeight * 0.42
	scrollView:insert( TaiwanlangButton )

	display.remove( KorealangButton )
	--Language: Korea
	KorealangButton = widget.newButton(
    {
        
        defaultFile = "Image/Languages/Lang/lang_0201.png",
        onEvent = KorealangButtonEvent
    }
    )
    KorealangButton.x = display.contentWidth * 0.47
	KorealangButton.y = display.contentHeight * 0.18
	scrollView:insert( KorealangButton )
	
	display.remove( JapanlangButton )
	--Language: Japan
	JapanlangButton = widget.newButton(
    {
        
        defaultFile = "Image/Languages/Lang/lang_0101.png",
        onEvent = JapanlangButtonEvent
    }
    )
    JapanlangButton.x = display.contentWidth * 0.77
	JapanlangButton.y = display.contentHeight * 0.25
	scrollView:insert( JapanlangButton )

	display.remove( SpainlangButton )
	--Language: Spain
	SpainlangButton = widget.newButton(
    {
        
        defaultFile = "Image/Languages/Lang/lang_0401.png",
        onEvent = SpainlangButtonEvent
    }
    )
    SpainlangButton.x = display.contentWidth * 0.77
	SpainlangButton.y = display.contentHeight * 0.38
	scrollView:insert( SpainlangButton )

	display.remove( FrancelangButton )
	--Language: France
	FrancelangButton = widget.newButton(
    {
        
        defaultFile = "Image/Languages/Lang/lang_0701.png",
        onEvent = FrancelangButtonEvent
    }
    )
    FrancelangButton.x = display.contentWidth * 0.6
	FrancelangButton.y = display.contentHeight * 0.5
	scrollView:insert( FrancelangButton )

	display.remove( dnlangButton )
	--Language: dn
	dnlangButton = widget.newButton(
    {
        
        defaultFile = "Image/Languages/Lang/lang_1201.png",
        onEvent = dnlangButtonEvent
    }
    )
    dnlangButton.x = display.contentWidth * 1.22
	dnlangButton.y = display.contentHeight * 0.35
	scrollView:insert( dnlangButton )


	display.remove( RussialangButton )
	--Language: Russia
	RussialangButton = widget.newButton(
    {
        
        defaultFile = "Image/Languages/Lang/lang_1001.png",
        onEvent = RussialangButtonEvent
    }
    )
    RussialangButton.x = display.contentWidth * 1.28
	RussialangButton.y = display.contentHeight * 0.2
	scrollView:insert( RussialangButton )

	display.remove( GermanylangButton )
	--Language: Germany
	GermanylangButton = widget.newButton(
    {
        
        defaultFile = "Image/Languages/Lang/lang_0801.png",
        onEvent = GermanylangButtonEvent
    }
    )
    GermanylangButton.x = display.contentWidth * 1.6
	GermanylangButton.y = display.contentHeight * 0.12
	scrollView:insert( GermanylangButton )

	display.remove( IDlangButton )
	--Language: Indonesia
	IDlangButton = widget.newButton(
    {
        
        defaultFile = "Image/Languages/Lang/lang_0901.png",
        onEvent = IDlangButtonEvent
    }
    )
    IDlangButton.x = display.contentWidth * 1.8
	IDlangButton.y = display.contentHeight * 0.22
	scrollView:insert( IDlangButton )

	display.remove( VientnameslangButton )
	--Language: Vientnames
	VientnameslangButton = widget.newButton(
    {
        
        defaultFile = "Image/Languages/Lang/lang_1101.png",
        onEvent = VientnameslangButtonEvent
    }
    )
    VientnameslangButton.x = display.contentWidth * 1.6
	VientnameslangButton.y = display.contentHeight * 0.38
	scrollView:insert( VientnameslangButton )

	display.remove( ItalylangButton )
	--Language: Italy
	ItalylangButton = widget.newButton(
    {
        width = 100,
        height = 60,
        defaultFile = "Image/Languages/Lang/lang_1301.png",
        onEvent = ItalylangButtonEvent
    }
    )
    ItalylangButton.x = display.contentWidth * 1.75
	ItalylangButton.y = display.contentHeight * 0.5
	scrollView:insert( ItalylangButton )
end

function AmericalangButtonEvent( ... )
	createlangbutton()
	lang = "America"
	display.remove( AmericalangButton )
	--createbutton("Image/Languages/Lang/lang_0602.png",AmericalangButton,display.contentWidth * 0.15,display.contentHeight * 0.38)
	AmericalangButton = widget.newButton(
	{
	    
	    defaultFile = "Image/Languages/Lang/lang_0602.png",
	    onEvent = AmericalangButtonEvent
	}
	)
	AmericalangButton.x = display.contentWidth * 0.15
	AmericalangButton.y = display.contentHeight * 0.38
	scrollView:insert( AmericalangButton )

	--設定飛機圖示位置
	airplaneImage.x = display.contentWidth * 0.12
	airplaneImage.y = display.contentHeight * 0.3
	scrollView:insert( airplaneImage )

	display.remove(LanguagesetText)
	LanguagesetText = display.newImage( "Image/Languages/Title/langn06.png" )
	LanguagesetText.x = display.contentWidth * 0.65
	LanguagesetText.y = display.contentHeight * 0.14
	sceneGroup:insert( LanguagesetText )

	display.remove(ConfirmButton)
	ConfirmButton = widget.newButton(
    {
        
        defaultFile = "Image/Languages/Done/done06.png",
        onEvent = ConfirmButtonEvent
    }
    )
    ConfirmButton.x = display.contentWidth * 0.82
	ConfirmButton.y = display.contentHeight * 0.93
	sceneGroup:insert( ConfirmButton )
end

function ChinalangButtonEvent ( ... )

	createlangbutton()
	lang = "China"
	display.remove( ChinalangButton )
	--createbutton("Image/Languages/Lang/lang_0302.png",ChinalangButton,display.contentWidth * 0.29,display.contentHeight * 0.25)
	ChinalangButton = widget.newButton(
    {
        
        defaultFile = "Image/Languages/Lang/lang_0302.png",
        onEvent = ChinalangButtonEvent
    }
    )
    ChinalangButton.x = display.contentWidth * 0.29
	ChinalangButton.y = display.contentHeight * 0.25
	scrollView:insert( ChinalangButton )

	airplaneImage.x = display.contentWidth * 0.23
	airplaneImage.y = display.contentHeight * 0.13
	scrollView:insert( airplaneImage )

	display.remove(LanguagesetText)
	LanguagesetText = display.newImage( "Image/Languages/Title/langn03.png" )
	LanguagesetText.x = display.contentWidth * 0.65
	LanguagesetText.y = display.contentHeight * 0.14
	sceneGroup:insert( LanguagesetText )

	display.remove(ConfirmButton)
	ConfirmButton = widget.newButton(
    {
        
        defaultFile = "Image/Languages/Done/done03.png",
        onEvent = ConfirmButtonEvent
    }
    )
    ConfirmButton.x = display.contentWidth * 0.82
	ConfirmButton.y = display.contentHeight * 0.93
	sceneGroup:insert( ConfirmButton )
end

function TaiwanlangButtonEvent( ... )

	createlangbutton()
	lang = "Taiwan"
	display.remove( TaiwanlangButton )
	TaiwanlangButton = widget.newButton(
    {
        
        defaultFile = "Image/Languages/Lang/lang_0502.png",
        onEvent = TaiwanlangButtonEvent
    }
    )
    TaiwanlangButton.x = display.contentWidth * 0.43
	TaiwanlangButton.y = display.contentHeight * 0.42
	scrollView:insert( TaiwanlangButton )

	airplaneImage.x = display.contentWidth * 0.45
	airplaneImage.y = display.contentHeight * 0.36
	scrollView:insert( airplaneImage )

	display.remove(LanguagesetText)
	LanguagesetText = display.newImage( "Image/Languages/Title/langn01.png" )
	LanguagesetText.x = display.contentWidth * 0.65
	LanguagesetText.y = display.contentHeight * 0.14
	sceneGroup:insert( LanguagesetText )

	display.remove(ConfirmButton)
	ConfirmButton = widget.newButton(
    {
        
        defaultFile = "Image/Languages/Done/done05.png",
        onEvent = ConfirmButtonEvent
    }
    )
    ConfirmButton.x = display.contentWidth * 0.82
	ConfirmButton.y = display.contentHeight * 0.93
	sceneGroup:insert( ConfirmButton )
end

function KorealangButtonEvent( ... )

	createlangbutton()
	lang = "Korea"
	display.remove( KorealangButton )
	--Language: Korea
	KorealangButton = widget.newButton(
    {
        
        defaultFile = "Image/Languages/Lang/lang_0202.png",
        onEvent = KorealangButtonEvent
    }
    )
    KorealangButton.x = display.contentWidth * 0.47
	KorealangButton.y = display.contentHeight * 0.18
	scrollView:insert( KorealangButton )

	airplaneImage.x = display.contentWidth * 0.6
	airplaneImage.y = display.contentHeight * 0.1
	scrollView:insert( airplaneImage )

	display.remove(LanguagesetText)
	LanguagesetText = display.newImage( "Image/Languages/Title/langn02.png" )
	LanguagesetText.x = display.contentWidth * 0.65
	LanguagesetText.y = display.contentHeight * 0.14
	sceneGroup:insert( LanguagesetText )

	display.remove(ConfirmButton)
	ConfirmButton = widget.newButton(
    {
        
        defaultFile = "Image/Languages/Done/done02.png",
        onEvent = ConfirmButtonEvent
    }
    )
    ConfirmButton.x = display.contentWidth * 0.82
	ConfirmButton.y = display.contentHeight * 0.93
	sceneGroup:insert( ConfirmButton )
end

function JapanlangButtonEvent( ... )

	createlangbutton()
	lang = "Japan"
	display.remove( JapanlangButton )
	--Language: Japan
	JapanlangButton = widget.newButton(
    {
        
        defaultFile = "Image/Languages/Lang/lang_0102.png",
        onEvent = JapanlangButtonEvent
    }
    )
    JapanlangButton.x = display.contentWidth * 0.77
	JapanlangButton.y = display.contentHeight * 0.25
	scrollView:insert( JapanlangButton )

	airplaneImage.x = display.contentWidth * 0.89
	airplaneImage.y = display.contentHeight * 0.14
	scrollView:insert( airplaneImage )

	display.remove(LanguagesetText)
	LanguagesetText = display.newImage( "Image/Languages/Title/langn01.png" )
	LanguagesetText.x = display.contentWidth * 0.65
	LanguagesetText.y = display.contentHeight * 0.14
	sceneGroup:insert( LanguagesetText )

	display.remove(ConfirmButton)
	ConfirmButton = widget.newButton(
    {
        
        defaultFile = "Image/Languages/Done/done01.png",
        onEvent = ConfirmButtonEvent
    }
    )
    ConfirmButton.x = display.contentWidth * 0.82
	ConfirmButton.y = display.contentHeight * 0.93
	sceneGroup:insert( ConfirmButton )
end

function SpainlangButtonEvent( ... )

	createlangbutton()
	display.remove( SpainlangButton )
	lang = "Spain"
	--Language: Spain
	SpainlangButton = widget.newButton(
    {
        
        defaultFile = "Image/Languages/Lang/lang_0402.png",
        onEvent = SpainlangButtonEvent
    }
    )
    SpainlangButton.x = display.contentWidth * 0.77
	SpainlangButton.y = display.contentHeight * 0.38
	scrollView:insert( SpainlangButton )

	airplaneImage.x = display.contentWidth * 0.85
	airplaneImage.y = display.contentHeight * 0.43
	scrollView:insert( airplaneImage )

	display.remove(LanguagesetText)
	LanguagesetText = display.newImage( "Image/Languages/Title/langn04.png" )
	LanguagesetText.x = display.contentWidth * 0.65
	LanguagesetText.y = display.contentHeight * 0.14
	sceneGroup:insert( LanguagesetText )

	display.remove(ConfirmButton)
	ConfirmButton = widget.newButton(
    {
        
        defaultFile = "Image/Languages/Done/done04.png",
        onEvent = ConfirmButtonEvent
    }
    )
    ConfirmButton.x = display.contentWidth * 0.82
	ConfirmButton.y = display.contentHeight * 0.93
	sceneGroup:insert( ConfirmButton )
end

function FrancelangButtonEvent( ... )

	createlangbutton()
	display.remove( FrancelangButton )
	lang = "France"
	--Language: France
	FrancelangButton = widget.newButton(
	{
	    
	    defaultFile = "Image/Languages/Lang/lang_0702.png",
	    onEvent = FrancelangButtonEvent
	}
	)
	FrancelangButton.x = display.contentWidth * 0.6
	FrancelangButton.y = display.contentHeight * 0.5
	scrollView:insert( FrancelangButton )

	airplaneImage.x = display.contentWidth * 0.75
	airplaneImage.y = display.contentHeight * 0.58
	scrollView:insert( airplaneImage )

	display.remove(LanguagesetText)
	LanguagesetText = display.newImage( "Image/Languages/Title/langn07.png" )
	LanguagesetText.x = display.contentWidth * 0.65
	LanguagesetText.y = display.contentHeight * 0.14
	sceneGroup:insert( LanguagesetText )

	display.remove(ConfirmButton)
	ConfirmButton = widget.newButton(
    {
        
        defaultFile = "Image/Languages/Done/done07.png",
        onEvent = ConfirmButtonEvent
    }
    )
    ConfirmButton.x = display.contentWidth * 0.82
	ConfirmButton.y = display.contentHeight * 0.93
	sceneGroup:insert( ConfirmButton )
end

function dnlangButtonEvent( ... )

	createlangbutton()
	display.remove( dnlangButton )
	lang = "Dutch"
	dnlangButton = widget.newButton(
    {
        
        defaultFile = "Image/Languages/Lang/lang_1202.png",
        onEvent = dnlangButtonEvent
    }
    )
    dnlangButton.x = display.contentWidth * 1.22
	dnlangButton.y = display.contentHeight * 0.35
	scrollView:insert( dnlangButton )

	airplaneImage.x = display.contentWidth * 1.17
	airplaneImage.y = display.contentHeight * 0.27
	scrollView:insert( airplaneImage )

	display.remove(LanguagesetText)
	LanguagesetText = display.newImage( "Image/Languages/Title/langn12.png" )
	LanguagesetText.x = display.contentWidth * 0.65
	LanguagesetText.y = display.contentHeight * 0.14
	sceneGroup:insert( LanguagesetText )

	display.remove(ConfirmButton)
	ConfirmButton = widget.newButton(
    {
        
        defaultFile = "Image/Languages/Done/done12.png",
        onEvent = ConfirmButtonEvent
    }
    )
    ConfirmButton.x = display.contentWidth * 0.82
	ConfirmButton.y = display.contentHeight * 0.93
	sceneGroup:insert( ConfirmButton )
end

function RussialangButtonEvent( ... )
	
	createlangbutton()
	display.remove( RussialangButton )
	lang = "Russia"
	--Language: Russia
	RussialangButton = widget.newButton(
    {
        
        defaultFile = "Image/Languages/Lang/lang_1002.png",
        onEvent = RussialangButtonEvent
    }
    )
    RussialangButton.x = display.contentWidth * 1.28
	RussialangButton.y = display.contentHeight * 0.2
	scrollView:insert( RussialangButton )

	airplaneImage.x = display.contentWidth * 1.31
	airplaneImage.y = display.contentHeight * 0.08
	scrollView:insert( airplaneImage )

	display.remove(LanguagesetText)
	LanguagesetText = display.newImage( "Image/Languages/Title/langn10.png" )
	LanguagesetText.x = display.contentWidth * 0.65
	LanguagesetText.y = display.contentHeight * 0.14
	sceneGroup:insert( LanguagesetText )

	display.remove(ConfirmButton)
	ConfirmButton = widget.newButton(
    {
        
        defaultFile = "Image/Languages/Done/done10.png",
        onEvent = ConfirmButtonEvent
    }
    )
    ConfirmButton.x = display.contentWidth * 0.82
	ConfirmButton.y = display.contentHeight * 0.93
	sceneGroup:insert( ConfirmButton )
end

function GermanylangButtonEvent( ... )

	createlangbutton()
	display.remove( GermanylangButton )
	lang = "Germany"
	--Language: Germany
	GermanylangButton = widget.newButton(
    {
        
        defaultFile = "Image/Languages/Lang/lang_0802.png",
        onEvent = GermanylangButtonEvent
    }
    )
    GermanylangButton.x = display.contentWidth * 1.6
	GermanylangButton.y = display.contentHeight * 0.12
	scrollView:insert( GermanylangButton )

	airplaneImage.x = display.contentWidth * 1.45
	airplaneImage.y = display.contentHeight * 0.15
	scrollView:insert( airplaneImage )

	display.remove(LanguagesetText)
	LanguagesetText = display.newImage( "Image/Languages/Title/langn08.png" )
	LanguagesetText.x = display.contentWidth * 0.65
	LanguagesetText.y = display.contentHeight * 0.14
	sceneGroup:insert( LanguagesetText )

	display.remove(ConfirmButton)
	ConfirmButton = widget.newButton(
    {
        
        defaultFile = "Image/Languages/Done/done08.png",
        onEvent = ConfirmButtonEvent
    }
    )
    ConfirmButton.x = display.contentWidth * 0.82
	ConfirmButton.y = display.contentHeight * 0.93
	sceneGroup:insert( ConfirmButton )
end

function IDlangButtonEvent( ... )

	createlangbutton()
	display.remove( IDlangButton )
	--Language: Indonesia
	lang = "Malaysia"
	IDlangButton = widget.newButton(
    {
        
        defaultFile = "Image/Languages/Lang/lang_0902.png",
        onEvent = IDlangButtonEvent
    }
    )
    IDlangButton.x = display.contentWidth * 1.8
	IDlangButton.y = display.contentHeight * 0.22
	scrollView:insert( IDlangButton )

	airplaneImage.x = display.contentWidth * 1.95
	airplaneImage.y = display.contentHeight * 0.12
	scrollView:insert( airplaneImage )

	display.remove(LanguagesetText)
	LanguagesetText = display.newImage( "Image/Languages/Title/langn09.png" )
	LanguagesetText.x = display.contentWidth * 0.65
	LanguagesetText.y = display.contentHeight * 0.14
	sceneGroup:insert( LanguagesetText )

	display.remove(ConfirmButton)
	ConfirmButton = widget.newButton(
    {
        
        defaultFile = "Image/Languages/Done/done09.png",
        onEvent = ConfirmButtonEvent
    }
    )
    ConfirmButton.x = display.contentWidth * 0.82
	ConfirmButton.y = display.contentHeight * 0.93
	sceneGroup:insert( ConfirmButton )
end

function VientnameslangButtonEvent( ... )

	createlangbutton()
	display.remove( VientnameslangButton )
	lang = "Vientnames"
	--Language: Vientnames
	VientnameslangButton = widget.newButton(
    {
        
        defaultFile = "Image/Languages/Lang/lang_1102.png",
        onEvent = VientnameslangButtonEvent
    }
    )
    VientnameslangButton.x = display.contentWidth * 1.6
	VientnameslangButton.y = display.contentHeight * 0.38
	scrollView:insert( VientnameslangButton )

	airplaneImage.x = display.contentWidth * 1.75
	airplaneImage.y = display.contentHeight * 0.33
	scrollView:insert( airplaneImage )

	display.remove(LanguagesetText)
	LanguagesetText = display.newImage( "Image/Languages/Title/langn11.png" )
	LanguagesetText.x = display.contentWidth * 0.65
	LanguagesetText.y = display.contentHeight * 0.14
	sceneGroup:insert( LanguagesetText )

	display.remove(ConfirmButton)
	ConfirmButton = widget.newButton(
    {
        
        defaultFile = "Image/Languages/Done/done11.png",
        onEvent = ConfirmButtonEvent
    }
    )
    ConfirmButton.x = display.contentWidth * 0.82
	ConfirmButton.y = display.contentHeight * 0.93
	sceneGroup:insert( ConfirmButton )
end

function ItalylangButtonEvent( ... )

	createlangbutton()
	display.remove( ItalylangButton )
	lang = "Italy"
	--Language: Italy
	ItalylangButton = widget.newButton(
    {
        width = 100,
        height = 60,
        defaultFile = "Image/Languages/Lang/lang_1302.png",
        onEvent = ItalylangButtonEvent
    }
    )
    ItalylangButton.x = display.contentWidth * 1.75
	ItalylangButton.y = display.contentHeight * 0.5
	scrollView:insert( ItalylangButton )

	airplaneImage.x = display.contentWidth * 1.65
	airplaneImage.y = display.contentHeight * 0.55
	scrollView:insert( airplaneImage )

	display.remove(LanguagesetText)
	LanguagesetText = display.newImage( "Image/Languages/Title/langn13.png" )
	LanguagesetText.x = display.contentWidth * 0.65
	LanguagesetText.y = display.contentHeight * 0.14
	sceneGroup:insert( LanguagesetText )

	display.remove(ConfirmButton)
	ConfirmButton = widget.newButton(
    {
        
        defaultFile = "Image/Languages/Done/done13.png",
        onEvent = ConfirmButtonEvent
    }
    )
    ConfirmButton.x = display.contentWidth * 0.82
	ConfirmButton.y = display.contentHeight * 0.93
	sceneGroup:insert( ConfirmButton )
end

function ConfirmButtonEvent( ... )
	composer.gotoScene( "Scenes.MainMenu.MainMenu_America", frad,400)
end

function scene:create( event )
	sceneGroup = self.view
	
	--背景圖片
	local backgrounkImage = display.newImage( "Image/Languages/lang_back.jpg" )
	backgrounkImage.x = display.contentCenterX
	backgrounkImage.y = display.contentCenterY
	sceneGroup:insert( backgrounkImage )

	--語言設定文字
	LanguagesetText = display.newImage( "Image/Languages/Title/langn06.png" )
	LanguagesetText.x = display.contentWidth * 0.65
	LanguagesetText.y = display.contentHeight * 0.14
	sceneGroup:insert( LanguagesetText )


	--確認按鈕
	ConfirmButton = widget.newButton(
    {
        
        defaultFile = "Image/Languages/Done/done06.png",
        onEvent = ConfirmButtonEvent
    }
    )
    ConfirmButton.x = display.contentWidth * 0.82
	ConfirmButton.y = display.contentHeight * 0.93
	sceneGroup:insert( ConfirmButton )



	--scrollView
	scrollView = widget.newScrollView {
		width = display.contentWidth,
		height = display.contentHeight * 0.76,
		hideBackground = true,
		backgroundColor =  { 0.8, 0.8, 0.8 },
		--isBounceEnabled = false,
		horizontalScrollDisabled = false,
		verticalScrollDisabled = true,
		listener = scrollListener
	}
	scrollView.x = display.contentWidth * 0.5
	scrollView.y = display.contentHeight * 0.62
	scrollView:setScrollWidth( display.contentWidth * 2 )
	scrollView:setScrollHeight( 100 )
	sceneGroup:insert( scrollView )

	

	--總頁碼(數)顯示
	totalpageText = display.newText( "2", 0, 0, native.systemFont, 24 )
	totalpageText.x = display.contentWidth * 0.97
	totalpageText.y = display.contentHeight * 0.79
	totalpageText:setFillColor( 153/255, 0, 0 )
	sceneGroup:insert( totalpageText )

	--單前頁碼(數)顯示
	currentpageText = display.newText( currentpage, 0, 0, native.systemFont, 24 )
	currentpageText.x = display.contentWidth * 0.86
	currentpageText.y = display.contentHeight * 0.79
	currentpageText:setFillColor( 153/255, 0, 0 )
	sceneGroup:insert( currentpageText )

	--角色圖片
	Character1Image = display.newImage( "Image/Languages/Lang/lang_Little.png" )
	Character1Image.x = display.contentWidth * 0.3
	Character1Image.y = display.contentHeight * 0.6
	scrollView:insert( Character1Image )

	local Character2Image = display.newImage( "Image/Languages/Lang/lang_Tall.png" )
	Character2Image.x = display.contentWidth * 1.4
	Character2Image.y = display.contentHeight * 0.6
	scrollView:insert( Character2Image )

	


	--語言選擇按鈕
	--Language: America
	AmericalangButton = widget.newButton(
    {
        
        defaultFile = "Image/Languages/Lang/lang_0601.png",
        onEvent = AmericalangButtonEvent
    }
    )
    AmericalangButton.x = display.contentWidth * 0.15
	AmericalangButton.y = display.contentHeight * 0.38
	scrollView:insert( AmericalangButton )
	
	--Language: China
	ChinalangButton = widget.newButton(
    {
        
        defaultFile = "Image/Languages/Lang/lang_0301.png",
        onEvent = ChinalangButtonEvent
    }
    )
    ChinalangButton.x = display.contentWidth * 0.29
	ChinalangButton.y = display.contentHeight * 0.25
	scrollView:insert( ChinalangButton )


	--Language: Taiwan
	TaiwanlangButton = widget.newButton(
    {
        
        defaultFile = "Image/Languages/Lang/lang_0501.png",
        onEvent = TaiwanlangButtonEvent
    }
    )
    TaiwanlangButton.x = display.contentWidth * 0.43
	TaiwanlangButton.y = display.contentHeight * 0.42
	scrollView:insert( TaiwanlangButton )


	--Language: Korea
	KorealangButton = widget.newButton(
    {
        
        defaultFile = "Image/Languages/Lang/lang_0201.png",
        onEvent = KorealangButtonEvent
    }
    )
    KorealangButton.x = display.contentWidth * 0.47
	KorealangButton.y = display.contentHeight * 0.18
	scrollView:insert( KorealangButton )
	

	--Language: Japan
	JapanlangButton = widget.newButton(
    {
        
        defaultFile = "Image/Languages/Lang/lang_0101.png",
        onEvent = JapanlangButtonEvent
    }
    )
    JapanlangButton.x = display.contentWidth * 0.77
	JapanlangButton.y = display.contentHeight * 0.25
	scrollView:insert( JapanlangButton )


	--Language: Spain
	SpainlangButton = widget.newButton(
    {
        
        defaultFile = "Image/Languages/Lang/lang_0401.png",
        onEvent = SpainlangButtonEvent
    }
    )
    SpainlangButton.x = display.contentWidth * 0.77
	SpainlangButton.y = display.contentHeight * 0.38
	scrollView:insert( SpainlangButton )


	--Language: France
	FrancelangButton = widget.newButton(
    {
        
        defaultFile = "Image/Languages/Lang/lang_0701.png",
        onEvent = FrancelangButtonEvent
    }
    )
    FrancelangButton.x = display.contentWidth * 0.6
	FrancelangButton.y = display.contentHeight * 0.5
	scrollView:insert( FrancelangButton )


	--Language: Dutch
	dnlangButton = widget.newButton(
    {
        
        defaultFile = "Image/Languages/Lang/lang_1201.png",
        onEvent = dnlangButtonEvent
    }
    )
    dnlangButton.x = display.contentWidth * 1.22
	dnlangButton.y = display.contentHeight * 0.35
	scrollView:insert( dnlangButton )



	--Language: Russia
	RussialangButton = widget.newButton(
    {
        
        defaultFile = "Image/Languages/Lang/lang_1001.png",
        onEvent = RussialangButtonEvent
    }
    )
    RussialangButton.x = display.contentWidth * 1.28
	RussialangButton.y = display.contentHeight * 0.2
	scrollView:insert( RussialangButton )


	--Language: Germany
	GermanylangButton = widget.newButton(
    {
        
        defaultFile = "Image/Languages/Lang/lang_0801.png",
        onEvent = GermanylangButtonEvent
    }
    )
    GermanylangButton.x = display.contentWidth * 1.6
	GermanylangButton.y = display.contentHeight * 0.12
	scrollView:insert( GermanylangButton )


	--Language: Malaysia
	IDlangButton = widget.newButton(
    {
        
        defaultFile = "Image/Languages/Lang/lang_0901.png",
        onEvent = IDlangButtonEvent
    }
    )
    IDlangButton.x = display.contentWidth * 1.8
	IDlangButton.y = display.contentHeight * 0.22
	scrollView:insert( IDlangButton )


	--Language: Vientnames
	VientnameslangButton = widget.newButton(
    {
        
        defaultFile = "Image/Languages/Lang/lang_1101.png",
        onEvent = VientnameslangButtonEvent
    }
    )
    VientnameslangButton.x = display.contentWidth * 1.6
	VientnameslangButton.y = display.contentHeight * 0.38
	scrollView:insert( VientnameslangButton )


	--Language: Italy
	ItalylangButton = widget.newButton(
    {
        width = 100,
        height = 60,
        defaultFile = "Image/Languages/Lang/lang_1301.png",
        onEvent = ItalylangButtonEvent
    }
    )
    ItalylangButton.x = display.contentWidth * 1.75
	ItalylangButton.y = display.contentHeight * 0.5
	scrollView:insert( ItalylangButton )



	--箭頭動畫
	local arrowimage_L = graphics.newImageSheet( "Image/Languages/arrow_L.png", { width=45, height=30, numFrames=4 } )
	local Animation1 = display.newSprite( arrowimage_L, { name="arrow_L", start=1, count=2, time=900 } )
	Animation1.x = display.contentWidth * 0.9
	Animation1.y = display.contentHeight * 0.45
	Animation1:play()
	scrollView:insert( Animation1 )

	local arrowimage_R = graphics.newImageSheet( "Image/Languages/arrow_R.png", { width=45, height=30, numFrames=4 } )
	local Animation2 = display.newSprite( arrowimage_R, { name="arrow_R", start=1, count=2, time=900 } )
	Animation2.x = display.contentWidth * 1.19
	Animation2.y = display.contentHeight * 0.45
	Animation2:play()
	scrollView:insert( Animation2 )


	end


function scene:show( event )

	local phase = event.phase



	if "will" == phase then

		--按鈕圖片更換已選擇的語言
		if lang == "America" then
			composer.removeScene( "Scenes.MainMenu.MainMenu_America" )
			display.remove( AmericalangButton )
			--createbutton("Image/Languages/Lang/lang_0602.png",AmericalangButton,display.contentWidth * 0.15,display.contentHeight * 0.38)
			AmericalangButton = widget.newButton(
			{
			    
			    defaultFile = "Image/Languages/Lang/lang_0602.png",
			    onEvent = AmericalangButtonEvent
			}
			)
			AmericalangButton.x = display.contentWidth * 0.15
			AmericalangButton.y = display.contentHeight * 0.38
			scrollView:insert( AmericalangButton )

			--設定飛機圖示位置
			airplaneImage.x = display.contentWidth * 0.12
			airplaneImage.y = display.contentHeight * 0.3
			
			display.remove(LanguagesetText)
			LanguagesetText = display.newImage( "Image/Languages/Title/langn06.png" )
			LanguagesetText.x = display.contentWidth * 0.65
			LanguagesetText.y = display.contentHeight * 0.14
			sceneGroup:insert( LanguagesetText )
				
			display.remove(ConfirmButton)
			ConfirmButton = widget.newButton(
		    {
		        
		        defaultFile = "Image/Languages/Done/done06.png",
		        onEvent = ConfirmButtonEvent
		    }
		    )
		    ConfirmButton.x = display.contentWidth * 0.82
			ConfirmButton.y = display.contentHeight * 0.93
			sceneGroup:insert( ConfirmButton )

		elseif lang == "China" then
			composer.removeScene( "Scenes.MainMenu.MainMenu_China" )
			display.remove( ChinalangButton )
			--createbutton("Image/Languages/Lang/lang_0302.png",ChinalangButton,display.contentWidth * 0.29,display.contentHeight * 0.25)
			ChinalangButton = widget.newButton(
		    {
		        
		        defaultFile = "Image/Languages/Lang/lang_0302.png",
		        onEvent = ChinalangButtonEvent
		    }
		    )
		    ChinalangButton.x = display.contentWidth * 0.29
			ChinalangButton.y = display.contentHeight * 0.25
			scrollView:insert( ChinalangButton )

			airplaneImage.x = display.contentWidth * 0.23
			airplaneImage.y = display.contentHeight * 0.13

			display.remove(LanguagesetText)
			LanguagesetText = display.newImage( "Image/Languages/Title/langn03.png" )
			LanguagesetText.x = display.contentWidth * 0.65
			LanguagesetText.y = display.contentHeight * 0.14
			sceneGroup:insert( LanguagesetText )

			display.remove(ConfirmButton)
			ConfirmButton = widget.newButton(
		    {
		        
		        defaultFile = "Image/Languages/Done/done03.png",
		        onEvent = ConfirmButtonEvent
		    }
		    )
		    ConfirmButton.x = display.contentWidth * 0.82
			ConfirmButton.y = display.contentHeight * 0.93
			sceneGroup:insert( ConfirmButton )

		elseif lang == "Taiwan" then
			composer.removeScene( "Scenes.MainMenu.MainMenu_Taiwan" )
			display.remove( TaiwanlangButton )
			TaiwanlangButton = widget.newButton(
		    {
		        
		        defaultFile = "Image/Languages/Lang/lang_0502.png",
		        onEvent = TaiwanlangButtonEvent
		    }
		    )
		    TaiwanlangButton.x = display.contentWidth * 0.43
			TaiwanlangButton.y = display.contentHeight * 0.42
			scrollView:insert( TaiwanlangButton )

			airplaneImage.x = display.contentWidth * 0.45
			airplaneImage.y = display.contentHeight * 0.36

			display.remove(LanguagesetText)
			LanguagesetText = display.newImage( "Image/Languages/Title/langn01.png" )
			LanguagesetText.x = display.contentWidth * 0.65
			LanguagesetText.y = display.contentHeight * 0.14
			sceneGroup:insert( LanguagesetText )

			display.remove(ConfirmButton)
			ConfirmButton = widget.newButton(
		    {
		        
		        defaultFile = "Image/Languages/Done/done05.png",
		        onEvent = ConfirmButtonEvent
		    }
		    )
		    ConfirmButton.x = display.contentWidth * 0.82
			ConfirmButton.y = display.contentHeight * 0.93
			sceneGroup:insert( ConfirmButton )

		elseif lang == "Korea" then
			composer.removeScene( "Scenes.MainMenu.MainMenu_Korea" )
			display.remove( KorealangButton )
			--Language: Korea
			KorealangButton = widget.newButton(
		    {
		        
		        defaultFile = "Image/Languages/Lang/lang_0202.png",
		        onEvent = KorealangButtonEvent
		    }
		    )
		    KorealangButton.x = display.contentWidth * 0.47
			KorealangButton.y = display.contentHeight * 0.18
			scrollView:insert( KorealangButton )

			airplaneImage.x = display.contentWidth * 0.6
			airplaneImage.y = display.contentHeight * 0.1

			display.remove(LanguagesetText)
			LanguagesetText = display.newImage( "Image/Languages/Title/langn02.png" )
			LanguagesetText.x = display.contentWidth * 0.65
			LanguagesetText.y = display.contentHeight * 0.14
			sceneGroup:insert( LanguagesetText )

			display.remove(ConfirmButton)
			ConfirmButton = widget.newButton(
		    {
		        
		        defaultFile = "Image/Languages/Done/done02.png",
		        onEvent = ConfirmButtonEvent
		    }
		    )
		    ConfirmButton.x = display.contentWidth * 0.82
			ConfirmButton.y = display.contentHeight * 0.93
			sceneGroup:insert( ConfirmButton )

		elseif lang == "Japan" then

			display.remove( JapanlangButton )
			--Language: Japan
			JapanlangButton = widget.newButton(
		    {
		        
		        defaultFile = "Image/Languages/Lang/lang_0102.png",
		        onEvent = JapanlangButtonEvent
		    }
		    )
		    JapanlangButton.x = display.contentWidth * 0.77
			JapanlangButton.y = display.contentHeight * 0.25
			scrollView:insert( JapanlangButton )

			airplaneImage.x = display.contentWidth * 0.89
			airplaneImage.y = display.contentHeight * 0.14

			display.remove(LanguagesetText)
			LanguagesetText = display.newImage( "Image/Languages/Title/langn01.png" )
			LanguagesetText.x = display.contentWidth * 0.65
			LanguagesetText.y = display.contentHeight * 0.14
			sceneGroup:insert( LanguagesetText )

			display.remove(ConfirmButton)
			ConfirmButton = widget.newButton(
		    {
		        
		        defaultFile = "Image/Languages/Done/done01.png",
		        onEvent = ConfirmButtonEvent
		    }
		    )
		    ConfirmButton.x = display.contentWidth * 0.82
			ConfirmButton.y = display.contentHeight * 0.93
			sceneGroup:insert( ConfirmButton )

		elseif lang == "Spain" then

			display.remove( SpainlangButton )
			--Language: Spain
			SpainlangButton = widget.newButton(
		    {
		        
		        defaultFile = "Image/Languages/Lang/lang_0402.png",
		        onEvent = SpainlangButtonEvent
		    }
		    )
		    SpainlangButton.x = display.contentWidth * 0.77
			SpainlangButton.y = display.contentHeight * 0.38
			scrollView:insert( SpainlangButton )

			airplaneImage.x = display.contentWidth * 0.85
			airplaneImage.y = display.contentHeight * 0.43

			display.remove(LanguagesetText)
			LanguagesetText = display.newImage( "Image/Languages/Title/langn04.png" )
			LanguagesetText.x = display.contentWidth * 0.65
			LanguagesetText.y = display.contentHeight * 0.14
			sceneGroup:insert( LanguagesetText )

			display.remove(ConfirmButton)
			ConfirmButton = widget.newButton(
		    {
		        
		        defaultFile = "Image/Languages/Done/done04.png",
		        onEvent = ConfirmButtonEvent
		    }
		    )
		    ConfirmButton.x = display.contentWidth * 0.82
			ConfirmButton.y = display.contentHeight * 0.93
			sceneGroup:insert( ConfirmButton )

		elseif lang == "France" then

			display.remove( FrancelangButton )
			--Language: France
			FrancelangButton = widget.newButton(
			{
			    
			    defaultFile = "Image/Languages/Lang/lang_0702.png",
			    onEvent = FrancelangButtonEvent
			}
			)
			FrancelangButton.x = display.contentWidth * 0.6
			FrancelangButton.y = display.contentHeight * 0.5
			scrollView:insert( FrancelangButton )

			airplaneImage.x = display.contentWidth * 0.75
			airplaneImage.y = display.contentHeight * 0.58

			display.remove(LanguagesetText)
			LanguagesetText = display.newImage( "Image/Languages/Title/langn07.png" )
			LanguagesetText.x = display.contentWidth * 0.65
			LanguagesetText.y = display.contentHeight * 0.14
			sceneGroup:insert( LanguagesetText )

			display.remove(ConfirmButton)
			ConfirmButton = widget.newButton(
		    {
		        
		        defaultFile = "Image/Languages/Done/done07.png",
		        onEvent = ConfirmButtonEvent
		    }
		    )
		    ConfirmButton.x = display.contentWidth * 0.82
			ConfirmButton.y = display.contentHeight * 0.93
			sceneGroup:insert( ConfirmButton )

		elseif lang == "Dutch" then

			display.remove( dnlangButton )
			dnlangButton = widget.newButton(
		    {
		        
		        defaultFile = "Image/Languages/Lang/lang_1202.png",
		        onEvent = dnlangButtonEvent
		    }
		    )
		    dnlangButton.x = display.contentWidth * 1.22
			dnlangButton.y = display.contentHeight * 0.35
			scrollView:insert( dnlangButton )

			airplaneImage.x = display.contentWidth * 1.17
			airplaneImage.y = display.contentHeight * 0.27

			display.remove(LanguagesetText)
			LanguagesetText = display.newImage( "Image/Languages/Title/langn12.png" )
			LanguagesetText.x = display.contentWidth * 0.65
			LanguagesetText.y = display.contentHeight * 0.14
			sceneGroup:insert( LanguagesetText )

			display.remove(ConfirmButton)
			ConfirmButton = widget.newButton(
		    {
		        
		        defaultFile = "Image/Languages/Done/done12.png",
		        onEvent = ConfirmButtonEvent
		    }
		    )
		    ConfirmButton.x = display.contentWidth * 0.82
			ConfirmButton.y = display.contentHeight * 0.93
			sceneGroup:insert( ConfirmButton )

		elseif lang == "Russia" then

			display.remove( RussialangButton )
			--Language: Russia
			RussialangButton = widget.newButton(
		    {
		        
		        defaultFile = "Image/Languages/Lang/lang_1002.png",
		        onEvent = RussialangButtonEvent
		    }
		    )
		    RussialangButton.x = display.contentWidth * 1.28
			RussialangButton.y = display.contentHeight * 0.2
			scrollView:insert( RussialangButton )

			airplaneImage.x = display.contentWidth * 1.31
			airplaneImage.y = display.contentHeight * 0.08

			display.remove(LanguagesetText)
			LanguagesetText = display.newImage( "Image/Languages/Title/langn10.png" )
			LanguagesetText.x = display.contentWidth * 0.65
			LanguagesetText.y = display.contentHeight * 0.14
			sceneGroup:insert( LanguagesetText )

			display.remove(ConfirmButton)
			ConfirmButton = widget.newButton(
		    {
		        
		        defaultFile = "Image/Languages/Done/done10.png",
		        onEvent = ConfirmButtonEvent
		    }
		    )
		    ConfirmButton.x = display.contentWidth * 0.82
			ConfirmButton.y = display.contentHeight * 0.93
			sceneGroup:insert( ConfirmButton )

		elseif lang == "Germany" then

			display.remove( GermanylangButton )
			--Language: Germany
			GermanylangButton = widget.newButton(
		    {
		        
		        defaultFile = "Image/Languages/Lang/lang_0802.png",
		        onEvent = GermanylangButtonEvent
		    }
		    )
		    GermanylangButton.x = display.contentWidth * 1.6
			GermanylangButton.y = display.contentHeight * 0.12
			scrollView:insert( GermanylangButton )

			airplaneImage.x = display.contentWidth * 1.45
			airplaneImage.y = display.contentHeight * 0.15

			display.remove(LanguagesetText)
			LanguagesetText = display.newImage( "Image/Languages/Title/langn08.png" )
			LanguagesetText.x = display.contentWidth * 0.65
			LanguagesetText.y = display.contentHeight * 0.14
			sceneGroup:insert( LanguagesetText )

			display.remove(ConfirmButton)
			ConfirmButton = widget.newButton(
		    {
		        
		        defaultFile = "Image/Languages/Done/done08.png",
		        onEvent = ConfirmButtonEvent
		    }
		    )
		    ConfirmButton.x = display.contentWidth * 0.82
			ConfirmButton.y = display.contentHeight * 0.93
			sceneGroup:insert( ConfirmButton )

		elseif lang == "Malaysia" then

			display.remove( IDlangButton )
			--Language: Indonesia
			IDlangButton = widget.newButton(
		    {
		        
		        defaultFile = "Image/Languages/Lang/lang_0902.png",
		        onEvent = IDlangButtonEvent
		    }
		    )
		    IDlangButton.x = display.contentWidth * 1.8
			IDlangButton.y = display.contentHeight * 0.22
			scrollView:insert( IDlangButton )

			airplaneImage.x = display.contentWidth * 1.95
			airplaneImage.y = display.contentHeight * 0.12

			display.remove(LanguagesetText)
			LanguagesetText = display.newImage( "Image/Languages/Title/langn09.png" )
			LanguagesetText.x = display.contentWidth * 0.65
			LanguagesetText.y = display.contentHeight * 0.14
			sceneGroup:insert( LanguagesetText )

			display.remove(ConfirmButton)
			ConfirmButton = widget.newButton(
		    {
		        
		        defaultFile = "Image/Languages/Done/done09.png",
		        onEvent = ConfirmButtonEvent
		    }
		    )
		    ConfirmButton.x = display.contentWidth * 0.82
			ConfirmButton.y = display.contentHeight * 0.93
			sceneGroup:insert( ConfirmButton )

		elseif lang == "Vientnames" then

			display.remove( VientnameslangButton )
			--Language: Vientnames
			VientnameslangButton = widget.newButton(
		    {
		        
		        defaultFile = "Image/Languages/Lang/lang_1102.png",
		        onEvent = VientnameslangButtonEvent
		    }
		    )
		    VientnameslangButton.x = display.contentWidth * 1.6
			VientnameslangButton.y = display.contentHeight * 0.38
			

			airplaneImage.x = display.contentWidth * 1.75
			airplaneImage.y = display.contentHeight * 0.33

			display.remove(LanguagesetText)
			LanguagesetText = display.newImage( "Image/Languages/Title/langn11.png" )
			LanguagesetText.x = display.contentWidth * 0.65
			LanguagesetText.y = display.contentHeight * 0.14
			sceneGroup:insert( LanguagesetText )

			display.remove(ConfirmButton)
			ConfirmButton = widget.newButton(
		    {
		        
		        defaultFile = "Image/Languages/Done/done11.png",
		        onEvent = ConfirmButtonEvent
		    }
		    )
		    ConfirmButton.x = display.contentWidth * 0.82
			ConfirmButton.y = display.contentHeight * 0.93
			sceneGroup:insert( ConfirmButton )

		elseif lang == "Italy" then

			display.remove( ItalylangButton )
			--Language: Italy
			ItalylangButton = widget.newButton(
		    {
		        width = 100,
		        height = 60,
		        defaultFile = "Image/Languages/Lang/lang_1302.png",
		        onEvent = ItalylangButtonEvent
		    }
		    )
		    ItalylangButton.x = display.contentWidth * 1.75
			ItalylangButton.y = display.contentHeight * 0.5
			scrollView:insert( ItalylangButton )

			airplaneImage.x = display.contentWidth * 1.65
			airplaneImage.y = display.contentHeight * 0.55

			display.remove(LanguagesetText)
			LanguagesetText = display.newImage( "Image/Languages/Title/langn13.png" )
			LanguagesetText.x = display.contentWidth * 0.65
			LanguagesetText.y = display.contentHeight * 0.14
			sceneGroup:insert( LanguagesetText )

			display.remove(ConfirmButton)
			ConfirmButton = widget.newButton(
		    {
		        
		        defaultFile = "Image/Languages/Done/done13.png",
		        onEvent = ConfirmButtonEvent
		    }
		    )
		    ConfirmButton.x = display.contentWidth * 0.82
			ConfirmButton.y = display.contentHeight * 0.93
			sceneGroup:insert( ConfirmButton )

		end
		scrollView:insert( airplaneImage )
		sceneGroup:insert( LanguagesetText )
	end
	if "did" == phase then
		local showMem = function()

			--print(scrollView:getContentPosition())
			scrollViewcontent_x, scrollViewcontent_y = scrollView:getContentPosition()

			if scrollViewcontent_x <= -334.0 then
				currentpage = "2"
			end
			if scrollViewcontent_x >= -10.0 then
				currentpage = "1"
			end
			currentpageText.text = currentpage

		end
		memTimer = timer.performWithDelay( 1000, showMem, 0 )
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


