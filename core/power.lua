local M = {}

M.setup = function()
    hl.config({
        misc = {
            vrr = 1, -- 0: off, 1: on, 2: fullscreen only
            
        },
        render = {
            direct_scanout = true,
            --Lowering blur passes on batter can save gpu cycles
            
        }
    })

    hl.env("AQ_DRM_DEVICES", "/dev/dri/card1:/dev/dri/card0")
end
return M