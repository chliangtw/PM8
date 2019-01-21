--
-- created with TexturePacker - https://www.codeandweb.com/texturepacker
--
-- $TexturePacker:SmartUpdate:5f422350ebb88cacea86f110ca299a40:59196755265bdc636163c6c0fd13bbbd:2ed2cbfa31833f8abee1e607dae164c6$
--
-- local sheetInfo = require("mysheet")
-- local myImageSheet = graphics.newImageSheet( "mysheet.png", sheetInfo:getSheet() )
-- local sprite = display.newSprite( myImageSheet , {frames={sheetInfo:getFrameIndex("sprite")}} )
--

local SheetInfo = {}

SheetInfo.sheet =
{
    frames = {
    
        {
            -- Main
            x=1,
            y=1,
            width=488,
            height=720,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 512,
            sourceHeight = 1024
        },
    },

    sheetContentWidth = 490,
    sheetContentHeight = 722
}

SheetInfo.frameIndex =
{

    ["Main"] = 1,
}

function SheetInfo:getSheet()
    return self.sheet;
end

function SheetInfo:getFrameIndex(name)
    return self.frameIndex[name];
end

return SheetInfo
