local M = {}

M.setup = function()
    local mainMod = "SUPER"
    
    -- Programs
    local terminal = "kitty"
    local fileManager = "dolphin"
    local menu = "rofi -show drun"

    -- Core Dispatchers
    hl.bind(mainMod .. " + Q", hl.dsp.exec_cmd(terminal))
    hl.bind(mainMod .. " + C", hl.dsp.window.close())
    -- Systems-first exit: clean shutdown or force exit
    hl.bind(mainMod .. " + M", hl.dsp.exit())
    hl.bind(mainMod .. " + E", hl.dsp.exec_cmd(fileManager))
    hl.bind(mainMod .. " + V", hl.dsp.window.float({ action = "toggle" }))
    hl.bind(mainMod .. " + R", hl.dsp.exec_cmd(menu))
    hl.bind(mainMod .. " + P", hl.dsp.window.pseudo())
    hl.bind(mainMod .. " + J", hl.dsp.layout("togglesplit"))
    hl.bind(mainMod .. " + TAB", hl.dsp.exec_cmd("rofi -show window"))

    -- Focus Movement (Vim-style + Arrows)
    local directions = { left = "left", right = "right", up = "up", down = "down" }
    for key, dir in pairs(directions) do
        hl.bind(mainMod .. " + " .. key, hl.dsp.focus({ direction = dir }))
    end

    -- Workspace Navigation
    for i = 1, 10 do
        local key = i % 10
        hl.bind(mainMod .. " + " .. key, hl.dsp.focus({ workspace = i }))
        hl.bind(mainMod .. " + SHIFT + " .. key, hl.dsp.window.move({ workspace = i }))
    end

    -- Special Workspace (Scratchpad)
    hl.bind(mainMod .. " + S", hl.dsp.workspace.toggle_special("magic"))
    hl.bind(mainMod .. " + SHIFT + S", hl.dsp.window.move({ workspace = "special:magic" }))

    -- Mouse Binds
    hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })
    hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

    -- Multimedia Keys (ThinkPad friendly)
    hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"), { locked = true, repeating = true })
    hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"), { locked = true, repeating = true })
    hl.bind("XF86AudioMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"), { locked = true })
    hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("brightnessctl set 5%+"), { locked = true })
    hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl set 5%-"), { locked = true })
end

return M