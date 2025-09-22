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
" === Colorscheme (Catppuccin) ===
Plugin 'catppuccin/vim', {'name': 'catppuccin'}
" === Python & Django Development Plugins ===
Plugin 'davidhalter/jedi-vim'              " Python autocompletion
Plugin 'vim-python/python-syntax'          " Improved syntax highlighting
Plugin 'psf/black'                         " Black code formatter
Plugin 'nvie/vim-flake8'                   " flake8 linting
Plugin 'dense-analysis/ale'                " Async linting and fixing
Plugin 'vim-scripts/django.vim'            " Django tools
Plugin 'vim-scripts/DjangoTemplates'       " Django HTML templates

" === Utilities ===
Plugin 'tpope/vim-surround'                " Quoting/tagging
Plugin 'tpope/vim-commentary'              " Easy commenting
Plugin 'tpope/vim-fugitive'                " Git integration
Plugin 'jiangmiao/auto-pairs'              " Auto-close brackets/quotes
Plugin 'Yggdroot/indentLine'               " Show indent guides
Plugin 'scrooloose/nerdtree'               " File tree
Plugin 'vim-airline/vim-airline'           " Status line
Plugin 'vim-airline/vim-airline-themes'    " Status line themes
Plugin 'majutsushi/tagbar'                 " Code structure viewer (requires ctags)

call vundle#end()            " Required
filetype plugin indent on    " Required

"===============================
" GENERAL SETTINGS
"===============================
syntax on
set cursorline
highlight CursorLine cterm=NONE ctermbg=236 guibg=#3a3a3a
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
" NERDTree toggle
let mapleader = " "
nnoremap <leader>e :NERDTreeToggle<CR>

" Tagbar toggle
nnoremap <leader>t :TagbarToggle<CR>

" Fast save
nnoremap <C-s> :w<CR>
" Next buffer
nnoremap <Tab> :bnext<CR>
" Previous buffer
nnoremap <S-Tab> :bprevious<CR>
" Close current buffer
nnoremap <leader>bd :bd<CR>
"===============================
" PLUGIN CONFIGURATION
"===============================

" Jedi
let g:jedi#completions_enabled = 1
let g:jedi#use_tabs_not_buffers = 1

" ALE (Asynchronous Lint Engine)
let g:ale_linters = {
\   'python': ['flake8'],
\}
let g:ale_fixers = {
\   'python': ['black'],
\}
let g:ale_fix_on_save = 1

" flake8 path
let g:ale_python_flake8_executable = 'flake8'

" Black formatter path
let g:ale_python_black_executable = 'black'

" Python indentation
autocmd FileType python setlocal expandtab shiftwidth=4 softtabstop=4

" Auto open NERDTree if directory is opened
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") |
  \ execute 'NERDTree' argv()[0] | wincmd p | enew | endif

" Airline
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='dark'
let g:airline#extensions#tabline#formatter = 'unique_tail'
"===============================
" DJANGO.VIM SETTINGS
"===============================
" Optional: Set paths for Django project
let g:django_settings_module = 'myproject.settings'
let g:django_manage_py = './manage.py'

