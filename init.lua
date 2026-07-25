vim.opt.tabstop = 4

vim.keymap.set('n', '<A-Left>', ':bprev<CR>')
vim.keymap.set('n', '<A-Right>', ':bnext<CR>')

-- Go
vim.lsp.config['go'] = {
  cmd = { 'gopls' },
  filetypes = { 'go', 'gomod', 'gowork' },
  rootmarkers = { 'go.mod' }
}
vim.lsp.enable('go')

-- Lua
vim.api.nvim_create_autocmd('FileType', {
  pattern = 'lua',
  callback = function()
    vim.bo.expandtab = true
    vim.bo.shiftwidth = 2
    vim.bo.tabstop = 2
  end
})

-- C/C++
vim.lsp.config['c'] = {
  cmd = { 'clangd' },
  filetypes = { 'c', 'cpp' },
  rootmarkers = { 'Makefile' }
}
vim.lsp.enable('c')
vim.api.nvim_create_autocmd('FileType', {
  pattern = { 'c', 'cpp' },
  callback = function()
    vim.bo.cino = ':0'
  end
})

-- Python
vim.lsp.config['python'] = {
  cmd = { 'pylsp' },
  filetypes = { 'python' },
  rootmarkers = { 'requirements.txt' },
  settings = {
    pylsp = {
      plugins = {
        black = { enabled = true },
        isort = { enabled = true }
      }
    }
  }
}
vim.lsp.enable('python')

-- Autoformatting
vim.api.nvim_create_autocmd('BufWritePre', {
  pattern = { '*.go', '*.py' },
  callback = function()
    vim.lsp.buf.format()
  end
})

-- Restore last cursor position when reopening a file
vim.api.nvim_create_autocmd("BufReadPost", {
  callback = function()
    local mark = vim.api.nvim_buf_get_mark(0, '"') -- last-position mark
    local lnum, col = mark[1], mark[2]
    if lnum > 0 and lnum <= vim.api.nvim_buf_line_count(0) then
      pcall(vim.api.nvim_win_set_cursor, 0, {lnum, col})
    end
  end,
})

-- Plugins
vim.pack.add({
  -- Color schemes
  'https://github.com/ayu-theme/ayu-vim',
  'https://github.com/tjammer/blayu.vim',
  'https://github.com/Alligator/accent.vim',
  'https://github.com/jeffkreeftmeijer/vim-dim',
})
-- :lua vim.pack.del(vim.iter(vim.pack.get()):map(function(x) return x.spec.name end):totable())

vim.cmd.colorscheme("ayu")
