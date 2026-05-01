--[[
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
]]

vim.keymap.set('n', '<A-Left>', ':bprev<CR>')
vim.keymap.set('n', '<A-Right>', ':bnext<CR>')

-- Go
vim.api.nvim_create_autocmd('FileType', {
  pattern = { 'go', 'gomod', 'godoc' },
  command = 'setlocal noexpandtab shiftwidth=4 tabstop=4'
})
vim.lsp.config['go'] = {
  cmd = { 'gopls' },
  filetypes = { 'go', 'gomod', 'gowork', 'gotmpl' },
  rootmarkers = { 'go.mod' }
}
vim.lsp.enable('go')

-- Lua
vim.api.nvim_create_autocmd('FileType', {
  pattern = 'lua',
  command = 'setlocal expandtab shiftwidth=2 tabstop=2'
})

-- Autoformatting
vim.api.nvim_create_autocmd('BufWritePre', {
  pattern = '*.go',
  callback = function()
    vim.lsp.buf.format()
  end
})
