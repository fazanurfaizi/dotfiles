local M = {}

function M.open_floating_term()
  local buf = vim.api.nvim_create_buf(false, true) -- Create a new scratch buffer
  local width = math.floor(vim.o.columns * 0.6) -- 60% of the screen width
  local height = math.floor(vim.o.lines * 0.6) -- 60% of the screen height
  local opts = {
    relative = "editor",
    width = width,
    height = height,
    col = math.floor((vim.o.columns - width) / 2),
    row = math.floor((vim.o.lines - height) / 2),
    style = "minimal",
    border = "rounded",
    title = "Terminal",
    title_pos = "center",
  }

  local win = vim.api.nvim_open_win(buf, true, opts) -- Open the buffer in a floating window
  local colors = require("solarized-osaka.colors").setup()

  vim.opt.mouse = "a" -- enable mouse in floating terminal
  vim.api.nvim_set_option_value("winhl", "Normal:NormalFloat,FloatBorder:FloatBorder", { win = win }) -- Set window highlights
  vim.api.nvim_set_hl(win, "NormalFloat", { bg = colors.base04, fg = colors.base04 })
  vim.api.nvim_set_hl(win, "FloatBorder", { bg = colors.base04, fg = colors.base03 })

  vim.api.nvim_set_option_value("winblend", 10, { win = win })

  vim.fn.termopen(vim.o.shell, {
    on_exit = function()
      vim.opt.mouse = "" -- disable mouse before existing floating window
      vim.api.nvim_win_close(win, true) -- Close the floating window when the terminal exits
    end,
  }) -- Start the terminal in the buffer

  vim.cmd("startinsert")
end

return M
