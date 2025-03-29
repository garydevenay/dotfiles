local function default_on_attach(_, bufnr)
  local map = function(mode, keys, func)
    vim.keymap.set(mode, keys, func, { buffer = bufnr })
  end

  map("n", "gd", vim.lsp.buf.definition)
  map("n", "K", vim.lsp.buf.hover)
  map("n", "<leader>rn", vim.lsp.buf.rename)
  map("n", "<leader>ca", vim.lsp.buf.code_action)
end

-- Expose shared options to other language modules
local M = {
  on_attach = default_on_attach,
}

-- Load individual LSP configs
require("lsp.zig")(M)

return M

