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

        assert(value ~= "entity_count", "entity_count is a reserved key word for ecs")

        assert(value ~= nil or type(value) ~= "string", "ecs key word must be a string")

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

    for key,_ in pairs(self) do

        -- don't utilize ecs builder

        if key ~= "entity_count" then

            local new_value = component_variable_table[key]

            -- undefined - false
            if new_value == nil then
                component_variable_table[table] = false

            -- defined - intake
            else
                self[key][self.entity_count] = new_value
            end

        end
    end
end


-- testing

local my_ecs = ecs:new()

my_ecs:add_component("life")

my_ecs:add_components({"stars"})


my_ecs:add_entity({
    life = "gold",
    stars = "ye"
})

print(dump(my_ecs))

