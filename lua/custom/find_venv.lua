local F = {}

function F.find_venv_path(root)
  -- vim.notify("[find_venv] Searching for .venv in: " .. root, vim.log.levels.INFO)

  -- Check root first
  local venv = root .. "/.venv"
  if vim.fn.isdirectory(venv) == 1 then
    -- vim.notify("[find_venv] Found .venv in root: " .. venv, vim.log.levels.INFO)
    return venv
  end

  -- Check also "venv" (without dot)
  local venv_alt = root .. "/venv"
  if vim.fn.isdirectory(venv_alt) == 1 then
    -- vim.notify("[find_venv] Found venv in root: " .. venv_alt, vim.log.levels.INFO)
    return venv_alt
  end

  -- Search recursively inside subfolders
  local cmd = string.format("find %q -maxdepth 3 -type d -name '.venv' 2>/dev/null", root)
  -- vim.notify("[find_venv] Running command: " .. cmd, vim.log.levels.INFO)

  local handle = io.popen(cmd)
  if handle then
    local result = handle:read("*l")
    handle:close()
    if result and #result > 0 then
      -- vim.notify("[find_venv] Found subfolder venv: " .. result, vim.log.levels.INFO)
      return result
    end
  end

  -- vim.notify("[find_venv] No venv found under: " .. root, vim.log.levels.WARN)
  return nil
end

return F
