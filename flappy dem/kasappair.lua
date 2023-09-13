--[[
    kasapPair Class

    Author: Colton Ogden
    cogden@cs50.harvard.edu

    Used to represent a pair of kasaps that stick together as they scroll, providing an opening
    for the player to jump through in order to score a point.
]]

kasapPair = Class{}

-- size of the gap between kasaps
local GAP_HEIGHT = 90

function kasapPair:init(y)
    -- flag to hold whether this pair has been scored (jumped through)
    self.scored = false

    -- initialize kasaps past the end of the screen
    self.x = VIRTUAL_WIDTH + 32

    -- y value is for the topmost kasap; gap is a vertical shift of the second lower kasap
    self.y = y

    -- instantiate two kasaps that belong to this pair
    self.kasaps = {
        ['upper'] = kasap('top', self.y),
        ['lower'] = kasap('bottom', self.y + kasap_HEIGHT + love.math.random( GAP_HEIGHT, 150 ))
    }

    -- whether this kasap pair is ready to be removed from the scene
    self.remove = false
end

function kasapPair:update(dt)
    -- remove the kasap from the scene if it's beyond the left edge of the screen,
    -- else move it from right to left
    if self.x > -kasap_WIDTH then
        self.x = self.x - kasap_SPEED * dt
        self.kasaps['lower'].x = self.x
        self.kasaps['upper'].x = self.x
    else
        self.remove = true
    end
end

function kasapPair:render()
    for l, kasap in pairs(self.kasaps) do
        kasap:render()
    end
end