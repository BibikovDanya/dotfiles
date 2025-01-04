vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
vim.cmd('set mouse=a')
vim.cmd('set relativenumber')
vim.cmd('set number')
vim.cmd('syntax on')
vim.cmd('set guifont="FiraCode Nerd Font"')


-- Shortcut to yanking to the system clipboard
vim.api.nvim_set_keymap('n', '<leader>y', '"+y', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>p', '"+p', { noremap = true, silent = true })
--vim.keymap.set('n', '<esc>', ':nohlsearch<CR>', { noremap = true, silent = true })
--map <leader>y "+y
--map <leader>p "+
local insert_mode_mappings = {
    {"jk", "<Esc>"},
    {"jj", "<Esc>"},
    {"jJ", "<Esc>"},
    {"Jj", "<Esc>"},
    {"JJ", "<Esc>"},
    {"jk", "<Esc>"},
    {"jK", "<Esc>"},
    {"Jk", "<Esc>"},
    {"JK", "<Esc>"}
}
for _, mapping in ipairs(insert_mode_mappings) do
    vim.api.nvim_set_keymap('i', mapping[1], mapping[2], { noremap = true, silent = true })
end
--inoremap jk <esc>
--inoremap jj <esc>
--inoremap jJ <esc>
--inoremap Jj <esc>
--inoremap JJ <esc>
--inoremap jk <esc>
--inoremap jK <esc>
--inoremap Jk <esc>
--inoremap JK <esc>



require("config.lazy")
--require("config.lazy").setup("plugins")

--require('lazy').setup('config')
--require'lazy'.setup'config'
--require'lazy'.setup'plugins'
--require'config'
