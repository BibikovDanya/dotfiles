vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.o.termguicolors = true
vim.opt.showmode = false -- Duplicated lualine
vim.opt.cursorline = true

vim.cmd('set mouse=a')
vim.opt.relativenumber = true
vim.cmd('set number')
vim.cmd('syntax on')
vim.cmd('set guifont="FiraCode Nerd Font"')



-- Tab settings
vim.opt.smartindent = true -- indentation depending on the code structure
vim.cmd("set expandtab") --Expand tabs to the proper type and size
vim.cmd("set tabstop=4")
vim.cmd("set softtabstop=4")
vim.cmd("set shiftwidth=2")

-- Search settings
vim.cmd("set ignorecase") -- Ignore casing of searches
vim.cmd("set smartcase") -- Be smart about case sensitivity when searching

vim.cmd("set noswapfile")
vim.cmd("set scrolloff=7")



vim.api.nvim_create_autocmd('TextYankPost', {
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})


require("config.lazy")
require("config.keymap")
