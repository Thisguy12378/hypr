local M = {}
M.setup = function()
    -- Float the apps launched from Waybar
    hl.window_rule({
        name = "float-system-tools",
        match = { class = "float_system_monitor" },
        float = true,
        size = "900 600",
        center = true
    })

    hl.window_rule({
        name = "float-audio",
        match = { class = "pavucontrol" },
        float = true,
        size = "700 450",
        center = true
    })

    -- Add to your M.setup function
    hl.window_rule({
        name = "float-network",
        match = { class = "float_network" },
        float = true,
        size = "700 500",
        center = true
    })

    hl.window_rule({
        name = "float-bluetooth",
        match = { class = "blueman-manager" },
        float = true,
        center = true
    })

    -- Add these to your events/rules.lua
    hl.layer_rule({
        match = { namespace = "swaync" },
        blur = true,
        ignore_alpha = true,
    })
end
return M