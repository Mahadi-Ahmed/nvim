local lsp = require('lsp-zero')

lsp.preset("recommended")

lsp.ensure_installed({
  'tsserver',
  'eslint',
  'lua_ls'
})

-- Fix Undefined global 'vim'
lsp.configure('lua_ls', {
    settings = {
        Lua = {
            diagnostics = {
                globals = { 'vim' }
            }
        }
    }
})

lsp.on_attach(function(client, bufnr)
  local opts = {buffer = bufnr, remap = false}

  vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
  vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
  vim.keymap.set("n", "<leader>lw", function() vim.lsp.buf.workspace_symbol() end, opts)
  vim.keymap.set("n", "<leader>li", function() vim.lsp.buf.declaration() end, opts)
  vim.keymap.set("n", "<leader>lo", function() vim.diagnostic.open_float() end, opts)
  vim.keymap.set("n", "<leader>lj", function() vim.diagnostic.goto_next() end, opts)
  vim.keymap.set("n", "<leader>lk", function() vim.diagnostic.goto_prev() end, opts)
  vim.keymap.set("n", "<leader>la", function() vim.lsp.buf.code_action() end, opts)
  vim.keymap.set("n", "<leader>lR", function() vim.lsp.buf.references() end, opts)
  vim.keymap.set("n", "<leader>lr", function() vim.lsp.buf.rename() end, opts)
  vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
  vim.keymap.set("n", "<leader>lf", function() vim.lsp.buf.format({async = true}) end, opts)
end)

lsp.setup()

vim.diagnostic.config({
    virtual_text = true,
})
