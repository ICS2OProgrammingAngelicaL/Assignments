-----------------------------------------------------------------------------------------
-- Title : Assignment#3
-- Name : Angelica L
-- Course : ICS20/3C
-- This program will display __ shapes and have their noame written underneath
-----------------------------------------------------------------------------------------

-- Create my local variables

--Triangle
local verticesT = { -250,100, -50,100, -150,-80}
local triangle = display.newPolygon( 124, 100, verticesT )
local textObjectTriangle
local gradientTri = {
    type="gradient",
    color1={ 102/255, 255/255, 102/255 }, 
    color2={ 204/255, 255/255, 204/255 }, 
    direction="down"
}
--Trapezoid
local verticesTz = { -250,100, -100,100, -150,-25, -200,-25}
local trapezoid = display.newPolygon( 800, 355, verticesTz )
local textObjectTz
local gradientTz = {
    type="gradient",
    color1={ 102/255, 178/255, 255/255 }, 
    color2={ 204/255, 229/255, 255/255 }, 
    direction="down"
}
-- Octagon
local verticesOcta = { -50,75, 50,75, 90,25, 90,-25, 50,-75, -50,-75, -90,-25, -90,25}
local octa = display.newPolygon( 124, 600, verticesOcta )
local textObjectOcta
local gradientOcta = {
    type="gradient",
    color1={ 178/255, 102/255, 255/255 }, 
    color2={ 229/255, 204/255, 255/255 }, 
    direction="down"
}
----------------------------------------------------------------------------------------
-- Sets the background colour of the screen
display.setDefault("background",102/255, 0/255, 0/255)

-- To remove status bar
display.setStatusBar(display.HiddenStatusBar)

-- Sets fill colour of Triangle
triangle:setFillColor(gradientTri)

-- Triangle Border
triangle.strokeWidth = 3
triangle:setStrokeColor( 1 )

-- Sets the fill colour of the trapezoid
trapezoid:setFillColor(gradientTz)

-- Trapezoid border
trapezoid.strokeWidth = 3
trapezoid:setStrokeColor(1)

-- sets the fill colour of the octagon
octa:setFillColor(gradientOcta)

-- Octagon border
octa.strokeWidth = 3
octa:setStrokeColor(1)

-- Display "Triangle" on screen
textObjectTriangle = display.newText("Triangle",500, 100, nil, 125)

-- Display "Trapezoid" on screen
textObjectTz = display.newText("Trapezoid", 400, 350, nil, 125)

-- Display "Octagon" on screen
textObjectOcta = display.newText("Octagon", 500, 600, nil, 125)