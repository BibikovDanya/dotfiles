vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
vim.cmd('set mouse=a')
vim.cmd('set relativenumber')
vim.cmd('set number')
vim.cmd('syntax on')
vim.cmd('set guifont="FiraCode Nerd Font"')





vim.api.nvim_create_autocmd('TextYankPost', {
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})


require("config.lazy")

