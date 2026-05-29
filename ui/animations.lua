local M = {}
M.setup = function()
    -- Custom Bezier for that "snappy but soft" landing
    hl.curve("organicSnap", { type = "bezier", points = { {0.34, 1.56}, {0.64, 1} } })

    hl.animation({ leaf = "windows",     enabled = true, speed = 5, bezier = "organicSnap" })
    hl.animation({ leaf = "windowsIn",   enabled = true, speed = 4, bezier = "organicSnap", style = "popin 85%" })
    hl.animation({ leaf = "workspaces",  enabled = true, speed = 6, bezier = "default",      style = "slidefade 20%" })
end
return M