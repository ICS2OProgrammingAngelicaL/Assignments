-----------------------------------------------------------------------------------------
-- Title: Company Logo Animation
-- Name: Angelica L
-- Course: ICS2O/3C
-- This program displays a banana moving upwards and a text object fades in.
-----------------------------------------------------------------------------------------

-- Hides the status bar
display.setStatusBar(display.HiddenStatusBar)

display.setDefault("background", 154/255, 153/255, 255/255)


-----------------------------------------------------------------------------------------
-- Local Variables
-----------------------------------------------------------------------------------------
	-- Banana
local banana = display.newImageRect("Images/CompanyLogoAngelica@2xCopy.png", display.contentWidth/3, display.contentHeight/3 + display.contentHeight/12)
-- Sets the width and height of the banana
local bananaWidth = banana.width
local bananaHeight = banana.height
	-- Starting x and y values of the banana
banana.x = display.contentWidth *2/4
banana.y = display.contentHeight *3/4

	-- Company Name
local Jojo = display.newImageRect("Images/CompanyLogoTextAngelicaCopy@2x.png",  display.contentWidth*11/13, display.contentHeight/4 + display.contentHeight/20)
-- Sets the heighht and width of the company name
local JojoWidth = Jojo.width
local JojoHeight = Jojo.height
-- x and y values of the Company name
Jojo.x = display.contentWidth/2
Jojo.y = display.contentHeight*3/4
-- sets the transparency
Jojo.alpha = 0


-- Rate of which the image moves
scrollSpeed = 4
stop = 0
-----------------------------------------------------------------------------------------
-- Local functions
-----------------------------------------------------------------------------------------
local function StopBanana()
 if	(banana.y == display.contentHeight/4) then
 	-- sets the rate of which the banana moves to 0 so it stops
 	scrollSpeed = stop
 end

end


local function MoveBanana( event )
	-- Add the scroll speed to the banana so it moves vertically
	banana.y = banana.y - scrollSpeed
	-- Calls function StopBanana
	StopBanana()
end

local function FadeInName()
	Jojo.alpha = Jojo.alpha + 0.008
end

-----------------------------------------------------------------------------------------
-- Event Listeners
-----------------------------------------------------------------------------------------
-- MoveBanana fuction
Runtime:addEventListener("enterFrame", MoveBanana)
Runtime:addEventListener("enterFrame", FadeInName)
-- Calls the function
MoveBanana()
FadeInName()

	
