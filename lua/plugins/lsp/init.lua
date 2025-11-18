local M = {}

M.servers = {
  pyright = require("plugins.lsp.servers.pyright"),
  ruff_lsp = require("plugins.lsp.servers.ruff"),
  ts_ls = require("plugins.lsp.servers.ts_ls"),
  -- volar = require("plugins.lsp.servers.volar"),

  vuels = {
    init_options = {
      ignoreProjectWarning = true,
      config = {
        vetur = {
          completion = { autoImport = true, tagCasing = "kebab" },
          validation = { template = true, script = true, style = true },
          -- useWorkspaceDependencies = true,
          experimental = { templateInterpolationService = true },
        },
      },
    },
  },

  -- web related LSP
  eslint = require("plugins.lsp.servers.web").eslint,
  tailwindcss = require("plugins.lsp.servers.web").tailwindcss,
  cssls = require("plugins.lsp.servers.web").cssls,
  jsonls = require("plugins.lsp.servers.web").jsonls,
  html = require("plugins.lsp.servers.web").html,
  emmet_ls = require("plugins.lsp.servers.web").emmet_ls,

  texlab = require("plugins.lsp.servers.texlab"),
}

return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
    },
    config = function()
      local lspconfig = require("lspconfig")
      local capabilities = require("blink.cmp").get_lsp_capabilities()
      local on_attach = require("plugins.lsp.on_attach")

      for server, opts in pairs(M.servers) do
        opts.capabilities = vim.tbl_deep_extend("force", capabilities, opts.capabilities or {})
        opts.on_attach = on_attach
        lspconfig[server].setup(opts)
      end
    end,
  },
}
