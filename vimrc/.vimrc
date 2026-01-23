"===============================
" VUNDLE SETUP
"===============================
set nocompatible              " Required
filetype off                  " Required

" Set the runtime path to include Vundle
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Let Vundle manage Vundle
Plugin 'VundleVim/Vundle.vim'

" === Colorscheme ===
Plugin 'catppuccin/vim', {'name': 'catppuccin'}

" === Python & Django Development ===
Plugin 'davidhalter/jedi-vim'              " Python autocompletion
Plugin 'vim-python/python-syntax'          " Improved syntax highlighting
Plugin 'dense-analysis/ale'                " Async linting and fixing (Handles Black/Flake8)

" === Utilities ===
Plugin 'ctrlpvim/ctrlp.vim'                " Full path fuzzy file finder
Plugin 'preservim/nerdtree'                " Filesystem explorer
Plugin 'tpope/vim-surround'                " Quoting/tagging
Plugin 'tpope/vim-commentary'              " Easy commenting
Plugin 'jiangmiao/auto-pairs'              " Auto-close brackets/quotes
Plugin 'Yggdroot/indentLine'               " Show indent guides
Plugin 'majutsushi/tagbar'                 " Code structure viewer (Requires 'ctags' on OS)

" === Git Integration (NEW) ===
Plugin 'tpope/vim-fugitive'                " The best Git wrapper for Vim
Plugin 'airblade/vim-gitgutter'            " Shows git diff in the gutter (+/-)

" === Status Line ===
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

call vundle#end()            " Required
filetype plugin indent on    " Required

"===============================
" GENERAL SETTINGS
"===============================
syntax on
" ACTIVATE THEME HERE
colorscheme catppuccin_mocha 

set cursorline
set number
set relativenumber
set tabstop=4
set shiftwidth=4
set expandtab
set autoindent
set smartindent
set background=dark
set clipboard=unnamedplus
set encoding=utf-8
set wildmenu
set showcmd
set ruler

"===============================
" KEYBINDINGS
"===============================
let mapleader = " "

" NERDTree toggle
nnoremap <leader>e :NERDTreeToggle<CR>

" Tagbar toggle
nnoremap <leader>t :TagbarToggle<CR>

" Git Status (New)
nnoremap <leader>gs :G<CR>

" Fast save
nnoremap <C-s> :w<CR>
" Buffer navigation
nnoremap <Tab> :bnext<CR>
nnoremap <S-Tab> :bprevious<CR>
nnoremap <leader>bd :bd<CR>

"===============================
" PLUGIN CONFIGURATION
"===============================

" Jedi
let g:jedi#completions_enabled = 1
let g:jedi#use_tabs_not_buffers = 1

" ALE (Linter/Fixer)
let g:ale_linters = {
\   'python': ['flake8'],
\}
let g:ale_fixers = {
\   'python': ['black'],
\}
let g:ale_fix_on_save = 1

" Ensure ALE finds your system executables
let g:ale_python_flake8_executable = 'flake8'
let g:ale_python_black_executable = 'black'

" Python indentation
autocmd FileType python setlocal expandtab shiftwidth=4 softtabstop=4

" Auto open NERDTree if directory is opened
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") |
\ execute 'NERDTree' argv()[0] | wincmd p | enew | endif

" Airline
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='catppuccin_mocha'
let g:airline#extensions#tabline#formatter = 'unique_tail'

" Django Settings
let g:django_settings_module = 'myproject.settings'
