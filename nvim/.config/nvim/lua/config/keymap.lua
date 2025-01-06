----------------- keymap -----------------------
-- Shortcut to yanking to the system clipboard
vim.api.nvim_set_keymap('n', '<leader>y', '"+y', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>p', '"+p', { noremap = true, silent = true })

-- highlighting of search results
vim.keymap.set('n', '<esc>', ':nohlsearch<CR>', { noremap = true, silent = true })

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

-- Move highlighted blocks with J and K
vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv")
vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv")


--------------- for plugins ---------------
-- telescope
local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>ff", builtin.find_files, {})
vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})
vim.keymap.set("n", "<leader>ft", builtin.live_grep, {})
vim.keymap.set("n", "<leader>fb", builtin.buffers, {})
vim.keymap.set("n", "<leader>fh", builtin.help_tags, {})

-- neo-tree 
vim.keymap.set("n", "<C-n>", ":Neotree filesystem reveal toggle left<CR>", {})
vim.keymap.set("n", "<leader>bf", ":Neotree buffers reveal toggle float<CR>", {})
