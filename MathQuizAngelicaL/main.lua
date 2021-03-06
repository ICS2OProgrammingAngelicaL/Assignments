-----------------------------------------------------------------------------------------
-- Title: MathQuiz ( Assignment 5 )
-- Name: Angelica L
-- Course: ICS2O
-- This program displays a math problem and allow the user to enter the answer
-----------------------------------------------------------------------------------------

-- Hides the status bar
display.setStatusBar(display.HiddenStatusBar)

-- Background
local background = display.newImageRect("Images/purple.jpg", display.contentWidth *2, display.contentHeight + 500 *2)

-----------------------------------------------------------------------------------------
-- Local variables
-----------------------------------------------------------------------------------------

local questionObject
local correctObject
local numericField
local randomNumber1
local randomNumber2
local userAnswer
local correctAnswer
local randomOperator
local tally = 0
local clockText
local countDownTimer
local heart1
local heart2 
local heart3
local heart4
local lives = 3	
local secondsLeft = 11
local totalSeconds = 11
local subTemp
local factTemp

-----------------------------------------------------------------------------------------
-- Sound
-----------------------------------------------------------------------------------------
	-- Incorrect Answer
local incorrectSound = audio.loadSound("Sounds/incorrect.mp3")
local incorrectSoundChannel
	-- Correct Answer
local correctSound = audio.loadSound("Sounds/correct.mp3")
local corectChannel
	-- Game Over Screen
local overMusic = audio.loadSound("Sounds/gameOverMusic.mp3")
local overMusicChannel
	-- Win Screen
local winMusic = audio.loadSound("Sounds/winMusic.mp3")
local winMusicChannel
-----------------------------------------------------------------------------------------
-- Object creation
-----------------------------------------------------------------------------------------

-- Displays a question and sets the colour
questionObject = display.newText("", display.contentWidth/2, display.contentHeight/2, nil, 100)
questionObject:setTextColor(1)


incorrect = display.newText("Incorrect :(", display.contentWidth/2, display.contentHeight *2.5/7, nil, 75)
incorrect:setTextColor(1,0,0)
incorrect.isVisible = false

-- Create the correct text object and make it invisible
correctObject = display.newText("Correct :)", display.contentWidth/2, display.contentHeight *2/7, nil, 75)
correctObject:setTextColor(0,1,0)
correctObject.isVisible = false

clockText = display.newText("", display.contentWidth *10/12, display.contentHeight *11/12, nil, 50)
clockText:setTextColor(1)

-- Create numeric field
numericField = native.newTextField( display.contentWidth/2, display.contentHeight *2.5/3, 800, 80 )
numericField.inputType = "number"

correctTally = display.newText("", display.contentWidth/6, display.contentHeight/6, nil, 50) 

-- Hearts
heart1 = display.newImageRect("Images/heart.png", 75, 75)
heart1.x = display.contentWidth *7/8
heart1.y = display.contentHeight *1/7
heart1.isVisible = true

heart2 = display.newImageRect("Images/heart.png", 75, 75)
heart2.x = display.contentWidth *6/8
heart2.y = display.contentHeight *1/7
heart2.isVisible = true

heart3 = display.newImageRect("Images/heart.png", 75, 75)
heart3.x = display.contentWidth *5/8
heart3.y = display.contentHeight *1/7
heart3.isVisible = true

-- Game over screen
gameOver = display.newImageRect("Images/gameOver.jpg",display.contentWidth,display.contentHeight)
gameOver.x = display.contentWidth/2
gameOver.y = display.contentHeight/2
gameOver.isVisible = false

-- Win screen
winScreen = display.newImageRect("Images/winner.jpg",display.contentWidth,display.contentHeight)
winScreen.x = display.contentWidth/2
winScreen.y = display.contentHeight/2
winScreen.isVisible = false

-----------------------------------------------------------------------------------------
-- Local functions
-----------------------------------------------------------------------------------------

local function Winner()
	if (tally == 5) then
		winScreen.isVisible = true
		winMusicChannel = audio.play(winMusic) 
	end
end

local function UpdateHearts()

	if ( lives == 3) then
		heart1.isVisible = true
		heart2.isVisible = true
		heart3.isVisible = true

	elseif ( lives == 2 ) then
		heart1.isVisible = true
		heart2.isVisible = true
		heart3.isVisible = false

	elseif ( lives == 1 ) then
		heart1.isVisible = true
		heart2.isVisible = false
		heart3.isVisible = false

	else --( lives == 0 )
		heart1.isVisible = false
		heart2.isVisible = false
		heart3.isVisible = false
		gameOver.isVisible = true
		overMusicChannel = audio.play(overMusic) 
	end
end
-----------------------------------------------------------------------------------------
-- Timers
-----------------------------------------------------------------------------------------
local function UpdateTime()
	-- Decrement the number of seconds
	secondsLeft = secondsLeft - 1

	--Display the number of seconds left in the clock object
	clockText.text = "Time: " .. secondsLeft

	if (secondsLeft == 0 ) then
		-- Reset the number of seconds left
		secondsLeft = totalSeconds
		lives = lives - 1

		-- Calls function to update hearts/lives
		UpdateHearts()

	end
end

-- Create a countdown timer that loops infinitely
local function StartTimer()
	-- Create a countdown timer that loops infinitely
	countDownTimer = timer.performWithDelay( 1000, UpdateTime, 0)
end
-----------------------------------------------------------------------------------------
-- Questions
-----------------------------------------------------------------------------------------

local function AskQuestion()
	-- Generate 2 random numbers between a max. and a min. number
	randomNumberSAD1 = math.random(10,20)
	randomNumberSAD2 = math.random(10,20)
	randomNumberM1 = math.random(0,10)
	randomNumberM2 = math.random(1,10)
	randomNumberD1 = math.random(1,10)
	randomNumberD2 = math.random(1,10)
	randomNumberB = math.random(1,6)   
	randomNumberE = math.random(1,3)
	randomNumberF = math.random(1,5)
	randomOperator = math.random(1,7)

	if (randomOperator == 1) then -- Addition
		correctAnswer = randomNumberSAD1 + randomNumberSAD2
			-- Create the question in text object
		questionObject.text = randomNumberSAD1 .. "+" .. randomNumberSAD2 .. "="

	elseif (randomOperator == 2) then -- Subtraction

		if (randomNumberSAD1 < randomNumberSAD2) then
			subTemp = randomNumberSAD1
			randomNumberSAD1 = randomNumberSAD2
			randomNumberSAD2 = subTemp
			correctAnswer = randomNumberSAD1 - randomNumberSAD2
			questionObject.text = randomNumberSAD1 .. "-" .. randomNumberSAD2 .. "="

		else
			correctAnswer = randomNumberSAD1 - randomNumberSAD2
			questionObject.text = randomNumberSAD1 .. "-" .. randomNumberSAD2 .. "="
		end

	elseif (randomOperator == 3) then -- Multiplication
		correctAnswer = randomNumberM1 * randomNumberM2
		questionObject.text = randomNumberM1 .. "*" .. randomNumberM2 .. "="

	elseif (randomOperator == 4) then -- Division
		correctAnswer = randomNumberD1
		-- Create the question for division
		questionObject.text = randomNumberD1*randomNumberD2 .. "÷" .. randomNumberD2 .. "="	

	elseif (randomOperator == 5) then -- Square root ; use division range D1
		correctAnswer = randomNumberD1
		-- Create the question for square root
		questionObject.text = "√".. randomNumberD1^2 .. "="	
		
	elseif (randomOperator == 6) then -- exponent
		correctAnswer = randomNumberB^randomNumberE
		-- Create the question for exponent
		questionObject.text = randomNumberB .. "^" .. randomNumberE .. "="		

	else -- (randomOperator == 7) then -- factorial
		-- Start at 1
		factTemp = 1
		-- Set the correctAnswer to 1 (1!)
		correctAnswer = 1
		-- Multiply consecutive integers from 1 to randomNumberF
		while (factTemp <= randomNumberF) do

			correctAnswer = correctAnswer * factTemp
			-- Increment temporary variable
			factTemp = factTemp + 1
		end
		-- Create the question for factorials
		questionObject.text = randomNumberF.. "! ="	


	end

end

local function HideCorrect()
	correctObject.isVisible = false
	incorrect.isVisible = false
end

local function NumericFieldListener( event )

	-- User begins editing "numericField"
	if ( event.phase == "began" ) then

		-- Clear text field
		event.target.text = ""

	elseif event.phase == "submitted" then

		-- When the answer is submitted (enter key is pressed) set user input to user's 
		-- answer
		userAnswer = tonumber(event.target.text)

		-- If the users answer and the correct amswer are the same
		if ( userAnswer == correctAnswer ) then
			correctObject.isVisible = true
			correctSoundChannel = audio.play(correctSound) 
			timer.performWithDelay(1500, HideCorrect)
			tally = tally + 1
			correctTally.text = ("Correct: ".. tally)
			secondsLeft = 11
			AskQuestion()
			Winner()

		else

			correctObject.isVisible = false
			incorrect.isVisible = true
			incorrectSoundChannel = audio.play(incorrectSound) 
			timer.performWithDelay(1500, HideCorrect)
			lives = lives - 1
			UpdateHearts()
			secondsLeft = 11
			AskQuestion()
		end

		-- Clear text field
		event.target.text = ""
	end
end
-----------------------------------------------------------------------------------------
-- Event listeners
-----------------------------------------------------------------------------------------


-- Starts the timer
StartTimer()
UpdateTime()

-- add the event listener for the numeric field
numericField:addEventListener( "userInput", NumericFieldListener )

-- call the function to ask the question
AskQuestion()