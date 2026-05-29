local M = {}
M.setup = function()
    hl.config({
        decoration = {
            rounding = 14,  -- rounder corners = more anime/friendly feel

            blur = {
                enabled           = true,
                size              = 6,
                passes            = 3,
                new_optimizations = true,
                ignore_opacity    = true,
                xray              = false,
            },

            shadow = {
                enabled      = true,
                range        = 16,
                render_power = 2,
                -- soft blue-grey shadow instead of pure black
                color        = "rgba(5B7A9444)",
            },
        },
        general = {
            border_size = 2,
            col = {
                active_border = {
                    colors = { "rgba(5BA4CFff)", "rgba(C0634Aff)" },
                    angle  = 45,
                },
                inactive_border = "rgba(8A9BA855)",
            },
        },
    })
end
return M