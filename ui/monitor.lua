local M ={}
M.setup = function()
    hl.monitor({
        output   = "eDP-1",
        mode     = "2560x1600@165",
        position = "auto",
        scale    = "1",
    })

    hl.monitor({
        output = "HDMI-A-1",
        mode = "1920x1080@60",
        position = "auto",
        scale = "1",
    })
end
return M