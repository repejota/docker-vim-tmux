" Use vim improved by default and do not try to be backwards compatible.
set nocompatible

" Use utf-8 by default.
" Also prefered file format is unix with fallbacks to mac and dos.
set encoding=utf-8
set ffs=unix,mac,dos
set formatoptions-=tc

" Time out on key codes but not mappings.
" This makes terminal Vim work sanely.
set notimeout
set ttimeout
set ttimeoutlen=10

" Tabular information : 4 spaces
set expandtab
set shiftwidth=4
set tabstop=4
set softtabstop=4
set smarttab

" Better completion
set complete=.,w,b,u,t
set completeopt=longest,menuone,preview

" Cursorline
" Only show cursorline in the current window and in normal mode.
augroup cline
    au!
    au WinLeave,InsertEnter * set nocursorline
    au WinEnter,InsertLeave * set cursorline
augroup END

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
" Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Git plugin not hosted on GitHub
" Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
" Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
" Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Avoid a name conflict with L9
" Plugin 'user/L9', {'name': 'newL9'}

Plugin 'chriskempson/base16-vim'
Plugin 'bling/vim-airline'
Plugin 'scrooloose/nerdTree'
Plugin 'majutsushi/tagbar'
Plugin 'ctrlpvim/ctrlp.vim'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
"
"

"
" Syntax on
"
syntax on
let base16colorspace=256  " Access colors present in 256 colorspace
let g:airline_theme = 'base16'
let g:airline_powerline_fonts = 1
let g:promptline_preset = 'full'
let g:promptline_powerline_symbols = 1
colorscheme base16-default
set background=dark

"
" Mouse support
"
set mouse=a
set mousehide

"
" Searching and Patterns
"
set showmatch
set hlsearch                    " Highlight matches to the search
set ignorecase                  " Search is case insensitive
set smartcase                   " Search case sensitive if caps on
set incsearch                   " Show best match so far
" nnoremap <space> :noh<return>   " Press <space> to clear highlighted results.

"
" Display
"
set autoindent
set history=1000
set lazyredraw                  " Don't repaint when scripts are running
set ruler                       " Line numbers and column the cursor is on
set number                      " Show line numbering
set numberwidth=1               " Use 1 col + 1 space for numbers
set cursorline                  " Highlight the current line
set showbreak=↝\ \ \            " Show ↝ if line wraps
set vb t_vb=                    " No flash bell
set noerrorbells                " No beeps
set backspace=indent,eol,start
set showcmd                     " Show me what I'm typing
set showmode                    " Show current mode.
set noswapfile                  " Don't use swapfile
set nobackup                    " Don't create annoying backup files
set laststatus=2                " Always show status bar
set fillchars+=stl:\ ,stlnc:\
set wrap
set textwidth=0 wrapmargin=0

"
" Remove trailing whitespaces at save
"
autocmd BufWritePre * :%s/\s\+$//e

"
" Ruler at 78, 120 and 999 columns
"
let &colorcolumn="80,".join(range(120,999),",")

"
" Make sure Vim returns to the same line when you reopen a file.
"
augroup line_return
    au!
    au BufReadPost *
                \ if line("'\"") > 0 && line("'\"") <= line("$") |
                \     execute 'normal! g`"zvzz' |
                \ endif
augroup END

"
" Leader mapping
"
let mapleader = ","
" ,p calls ControlP plugin
:map ,p :CtrlP<cr>
" ,t calls NERDTree plugin
:map ,t :NERDTreeToggle<CR>
" ,tb calls TagbarToggle plugin
:map ,tb ::TagbarToggle<CR>
" ,n toggles line numbers
nnoremap <leader>n :setlocal number!<cr>
" ,i toggles invisible characters
nnoremap <leader>i :set list!<cr>
" ,tn go to next tab
nnoremap <leader>tn :tabnext<cr>
" ,tp go to previous tab
nnoremap <leader>tp :tabprevious<cr>
" ,tt create new tab
nnoremap <leader>tt :tabnew!<cr>
" ,tw close tab
nnoremap <leader>tw :tabclose!<cr>
" ,l reindent source code
nnoremap <leader>l mzgg=G`z<cr>
" Folding
vmap <space> zf
nmap <space> za
