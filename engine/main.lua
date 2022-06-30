-- this is the entry point and main loop :)

dofile("helper/dump.lua")

dofile("engine/object_oriented_test.lua")

dofile("engine/component_system.lua")

gl = require("moongl")

-- glfw object
glfw = require("moonglfw")

-- set up glfw basic settings
glfw.window_hint("context version major", 4)
glfw.window_hint("context version minor", 4)
glfw.window_hint("opengl profile", "core")

-- window object
window = glfw.create_window(640, 480, "Hello world!")

glfw.make_context_current(window)

-- initialize opengl into the glfw window
gl.init()

local clear_color = {1.0, 1.0, 1.0, 1.0}

local function my_callback(w, x, y)
    assert(w == window)
    -- print("cursor position:", x, y)

    if x <= 10 then
        -- print("Wow!")
    end
end

-- make the window do things when keys are pressed
glfw.set_key_callback(window,
    function(kwindow, key, scancode, action, shift, control, alt, super)
        
        -- close window
        if key == "escape" then
            glfw.set_window_should_close(window, true)
        end

        -- change clear color debug
        if key == "f1" and action == "press" then
            print("flarl")
            clear_color = {0.0,1.0,1.0,1.0}
        end
    end
)

-- make the window do things when the cursor is inside it
glfw.set_cursor_pos_callback(window, my_callback)

-- keep the window open unless it should close
while not glfw.window_should_close(window) do
    glfw.poll_events()

    gl.clear_color(clear_color[1], clear_color[2], clear_color[3], clear_color[4])

    gl.clear("color", "depth")

    glfw.swap_buffers(window)
end