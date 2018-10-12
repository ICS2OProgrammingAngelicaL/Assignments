-----------------------------------------------------------------------------------------
-- Title: AnimatingImages
-- Name: Angelica L
-- Course: ICS2O/3C
-- This program displays a background with 3 different objects that move around on the 
-- screen as well as some coloured text
-----------------------------------------------------------------------------------------

-- Create local variables

local backgroundImage = display.newImageRect("Images/llamaBackground.jpg", 2308,1536)

local bird = display.newImageRect("Images/Galaxybirb.png", 250, 250)
local birdWidth = bird.width
local birdHeight = bird.height 

local Pumpkin = display.newImageRect("Images/Pumpkin.png", 260, 260)
local PumpkinWidth = Pumpkin.width
local PumpkinHeight = Pumpkin.height
-- sets the pumpkin scale
 Pumpkin:scale(1,1)

local noFace = display.newImageRect("Images/noFace.png", 250, 360)
local noFaceWidth = noFace.width
local noFaceHeight = noFace.height
-- sets the image transparency
noFace.alpha = 1

local textObject = display.newText ("w o w", 7, 7, nil, 150)
textObject.x = display.contentWidth *3/5
textObject.y = display.contentHeight *0.5/3
textObject:setTextColor (0,1,0)

--Global Variables
scrollSpeed1 = 10
scrollSpeed2 = 5
scrollSpeed3 = 3
------------------------------------------------------------------------------------------
--Create Functions

-- Function: MoveBird
-- Input: this function accepts an event listener
-- Output: none
-- Description: this function adds the scroll speed to the x and y value of the bird
-- (moving the bird diagonally across the screen)
local function MoveBird( event )
	-- Add the scroll speed to the x and y value of the Bird
	bird.x = bird.x + scrollSpeed1
	bird.y = bird.y - scrollSpeed1
end

-- Function: MoveNoFace
-- Input: this function accepts an event listener
-- Output: none
-- Description: this function adds the scroll speed to the x and y value of noFace
local function MoveNoFace( event )
	-- Add the scroll speed to the x and y value of noFace
	noFace.x = noFace.x + scrollSpeed2
    -- Fades out noFace
	noFace.alpha = noFace.alpha - 0.00000001
end

-- Function: MovePumpkin
-- Input: this function accepts an event listener
-- Output: none
-- Description: this function adds the scroll speed to the x and y value of the pumpkin
local function MovePumpkin( event )
	-- Add the scroll speed to the x and y value of the pumpkin
	Pumpkin.y = Pumpkin.y - scrollSpeed3
    Pumpkin:scale(0.998,0.998)
end

-------------------------------------------------------------------------------------------

-- Hide the status bar
display.setStatusBar(display.HiddenStatusBar)

-- sets the initial coordinates of the objects

bird.x = display.contentWidth/8
bird.y = display.contentHeight *10/8

Pumpkin.x = display.contentWidth *2/7
Pumpkin.y = display.contentHeight*5/4

noFace.x = display.contentWidth*-1/11
noFace.y = display.contentHeight *3/4

-- Event listener to activate the Functions

Runtime:addEventListener("enterFrame", MoveBird)
Runtime:addEventListener("enterFrame", MoveNoFace)
Runtime:addEventListener("enterFrame", MovePumpkin)