---------------------------------------------------------------------------------
--
-- scene.lua
--
---------------------------------------------------------------------------------


local composer = require( "composer" )

-- Load scene with same root filename as this file
local scene = composer.newScene( sceneName )

---------------------------------------------------------------------------------

local maxX = display.contentWidth;
local maxY = display.contentHeight;

local cntX = maxX *0.5;
local cntY = maxY *0.5;
local changeText;
function scene:create( event )
    local sceneGroup = self.view
    helloText= display.newText("Hello World",cntX,cntY, native.systemFontBold,32);
    helloBtn= display.newRect(cntX,maxY,200,100);
    helloBtn.y= maxY- helloBtn.height *0.5;
    print(maxX,maxY);
    sceneGroup:insert(helloText);
    
end

function scene:show( event )
    local sceneGroup = self.view
    local phase = event.phase
    if phase=="will" then
      --do something
      helloBtn:addEventListener("tap",changeText);
    elseif phase =="did" then
      --something else
    end

    
end
function scene:hide( event )
    local phase = event.phase
    if phase=="will" then
      --do something
      helloBtn:removeEventListener("tap",changeText);
    elseif phase =="did" then
      --something else
    end
    



end
function scene:destroy(event)
  end
---------------------------------------------------------------------------------
function changeText()
    local curText = helloText.text;
    if curText=="Hello World" then  
      helloText.text = "Goodbye!";
    elseif curText == "Goodbye!" then
      helloText.text = "Hello World";
    end
  
end  
-- Listener setup
scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )

---------------------------------------------------------------------------------

return scene
