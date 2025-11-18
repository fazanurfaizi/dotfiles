return {
  init_options = {
    vue = {
      hybridMode = true,
    },
  },
  handlers = {
    ["textDocument/publishDiagnostics"] = function() end,
  },
}
