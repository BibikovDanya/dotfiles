set mouse=a  " enable mouse
set encoding=utf-8
set number
set relativenumber
set noswapfile
set scrolloff=7
"set colorcolumn=79

set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set autoindent
set fileformat=unix
filetype indent on      " load filetype-specific indent files

set termguicolors " использовать цвета терминала 
set guifont="FiraCode Nerd Font" "fonts 

" search 
set ignorecase " игнорирует регистр
set smartcase " поиск со смешанным регистром

"Орфография для английского и русского языка
"set spelllang=en,ru
" Даже, если ща русская раскладка, все равно можно вводить любые команды типа
" Ctrl + r и т.д.
"set keymap=russian-jcukenwin
"set iminsert=0  " Чтобы при старте ввод был на английском, а не русском (start > i)
"set imsearch=0  " Чтобы при старте поиск был на английском, а не русском (start > /)
" Подсветка строки, на которой находится курсор
" set cursorline
"set nostartofline
"hi CursorLine cterm=underline
"
" Системный буфер обмена shift - Y / P
noremap <S-Y> "+y


" Пролистнуть на страницу вниз 
"nnoremap <Space> <PageDown> zz
" Пролистнуть на страницу вверх
"nnoremap k<Space> <PageUp> zz


syntax on
" look here  vim ~/.vimrc
"source ~/.vimrc
" for tabulation
set smartindent
set tabstop=2
set expandtab
set shiftwidth=2

inoremap jk <esc>
" turn off search highlight
"nnoremap ,<space> :nohlsearch<CR>
nnoremap <esc><esc> :nohlsearch<CR>

"перемещение выделенных элементов
vnoremap J :m '>+1<CR>gv=gv'
vnoremap K :m '<-2<CR>gv=gv'
" lua:
"vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv")
"vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv")
"

let mapleader = " "

" Netrw file explorer settings
let g:netrw_banner = 0 " hide banner above files
let g:netrw_liststyle = 3 " tree instead of plain view
let g:netrw_browse_split = 3 " vertical split window when Enter pressed on file



" for plug 
"map <Leader>j <Plug>(easymotion-j)
"map <Leader>k <Plug>(easymotion-k)
map <Leader>k <Plug>(easymotion-s)

" for telescope 
" Find files using Telescope command-line sugar.
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>ft <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""PLUG
call plug#begin('~/.vim/plugged')

Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'saadparwaiz1/cmp_luasnip'
Plug 'L3MON4D3/LuaSnip'
Plug 'psf/black', { 'branch': 'stable' }

" color schemas
Plug 'rebelot/kanagawa.nvim'
Plug 'morhetz/gruvbox'
Plug 'mhartington/oceanic-next'  " colorscheme OceanicNext Plug 'kaicataldo/material.vim', { 'branch': 'main' }
Plug 'ayu-theme/ayu-vim'
Plug 'catppuccin/nvim', { 'as': 'catppuccin' }

Plug 'xiyaowong/nvim-transparent'

"Plug 'Pocco81/auto-save.nvim'
Plug 'justinmk/vim-sneak'

Plug 'nvim-lualine/lualine.nvim'

" JS/JSX/TS
"Plug 'pangloss/vim-javascript'
"Plug 'leafgarland/typescript-vim'
"Plug 'peitalin/vim-jsx-typescript'
"Plug 'maxmellon/vim-jsx-pretty'
"/Users/Danya  TS from here https://jose-elias-alvarez.medium.com/configuring-neovims-lsp-client-for-typescript-development-5789d58ea9c
"Plug 'jose-elias-alvarez/null-ls.nvim'
"Plug 'jose-elias-alvarez/nvim-lsp-ts-utils'

" telescope 


"
Plug 'folke/which-key.nvim'

" easymotion
Plug 'easymotion/vim-easymotion'

" telecsope navigation 
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.8' }
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }
Plug 'nvim-lua/plenary.nvim'


call plug#end()




"themes 
"colorscheme ayu
"colorscheme gruvbox
"colorscheme kanagawa-lotus
colorscheme  catppuccin-mocha  "catppuccin " catppuccin-latte, catppuccin-frappe, catppuccin-macchiato, catppuccin-mocha
"
" lualine https://github.com/nvim-lualine/lualine.nvim/blob/master/README.md
"
lua << END
require('lualine').setup{
options = { theme = 'catppuccin',
section_separators = { left =  ' ', right = ' ' },
  component_separators = { left = '❯', right = ' ❮' }},
sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch', 'diff', 'diagnostics'},
    lualine_c = {'filename'},
    lualine_x = { 'filetype'},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  }
}
END

lua << EOF
    vim.o.timeout = true
    vim.o.timeoutlen = 2000
    require("which-key").setup {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    }
EOF


lua << EOF

-- luasnip setup
local luasnip = require 'luasnip'
--local async = require "plenary.async"

-- nvim-cmp setup + lsp pyright
local cmp = require 'cmp'
cmp.setup {
  completion = {
    autocomplete = false
  },
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body)
    end,
  },
  mapping = {
    ['<C-p>'] = cmp.mapping.select_prev_item(),
    ['<C-n>'] = cmp.mapping.select_next_item(),
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.close(),
    ['<CR>'] = cmp.mapping.confirm {
      behavior = cmp.ConfirmBehavior.Replace,
      select = true,
    },
    ['<Tab>'] = function(fallback)
      if vim.fn.pumvisible() == 1 then
        vim.fn.feedkeys(vim.api.nvim_replace_termcodes('<C-n>', true, true, true), 'n')
      elseif luasnip.expand_or_jumpable() then
        vim.fn.feedkeys(vim.api.nvim_replace_termcodes('<Plug>luasnip-expand-or-jump', true, true, true), '')
      else
        fallback()
      end
    end,
    ['<S-Tab>'] = function(fallback)
      if vim.fn.pumvisible() == 1 then
        vim.fn.feedkeys(vim.api.nvim_replace_termcodes('<C-p>', true, true, true), 'n')
      elseif luasnip.jumpable(-1) then
        vim.fn.feedkeys(vim.api.nvim_replace_termcodes('<Plug>luasnip-jump-prev', true, true, true), '')
      else
        fallback()
      end
    end,
  },
  sources = {
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
  },
}

require'lspconfig'.pyright.setup{}


EOF


" Run Python and C files by Ctrl+h
autocmd FileType python map <buffer> <C-h> :w<CR>:exec '!python3.10' shellescape(@%, 1)<CR>
autocmd FileType python imap <buffer> <C-h> <esc>:w<CR>:exec '!python3.10' shellescape(@%, 1)<CR>

autocmd FileType c map <buffer> <C-h> :w<CR>:exec '!gcc' shellescape(@%, 1) '-o out; ./out'<CR>
autocmd FileType c imap <buffer> <C-h> <esc>:w<CR>:exec '!gcc' shellescape(@%, 1) '-o out; ./out'<CR>

autocmd FileType go map <buffer> <C-h> :w<CR>:exec '!go run' shellescape(@%, 1)<CR>
autocmd FileType go imap <buffer> <C-h> <esc>:w<CR>:exec '!go run' shellescape(@%, 1)<CR>

autocmd FileType sh map <buffer> <C-h> :w<CR>:exec '!bash' shellescape(@%, 1)<CR>
autocmd FileType sh imap <buffer> <C-h> <esc>:w<CR>:exec '!bash' shellescape(@%, 1)<CR>

autocmd FileType python set colorcolumn=88

" Telescope fzf plugin
lua << EOF
require('telescope').load_extension('fzf')
EOF
