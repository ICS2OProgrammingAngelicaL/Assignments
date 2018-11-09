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
local banana = display.newImageRect("Images/CompanyLogoAngelica@2xCopy.png", display.contentWidth/5, display.contentHeight/5 + display.contentHeight/14)
local bananaWidth = banana.width
local bananaHeight = banana.height
	-- Placement of the banana
banana.x = display.contentWidth *2/4
banana.y = display.contentHeight *2/4

-----------------------------------------------------------------------------------------
-- Object Creation
-----------------------------------------------------------------------------------------
