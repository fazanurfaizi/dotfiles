local M = {}

function M.cowboy()
  local id
  local pairs = { "h", "j", "k", "l", "+", "-", "Left", "Right", "Up", "Down" }
  local key_status = {} -- Track temporarily disabled keys
  local count = {} -- Track hold count per key

  for _, key in ipairs(pairs) do
    count[key] = 0 -- Initialize count for each key

    vim.keymap.set("n", key, function()
      if key_status[key] then
        return "" -- Key is temporarily disabled
      end

      count[key] = count[key] + 1

      if count[key] >= 10 then
        vim.schedule(function()
          vim.notify("Hold it sir! Key disabled for 2s!", vim.log.levels.WARN, { icon = "🤠", replace = id })
        end)

        key_status[key] = true -- Temporarily disable key

        -- Reset after 2 seconds
        vim.defer_fn(function()
          key_status[key] = nil
          count[key] = 0 -- Reset counter
        end, 2000)

        return key -- Block the key action
      end

      return key -- Allow normal movement
    end, { expr = true, silent = true })

    -- Reset counter when the key is released
    vim.keymap.set("n", key, function()
      count[key] = 0
    end, { silent = true })
  end
end

return M
