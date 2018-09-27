-----------------------------------------------------------------------------------------
-- Title : Assignment#3
-- Name : Angelica L
-- Course : ICS20/3C
-- This program will display __ shapes and have their noame written underneath
-----------------------------------------------------------------------------------------

-- Create my local variables
local triangleHalfW = display.contentWidth * 0.2
local triangleHalfH = display.contentHeight * 0.2
local verticesT = { -250,100, -50,100, -150,-80}
local triangle = display.newPolygon( triangleHalfW, triangleHalfH, verticesT )
--
local halfW = display.contentWidth * 0.7
local halfH = display.contentHeight * 0.2
local vertices = { -250,100, -50,100, -175,-80, }
local rhombus = display.newPolygon( halfW, halfH, vertices )

--local rhombus = display.newPolygon( rhombusHalfW, rhombusHalfH, verticesR )
--local verticesR = { -300,300, -10,300, -160,10, -20,-80}
--local rhombusHalfW = display.contentWidth * 0.2
--local rhombusHalfH = display.contentWidth * 0.3

-- Sets the background colour of the screen
display.setDefault("background", 1, 0, 0)

-- To remove status bar
display.setStatusBar(display.HiddenStatusBar)

-- sets fill colour of Triangle
triangle:setFillColor(0, 1, 0)

-- Triangle Border
triangle.strokeWidth = 10
triangle:setStrokeColor( 0 )

-- Rhombus Fill
rhombus:setFillColor(0)

-- local rhombus = display.newPolygon( rhombusHalfW, rhombusHalfH, verticesR )
-- local verticesR = { -300,300, -10,300, -160,10, 0,1}
-- local rhombusHalfW = display.contentWidth * 0.5
-- local rhombusHalfH = display.contentWidth * 0.5

-- triangleHalfW, triangleHalfH, 
-- 27,-35, 105,-35, 43,16, 65,90, 0,45, -65,90, -43,15, -105,-35, -27,-35, }
