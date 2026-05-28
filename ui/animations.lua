local M = {}
M.setup = function()
    hl.curve("organicSnap", { type = "bezier", points = { {0.34, 1.56}, {0.64, 1} } })
    hl.curve("softFade",    { type = "bezier", points = { {0.25, 0.1},  {0.25, 1} } })

    hl.animation({ leaf = "windows",    enabled = true, speed = 4,   bezier = "organicSnap" })
    hl.animation({ leaf = "windowsIn",  enabled = true, speed = 3.5, bezier = "organicSnap", style = "popin 88%" })
    hl.animation({ leaf = "windowsOut", enabled = true, speed = 3,   bezier = "softFade",    style = "popin 80%" })
    hl.animation({ leaf = "workspaces", enabled = true, speed = 5,   bezier = "softFade",    style = "slidefade 15%" })
    hl.animation({ leaf = "layers",     enabled = true, speed = 3,   bezier = "softFade",    style = "fade" })
end
return M