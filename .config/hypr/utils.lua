-------------------
---- UTILITIES ----
-------------------


--- Trim leading and trailing whitespace.
---@param s string Input string.
---@return string trimmed String without leading/trailing whitespace.
function trim(s)
    return (s:gsub("^%s*(.-)%s*$", "%1"))
end

--- Run shell command and capture stdout/stderr text.
--- Output is trimmed by caller if needed.
---@param cmd string Command to execute.
---@return string|nil out Command output when process starts (may be empty string).
---@return string|nil reason nil on success, "spawn failed" if process creation fails, otherwise close reason such as "exit" or "signal".
---@return integer|string|nil code Exit status on command failure, 0 on success, or spawn error text when process creation fails.
function run_cmd(cmd)
  local h, err = io.popen(cmd .. " 2>&1", "r")
  if not h then
    return nil, "spawn failed", err
  end

  local out = h:read("*a")
  local ok, why, code = h:close()  -- why/code may vary by Lua version
  if ok then
    return trim(out), nil, 0
  end
  return trim(out), why or "exit", code or 1
end