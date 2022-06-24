-- this is the entry point and main loop :)

-- glfw object
glfw = require("moonglfw")

-- window object
window = glfw.create_window(640, 480, "Hello world!")

local function my_callback(w, x, y)
    assert(w == window)
    print("cursor position:", x, y)

    if x <= 10 then
        print("Wow!")
    end
end

-- make the window do things when the cursor is inside it
glfw.set_cursor_pos_callback(window, my_callback)

-- keep the window open unless it should close
while not glfw.window_should_close(window) do
    glfw.poll_events()
end