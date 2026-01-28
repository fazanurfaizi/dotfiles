return {
  {
    "saghen/blink.cmp",
    version = "v0.*",
    opts = function(_, opts)
      -- Merge user settings with default opts
      opts = vim.tbl_deep_extend("force", opts or {}, {
        sources = {
          default = {
            "lsp",
            "path",
            "snippets",
            "buffer",
          },
        },
        signature = { enabled = true },
        keymap = {
          preset = "default",
          ["<Tab>"] = { "select_next", "fallback" },
          ["<S-Tab>"] = { "select_prev", "fallback" },
          ["<CR>"] = { "accept", "fallback" },
        },
      })

      -- FORCE disable cmdline and clear its keymaps to prevent "table expected, got boolean" error
      -- This error often happens if a preset or inherited config has an invalid boolean entry
      opts.cmdline = {
        enabled = false,
        keymap = {}, -- Empty table ensures validation passes
      }

      return opts
    end,
  },
}
