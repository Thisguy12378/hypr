local M = {}
M.setup = function()
    hl.config({
        general = {
            gaps_in = 6,
            gaps_out = 12,
            border_size = 2,
            col = {
                -- Sharp white fading into a deep accent
                active_border = { 
                    colors = {"rgba(ffffffff)", "rgba(00ffffee)"}, 
                    angle = 30 
                },
                inactive_border = "rgba(1a1a1aee)",
            },
            layout = "dwindle",
        },
        misc = {
            force_default_wallpaper = 0,
            disable_hyprland_logo = true,
            font_family = "Inter", -- Or your preferred UI font
        }
    })
end
return M