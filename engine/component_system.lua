-- ecs base class

local ecs = {}

-- constructor

function ecs:new(object)
    object = object or {}

    setmetatable(object, self)

    self.__index = self

    return object
end

-- component addons

function ecs:add_component(component)
    if not self[component] then
        self[component] = {}
    end
end

-- bulk component addons

function ecs:add_components(component_table)
    for key,value in pairs(component_table) do
        if not self[value] then
            self[value] = {}
        end
    end
end


-- testing

local my_ecs = ecs:new()

my_ecs:add_component("life")

my_ecs:add_components({
    "life2",
    "documents",
    "x",
    "y",
    "pos",
    "distance"
})



print(dump(my_ecs))

