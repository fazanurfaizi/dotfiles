local lspconfig = require("lspconfig")

local mason_packages = vim.fn.stdpath("data") .. "/mason/packages"
local vue_language_server_path = mason_packages .. "/vue-language-server/node_modules/@vue/language-server"

local capabilities = require("blink.cmp").get_lsp_capabilities()

return {
  root_dir = lspconfig.util.root_pattern("tsconfig.json", "package.json", ".git"),

  capabilities = capabilities,

  filetypes = { "typescript", "javascript", "javascriptreact", "typescriptreact", "vue" },

  settings = {
    typescript = {
      tsserver = {
        experimental = {
          enableProjectDiagnostics = true, -- checks referenced projects
        },
      },
      preferences = {
        includePackageJsonAutoImports = "on",
      },
    },
    vtsls = {
      -- Helper to auto-load the workspace TS version if available
      autoUseWorkspaceTsdk = true,

      experimental = {
        completion = {
          enableServerSideFuzzyMatch = true, -- Optional: helps Vtsls match better
        },
      },

      tsserver = {
        globalPlugins = {
          {
            name = "@vue/typescript-plugin",
            location = vue_language_server_path,
            languages = { "vue" },
            configNamespace = "typescript",
            enableForWorkspaceTypeScriptVersions = true,
          },
        },
      },
    },
  },
}
