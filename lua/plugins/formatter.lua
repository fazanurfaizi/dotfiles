return {
  "stevearc/conform.nvim",
  opts = {
    formatters_by_ft = {
      --------------------------------------------------------------------
      -- PYTHON
      --------------------------------------------------------------------
      python = {
        "ruff_fix", -- autofix
        "ruff_format", -- code formatting
      },

      --------------------------------------------------------------------
      -- TYPESCRIPT / JAVASCRIPT
      --------------------------------------------------------------------
      -- javascript = { "prettier" },
      -- javascriptreact = { "prettier" },
      -- typescript = { "prettier" },
      -- typescriptreact = { "prettier" },

      --------------------------------------------------------------------
      -- VUE 3
      --------------------------------------------------------------------
      -- vue = { "prettier" },

      --------------------------------------------------------------------
      -- WEB
      --------------------------------------------------------------------
      html = { "prettier" },
      css = { "prettier" },
      scss = { "prettier" },
      json = { "prettier" },
      yaml = { "prettier" },
      markdown = { "prettier" },

      -- Everything else falls back here:
      -- ["*"] = { "prettier" },
    },

    -- FORMATTER DEFINITIONS
    -- formatters = {
    --------------------------------------------------------------------
    -- PRETTIER (global override)
    --------------------------------------------------------------------
    -- prettier = {
    --   prepend_args = {
    --     "--no-trim-final-newlines",
    --   },
    -- },

    --------------------------------------------------------------------
    -- RUFF FORMATTERS
    --------------------------------------------------------------------
    ruff_fix = {
      command = "ruff",
      args = { "check", "--fix", "--stdin-filename", "$FILENAME", "-" },
      stdin = true,
    },
    ruff_format = {
      command = "ruff",
      args = { "format", "--stdin-filename", "$FILENAME", "-" },
      stdin = true,
    },
    -- },
    -- formatters = {
    --   ruff_fix = {
    --     command = "ruff",
    --     args = {
    --       "check",
    --       "--fix",
    --       "--line-length=120",
    --       -- "--select=E,F,UP,B,SIM,I",
    --       -- "--ignore=E501,E701,E722,B904,E402,B008,SIM113",
    --       "--stdin-filename",
    --       "$FILENAME",
    --       "-",
    --     },
    --     stdin = true,
    --   },
    --
    --   ruff_format = {
    --     command = "ruff",
    --     args = {
    --       "format",
    --       "--line-length=120",
    --       "--indent-width=2",
    --       "--stdin-filename",
    --       "$FILENAME",
    --       "-",
    --     },
    --     stdin = true,
    --   },
    -- },

    -- Stop running formatters after the first successful one
    stop_after_first = true,
  },
}
