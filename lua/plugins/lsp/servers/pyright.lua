local util = require("lspconfig.util")

return {
  before_init = function(_, config)
    local root = util.find_git_ancestor(vim.fn.getcwd()) or vim.fn.getcwd()
    local venv = require("custom.find_venv").find_venv_path(root)

    if venv then
      config.settings = config.settings or {}
      config.settings.python = config.settings.python or {}
      config.settings.python.pythonPath = venv .. "/bin/python"
    end
  end,

  settings = {
    python = {
      analysis = {
        typeCheckingMode = "basic",
        autoSearchPaths = true,
        useLibraryCodeForTypes = true,
      },
    },
  },
}
