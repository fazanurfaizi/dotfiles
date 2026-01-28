local ok, omnisharp_ext = pcall(require, "omnisharp_extended")
local util = require("lspconfig.util")

return {
  -- cmd = { "omnisharp" },

  enable_roslyn_analyzers = true,
  enable_import_completion = true,
  organize_imports_on_format = true,
  enable_editorconfig_support = true,

  -- If omnisharp_extended is installed, use its handlers (great for Go To Definition)
  handlers = ok and {
    ["textDocument/definition"] = omnisharp_ext.definition_handler,
    ["textDocument/typeDefinition"] = omnisharp_ext.type_definition_handler,
    ["textDocument/references"] = omnisharp_ext.references_handler,
    ["textDocument/implementation"] = omnisharp_ext.implementation_handler,
  } or {},

  settings = {
    FormattingOptions = {
      EnableEditorConfigSupport = true,
      OrganizeImports = true,
    },
    RoslynExtensionsOptions = {
      EnableAnalyzersSupport = true,
      EnableImportCompletion = true,
    },
    MsBuild = {
      LoadProjectsOnDemand = false,
    },
    Sdk = {
      IncludePrereleases = true,
    },
  },

  -- Ensure we find the solution file to load the project correctly
  root_dir = function(fname)
    return util.root_pattern("*.sln", "*.csproj", "omnisharp.json", "function.json")(fname)
      or util.find_git_ancestor(fname)
  end,
}
