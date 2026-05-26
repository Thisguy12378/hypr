local M = {}
M.setup = function()
    hl.config({
        decoration = {
            rounding = 10,
            
            blur = {
                enabled = true,
                size = 8,
                passes = 3,
                new_optimizations = true,
                ignore_opacity = true,
            },

            shadow = {
                enabled = true,
                range = 20,
                render_power = 3,
                color = "rgba(000000aa)",
            }
        },
        general = {
            border_size = 2,
            col = {
                -- Pure white to cyan gradient for maximum contrast
                active_border = { 
                    colors = {"rgba(ffffffff)", "rgba(00ffffee)"}, 
                    angle = 45 
                },
                inactive_border = "rgba(222222aa)",
            }
        }
    })
end
return M