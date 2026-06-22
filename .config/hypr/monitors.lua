------------------
---- MONITORS ----
------------------
-- See https://wiki.hypr.land/Configuring/Basics/Monitors/

require("hypr.utils")


local system, _, _ = run_cmd("uname -n")
if system == "rem" then
    -- Framework13 with 2.8k display
    hl.monitor({
        output   = "",
        mode     = "2880x1920@120",
        position = "auto",
        scale    = 1.5,
    })
else
    -- Default to auto for other systems
    hl.monitor({
        output   = "",
        mode     = "preferred",
        position = "auto",
        scale    = "auto",
    })
end