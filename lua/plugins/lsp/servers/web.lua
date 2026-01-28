local util = require("lspconfig.util")

return {
  tailwindcss = {},
  cssls = {},
  jsonls = {},
  html = {
    filetypes = { "html", "jinja", "jinja2" },
  },
  emmet_ls = {
    filetypes = { "html", "jinja", "jinja2" },
  },
  eslint = {
    root_dir = util.root_pattern(
      ".eslintrc",
      ".eslintrc.js",
      ".eslintrc.cjs",
      ".eslintrc.yaml",
      ".eslintrc.json",
      "package.json",
      ".git"
    ),
    settings = {
      run = "onSave",
      workingDirectory = { mode = "auto" },
    },
    flags = {
      debounce_text_changes = 1000,
      allow_incremental_sync = false,
    },
  },
}
