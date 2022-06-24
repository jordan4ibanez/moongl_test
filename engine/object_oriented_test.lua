--[[
if you are wondering what this is

i have never actually programmed pure OOP in lua before

this is a learning experience within a learning experience for me

if you are reading this, I hope you enjoy it at least
]]


-- type 1, multiline
-- this is like a hybrid between Lua and Java

-- class
my_object_multiline = {x = 0, y = 0, friendly = false}

-- derive class method new

function my_object_multiline:new(object, x, y, friendly)
    -- we create a blank object, it is a table
    object = object or {}

    -- notifying lua that this is an independant object
    setmetatable(object, self)
    self.__index = self

    self.x = x or 0
    self.y = y or 0

    self.friendly = friendly or false

    -- an additional component
    -- distance from center point of origin

    local distance_x = 0 - self.x
    local distance_y = 0 - self.y


    -- basic geometry calculation
    
    self.distance_from_center = math.sqrt(
        distance_x * distance_x + distance_y * distance_y
    )
    
    return object
end

-- derive class method print distance

function my_object_multiline:print_distance_from_center()
    print("the distance from center is: " .. tostring(self.distance_from_center))
end



-- type 2 - consolidated table

-- this is extremely common in Minetest mods


my_object = {
    x = 0,
    y = 0,
    friendly = false,
    new = function(self, object, x, y, friendly)
        -- we create a blank object, it is a table
        object = object or {}
    
        -- notifying lua that this is an independant object
        setmetatable(object, self)
        self.__index = self
    
        self.x = x or 0
        self.y = y or 0
    
        self.friendly = friendly or false
    
        -- an additional component
        -- distance from center point of origin
    
        local distance_x = 0 - self.x
        local distance_y = 0 - self.y
    
        -- basic geometry calculation
        
        self.distance_from_center = math.sqrt(
            distance_x * distance_x + distance_y * distance_y
        )

        return object
    end,
    
    print_distance_from_center = function(self)
        print("the distance from center is: " .. tostring(self.distance_from_center))
    end
}


-- type 3 - full Java style

JavaObject = {


    -- object fields

    x = 0;
    y = 0;

    -- constructor

    new = function(self,object, x, y, friendly)
        -- we create a blank object, it is a table
        object = object or {};
    
        -- notifying lua that this is an independant object
        setmetatable(object, self);
        self.__index = self;
    
        self.x = x or 0;
        self.y = y or 0;
    
        self.friendly = friendly or false;
    
        -- an additional component
        -- distance from center point of origin
    
        local distance_x = 0 - self.x;
        local distance_y = 0 - self.y;
    
        -- basic geometry calculation
        
        self.distanceFromCenter = math.sqrt(
            distance_x * distance_x + distance_y * distance_y
        );

        return(object);
    end;

    printDistanceFromCenter = function(self)
        print("the distance from center is: " .. tostring(self.distanceFromCenter))
    end;

}


local test_object_multiline = my_object_multiline:new(nil,1,4,false)

local test_object_consolidated = my_object:new(nil,1,24,false)

local testObjectJava = JavaObject:new(nil, 1,9,false)


test_object_multiline:print_distance_from_center()

test_object_consolidated:print_distance_from_center()

testObjectJava:printDistanceFromCenter()