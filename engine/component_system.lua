local table_remove, table_insert
=
      table.remove, table.insert


-- ecs base class

ecs = {}

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

    assert(type(component) == "string", "ecs key word must be a string")

    assert(component ~= nil, "nil keyword for ecs")



    if not self[component] then
        self[component] = {}
    end
end

-- bulk component addons

function ecs:add_components(component_table)
    for key,value in pairs(component_table) do

        assert(value ~= "entity_count", "entity_count is a reserved key word for ecs")

        assert(type(value) == "string", "ecs key word must be a string")

        assert(value ~= nil, "nil keyword for ecs")

        if not self[value] then
            self[value] = {}
        end
    end
end

-- allows you to get the component table

function ecs:get_component(component)
    if self[component] then
        return self[component]
    else
        return nil
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
                new_value = false
            end

            table_insert(self[key], new_value)

        end
    end
end

-- entity destruction system
function ecs:remove_entity(index)

    -- do not allow out of bounds

    assert(index <= self.entity_count and index > 0, "trying to remove entity that does not exist!")

    for key,table in pairs(self) do
        if key ~= "entity_count" then
            table_remove(table, index)
        end
    end

    self.entity_count = self.entity_count - 1
end


-- testing

local my_ecs = ecs:new()

my_ecs:add_components({
    "name", "order"
})


my_ecs:add_entity({
    name = "entity_1",
    order = 1
})

my_ecs:add_entity({
    name = "entity_2",
    order = 2
})

my_ecs:add_entity({
    name = "entity_0",
    order = -1
})

my_ecs:remove_entity(1)

my_ecs:add_entity({
    name = "GOOBER",
    order = -1000
})

dump_ecs(my_ecs)

for index, value in ipairs(my_ecs.name) do
    -- print(index)
end

-- print(dump(my_ecs))


-- basic system test

function test_my_ecs()
    local ordering = my_ecs:get_component("order")

    for key,value in ipairs(ordering) do
        print(key .. " | " .. tostring(value))
    end
end


local complete = false