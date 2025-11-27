" Basic .vimrc
" This is meant to be a solid sensible default. Customize to taste.
set nocompatible
filetype plugin indent on
syntax on

" Appearance
set number relativenumber
set cursorline
set showmode
set showcmd
set laststatus=2

" Tabs and indentation
set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4
set autoindent
set smartindent

" Searching
set ignorecase
set smartcase
set incsearch
set hlsearch

" Clipboard & copy/paste
if has('clipboard')
  set clipboard+=unnamedplus
endif

" UI
set mouse=a
set signcolumn=yes
set termguicolors

" Performance
set updatetime=300
set timeoutlen=500

" Leader key
let mapleader=","  " comma as leader for convenience

" Mappings
" Use jk to exit insert mode
inoremap jk <Esc>

" Quick save/quit
nnoremap <leader>w :w<CR>
nnoremap <leader>q :q<CR>

" Toggle NERDTree (if installed)
nnoremap <leader>n :NERDTreeToggle<CR>

" FZF, ack, ripgrep usage (if installed)
if executable('rg')
  " Use ripgrep for :Rg if you have fzf.vim or projectsearch plugins installed
endif

" Plugin manager (vim-plug fallback)
if empty(glob('~/.vim/autoload/plug.vim'))
  " If user hasn't installed vim-plug, explain in README; don't auto-download here
endif

" Plugins (uncomment & use a plugin manager like vim-plug)
" call plug#begin('~/.vim/plugged')
" Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
" Plug 'junegunn/fzf.vim'
" Plug 'tpope/vim-fugitive'
" Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Plug 'vim-airline/vim-airline'
" Plug 'preservim/nerdtree'
" call plug#end()

" Coc.nvim basic keymaps (if used)
" inoremap <silent><expr> <Tab> pumvisible() ? '<C-n>' : '<Tab>'
" inoremap <silent><expr> <S-Tab> pumvisible() ? '<C-p>' : '<S-Tab>'

" Use system clipboard for yank/paste on Linux & macOS
vnoremap <leader>y "*y
nnoremap <leader>y "*y
nnoremap <leader>p "*p

" Diagnostics: quickfix toggle
nnoremap <leader>c :copen<CR>

" End of .vimrc
