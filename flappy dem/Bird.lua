--[[
    Bird Class
    Author: Colton Ogden
    cogden@cs50.harvard.edu

    The Bird is what we control in the game via clicking or the space bar; whenever we press either,
    the bird will flap and go up a little bit, where it will then be affected by gravity. If the bird hits
    the ground or a pipe, the game is over.
]]



GRAVITY = 9

Bird = Class{}

--[[
    AABB collision that expects a pipe, which will have an X and Y and reference
    global pipe width and height values.
]]


function Bird:init()
    self.image = love.graphics.newImage('dem2.png')
    self.x = VIRTUAL_WIDTH / 2 - 8
    self.y = VIRTUAL_HEIGHT / 2 - 8

    self.width = self.image:getWidth()
    self.height = self.image:getHeight()

    self.dy = 0
end

--[[
    AABB collision that expects a pipe, which will have an X and Y and reference
    global pipe width and height values.
]]
function Bird:collides(pipe)
    -- the 2's are left and top offsets
    -- the 4's are right and bottom offsets
    -- both offsets are used to shrink the bounding box to give the player
    -- a little bit of leeway with the collision
    if (self.x + 2) + (self.width - 4) >= pipe.x and self.x + 2 <= pipe.x + PIPE_WIDTH then
        if (self.y + 2) + (self.height - 4) >= pipe.y and self.y + 2 <= pipe.y + PIPE_HEIGHT then
            return true
        end
    end

    return false
end

local x = 1

function Bird:update(dt)
    self.dy = self.dy + GRAVITY * dt

    -- burst of anti-gravity when space or left mouse are pressed
    if love.keyboard.wasPressed('space') or love.mouse.wasPressed(1) then
        self.dy = -2
        if x == 1 then
            sounds['jump1']:play()
            x = x + 1
        elseif x == 2 then
            sounds['jump2']:play()
            x = x + 1
        elseif x == 3 then
            sounds['jump3']:play()
            x = x + 1
        elseif x == 4 then
            sounds['jump4']:play()
            x = x + 1
        elseif x == 5 then
            sounds['jump5']:play()
            x = x + 1
        elseif x == 6 then
            sounds['jump6']:play()
            x = x + 1
        elseif x == 7 then
            sounds['jump7']:play()
            x = x + 1
        elseif x == 8 then
            sounds['jump8']:play()
            x = x + 1
        elseif x == 9 then
            sounds['jump9']:play()
            x = x + 1
        elseif x == 10 then
            sounds['jump10']:play()
            x = 1
        end
    end

    self.y = self.y + self.dy
end

function Bird:render()
    love.graphics.draw(self.image, self.x, self.y)
end