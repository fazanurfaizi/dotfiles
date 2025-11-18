return function(client, bufnr)
  local bind = function(mode, lhs, rhs)
    vim.keymap.set(mode, lhs, rhs, { buffer = bufnr })
  end

  bind("n", "gd", vim.lsp.buf.definition)
  bind("n", "K", vim.lsp.buf.hover)
  bind("n", "gr", vim.lsp.buf.references)
  bind("n", "<leader>rn", vim.lsp.buf.rename)
  bind("n", "<leader>ca", vim.lsp.buf.code_action)
end
