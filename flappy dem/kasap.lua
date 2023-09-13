--[[
    kasap Class
    Author: Colton Ogden
    cogden@cs50.harvard.edu

    The kasap class represents the kasaps that randomly spawn in our game, which act as our primary obstacles.
    The kasaps can stick out a random distance from the top or bottom of the screen. When the player collides
    with one of them, it's game over. Rather than our bird actually moving through the screen horizontally,
    the kasaps themselves scroll through the game to give the illusion of player movement.
]]

kasap = Class{}

-- since we only want the image loaded once, not per instantation, define it externally
local kasap_IMAGE = love.graphics.newImage('kasap.png')

function kasap:init(orientation, y)
    self.x = VIRTUAL_WIDTH + 64
    self.y = y

    self.width = kasap_WIDTH
    self.height = kasap_HEIGHT

    self.orientation = orientation
end

function kasap:update(dt)
    
end

function kasap:render()
    love.graphics.draw(kasap_IMAGE, self.x, 

        -- shift kasap rendering down by its height if flipped vertically
        (self.orientation == 'top' and self.y + kasap_HEIGHT or self.y), 

        -- scaling by -1 on a given axis flips (mirrors) the image on that axis
        0, 1, self.orientation == 'top' and -1 or 1)
end