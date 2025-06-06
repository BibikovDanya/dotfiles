----------------- keymap -----------------------
-- Shortcut to yanking to the system clipboard
vim.keymap.set('n', '<leader>y', '"+y', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>p', '"+p', { noremap = true, silent = true })

vim.keymap.set('v', '<leader>y', '"+y', { noremap = true, silent = true })
vim.keymap.set('v', '<leader>p', '"+p', { noremap = true, silent = true })

-- highlighting of search results
vim.keymap.set('n', '<esc>', ':nohlsearch<CR>', { noremap = true, silent = true })

local insert_mode_mappings = {
  { "jk", "<Esc>" },
  { "jj", "<Esc>" },
  { "jJ", "<Esc>" },
  { "Jj", "<Esc>" },
  { "JJ", "<Esc>" },
  { "jk", "<Esc>" },
  { "jK", "<Esc>" },
  { "Jk", "<Esc>" },
  { "JK", "<Esc>" }
}
for _, mapping in ipairs(insert_mode_mappings) do
  vim.api.nvim_set_keymap('i', mapping[1], mapping[2], { noremap = true, silent = true })
end

-- Move highlighted blocks with J and K
vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv")
vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv")

-- Open filebar
vim.keymap.set('n', '<leader>pv', vim.cmd.Ex)

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
--vim.keymap.set("n", "<leader>gs", ":Neotree float git_status<CR>", {})

-- vim-lspconfig
vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, {})
vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})
vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, {})
vim.keymap.set("n", "<leader>ll", vim.lsp.buf.format, {})
vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, {})
vim.keymap.set('n', '<space>re', vim.lsp.buf.rename, {})

-- fugitive
vim.keymap.set("n", "<leader>gs", vim.cmd.Git)
-- gitsigns
vim.keymap.set("n", "<leader>gp", ":Gitsigns preview_hunk<CR>", {})
vim.keymap.set("n", "<leader>ga", ":Gitsigns toggle_current_line_blame<CR>", {})

-- vim-test
vim.keymap.set("n", "<leader>t", ":TestNearest<CR>", {})
vim.keymap.set("n", "<leader>T", ":TestFile<CR>", {})
vim.keymap.set("n", "<leader>a", ":TestSuite<CR>", {})
vim.keymap.set("n", "<leader>l", ":TestLast<CR>", {})
vim.keymap.set("n", "<leader>g", ":TestVisit<CR>", {})
vim.cmd("let test#strategy = 'vimux'")
