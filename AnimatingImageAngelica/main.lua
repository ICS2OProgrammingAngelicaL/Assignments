-----------------------------------------------------------------------------------------
-- Title: AnimatingImages
-- Name: Angelica L
-- Course: ICS2O/3C
-- This program displays a background with 3 different objects that move around on the 
-- screen as well as some coloured text
-----------------------------------------------------------------------------------------

-- Create local variables

local backgroundImage = display.newImageRect("Images/BlackGrid.jpg", 2048,1536)

local bird = display.newImageRect("Images/Galaxybirb.png", 250, 250)
local birdWidth = bird.width
local birdHeight = bird.height 

local jigglyPuff = display.newImageRect("Images/jigglypuff.png", 200, 260)
local jigglyPuffWidth = jigglyPuff.width
local jigglyPuffHeight = jigglyPuff.height


-- sets the initial coordinates of the objects

bird.x = 400
bird.y = 500

jigglyPuff.x = 500
jigglyPuff.y = 300