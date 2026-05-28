local M = {}
M.setup = function()
    hl.config({
        general = {
            gaps_in  = 4,   -- tighter inner gaps for a cleaner layout
            gaps_out = 10,
            border_size = 2,
            col = {
                active_border = {
                    -- sky blue → torii red-orange, matching the wallpaper
                    colors = { "rgba(5BA4CFff)", "rgba(C0634Aff)" },
                    angle  = 45,
                },
                inactive_border = "rgba(8A9BA855)",
            },
            layout = "dwindle",
        },
        misc = {
            force_default_wallpaper = 0,
            disable_hyprland_logo   = true,
            font_family             = "JetBrains Mono NF",
        },
    })
end
return M