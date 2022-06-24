-- ecs base class

local ecs = {}

-- constructor

function ecs:new(object)
    object = object or {}

    setmetatable(object, self)

    self.__index = self

    self.entity_count = 0

    return object
end

-- component addons

function ecs:add_component(component)

    assert(component ~= "entity_count", "entity_count is a reserved key word for ecs")

    assert(component ~= nil or type(component) ~= "string", "ecs key word must be a string")

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

-- entity creation system
function ecs:add_entity(component_variable_table)

    -- skip having to count internal tables

    self.entity_count = self.entity_count + 1

    -- dynamic calculation of missing variables

    local component_list = {}

    for key,_ in pairs(self) do
        table.insert(component_list, key)
    end

    -- insert defined values

    for key,value in pairs(component_variable_table) do
        self[key] = value

        component_list[key] = nil
    end

end


-- testing

local my_ecs = ecs:new()

my_ecs:add_component("life")

-- my_ecs:add_components({})

my_ecs:add_entity({
    life = true
})



print(dump(my_ecs))

