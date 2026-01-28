return {
  cmd = {
    "clangd",
    "--background-index",
    "--clang-tidy",

    -- 1. LINTING CONFIG (Clang-Tidy)
    -- Enable/Disable checks directly here.
    -- Syntax: comma-separated list. Use '-' to disable.
    "--clang-tidy-checks=bugprone-*,modernize-*,performance-*,readability-*,-modernize-use-trailing-return-type",

    -- 2. FORMATTING CONFIG (Clang-Format)
    -- We pass a YAML string to --fallback-style.
    -- This sets your "Global Default" format style.
    -- (Note: 'IndentWidth: 4' is standard for C++, but you can change it to 2 if you prefer)
    "--fallback-style={BasedOnStyle: Google, IndentWidth: 4, ColumnLimit: 120, BreakBeforeBraces: Attach, AllowShortFunctionsOnASingleLine: Empty}",

    "--header-insertion=iwyu",
    "--completion-style=detailed",

    "--function-arg-placeholders=1",
  },
  init_options = {
    usePlaceholders = true,
    completeUnimported = true,
    clangdFileStatus = true,
  },
  capabilities = {
    offsetEncoding = { "utf-16" },
  },
}
