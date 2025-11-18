local M = {}

function M.alembic_command()
  vim.api.nvim_create_user_command("Alembic", function(opts)
    -- Get alembic command arguments
    local args = opts.args
    if args == "" then
      vim.notify("Usage: :Alembic <command>", vim.log.levels.ERROR)
      return
    end

    -- Create Alembic terminal in a new split buffer
    vim.cmd("botright split | resize 15")
    local buf = vim.api.nvim_get_current_buf()
    local term_cmd = "alembic " .. args

    -- Run Alembic command in terminal
    vim.fn.termopen(term_cmd, {
      on_exit = function(_, code)
        if code == 0 then
          vim.api.nvim_buf_set_name(buf, "Alembic ✔")
        else
          vim.api.nvim_buf_set_name(buf, "Alembic ✖")
        end
      end,
    })

    vim.cmd("startinsert") -- go into terminal mode
  end, { nargs = "+", complete = "shellcmd" })
end

return M
