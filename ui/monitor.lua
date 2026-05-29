local M ={}
M.setup = function()
    hl.monitor({
        output   = "",
        mode     = "2560x1600@165",
        position = "auto",
        scale    = "1",
    })
end
return M