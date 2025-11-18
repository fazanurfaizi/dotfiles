local M = {}

M.manual_root = nil

function M.set_root(path)
  path = vim.fn.fnamemodify(path, ":p")
  M.manual_root = path

  -- Change local directory for neovim
  vim.cmd("lcd " .. path)

  vim.notify("Root set to: " .. path, vim.log.levels.INFO)

  -- Restart all active LSPs with new root
  for _, client in pairs(vim.lsp.get_clients()) do
    client.stop()
  end

  vim.defer_fn(function()
    local buf = vim.api.nvim_get_current_buf()
    local name = vim.api.nvim_buf_get_name(buf)

    if name ~= "" then
      vim.cmd("edit") -- reload current file
    end
  end, 50)
end

-- Override root_dir when LSP initializes
function M.get_root_dir(fallback)
  return function(fname)
    if M.manual_root then
      return M.manual_root
    end
    return fallback(fname)
  end
end

function M.set_root_command()
  vim.api.nvim_create_user_command("SetRoot", function(opts)
    -- Get alembic command arguments
    local root = opts.args

    if root == "" then
      vim.notify("Usage: :SetRoot <path>", vim.log.levels.ERROR)
      return
    end

    M.set_root(root)
  end, { nargs = 1, complete = "file" })
end

return M
