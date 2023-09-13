--[[
    TitleScreenState Class
    Author: Colton Ogden
    cogden@cs50.harvard.edu

    The TitleScreenState is the starting screen of the game, shown on startup. It should
    display "Press Enter" and also our highest score.
]]

TitleScreenState = Class{__includes = BaseState}

function TitleScreenState:update(dt)
    -- transition to countdown when enter/return are pressed
    if love.keyboard.wasPressed('enter') or love.keyboard.wasPressed('return') then
        gStateMachine:change('countdown')
    end
end

function TitleScreenState:render()
    -- simple UI code
    love.graphics.setFont(flappyFont)
    love.graphics.printf('Flappy Dem', 0, 64, VIRTUAL_WIDTH, 'center')

    love.graphics.setFont(mediumFont)
    love.graphics.printf('Choose The Soundtrack B)', 0, 120, VIRTUAL_WIDTH, 'center')
    love.graphics.setFont(mediumFont)
    love.graphics.setColor(240, 14, 223, 255)
    love.graphics.printf('Press 1 for Recep Trap Erdogan', 0, 150, VIRTUAL_WIDTH, 'center')
    love.graphics.setColor(148, 14, 240, 255)
    love.graphics.printf('Press 2 Kerem Eating From PoPo', 0, 180, VIRTUAL_WIDTH, 'center')
    love.graphics.setColor(148, 14, 240, 255)
    love.graphics.printf('Press 3 nut in sok', 0, 210, VIRTUAL_WIDTH, 'center')
    love.graphics.setFont(flappyFont)
    love.graphics.setColor(255, 255, 255, 255)
    love.graphics.printf('Press Enter To Play', 0, 240, VIRTUAL_WIDTH, 'center')
    love.graphics.setFont(mediumFont)
end