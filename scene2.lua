----------------------------------------------------------------------------------
--
-- scene2.lua
--
----------------------------------------------------------------------------------
local composer = require( "composer" )
local scene = composer.newScene()
---------------------------------------------------------------------------------
local _W = display.contentWidth
local _H = display.contentHeight
local back

local function onTouch(event)
	if(event.phase == "ended")then
		--composer.removeAll()
		composer.gotoScene( "scenetemplate", "fade", 1000 )
		return true
	end
end

function scene:create( event )
	local sceneGroup = self.view
	
	back = display.newRect(_W/2, _H/2, _W, _H)
	back:setFillColor(0.98, 0.51, 0.04)
	sceneGroup:insert(back)
end

function scene:show( event )
	local sceneGroup = self.view
	local phase = event.phase
	
	if phase == "will" then
	
	elseif phase == "did" then
		back:addEventListener("touch", onTouch)
	end	
end

function scene:hide( event )
	local sceneGroup = self.view
	local phase = event.phase
	
	if event.phase == "will" then
		back:removeEventListener("touch", onTouch)	
	elseif phase == "did" then
		
	end	
end


function scene:destroy( event )
	local sceneGroup = self.view
	back:removeSelf()
	back = nil
end

---------------------------------------------------------------------------------

-- Listener setup
scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )

---------------------------------------------------------------------------------

return scene