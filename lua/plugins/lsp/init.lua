local M = {}

M.servers = {
  pyright = require("plugins.lsp.servers.pyright"),
  ruff_lsp = require("plugins.lsp.servers.ruff"),
  clangd = require("plugins.lsp.servers.clangd"),

  omnisharp = require("plugins.lsp.servers.omnisharp"),

  -- vtsls = require("plugins.lsp.servers.vtsls"),
  -- volar = require("plugins.lsp.servers.volar"),

  ts_ls = require("plugins.lsp.servers.ts_ls"),
  vuels = {
    init_options = {
      ignoreProjectWarning = true,
      config = {
        vetur = {
          completion = { autoImport = true, tagCasing = "kebab" },
          validation = { template = true, script = true, style = true },
          -- useWorkspaceDependencies = true,
          experimental = { templateInterpolationService = true },
          grammar = {
            customBlocks = {
              setup = "ignore", -- suppresses TS default-export analysis on <script setup>
            },
          },
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

  intelephense = {
    settings = {
      intelephense = {
        files = {
          maxSize = 5000000,
        },
        environment = {
          phpVersion = "8.4",
        },
      },
    },
  },

  texlab = require("plugins.lsp.servers.texlab"),
}

return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "mason-org/mason.nvim",
      "mason-org/mason-lspconfig.nvim",
    },
    config = function()
      local lspconfig = require("lspconfig")
      local on_attach = require("plugins.lsp.on_attach")

      local has_blink, blink = pcall(require, "blink.cmp")
      if has_blink then
        capabilities = blink.get_lsp_capabilities(capabilities)
      end

      for server, opts in pairs(M.servers) do
        opts.capabilities = vim.tbl_deep_extend("force", capabilities, opts.capabilities or {})
        opts.on_attach = on_attach
        lspconfig[server].setup(opts)
      end
    end,
  },
}
