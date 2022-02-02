set nocompatible
filetype plugin indent on
syntax on
call plug#begin()
"Plug 'neoclide/coc.nvim', {'branch': 'master', 'do': 'yarn install --frozen-lockfile'}
call plug#end()

"""""""""""" Key Map
set pastetoggle=<F2>

nmap <CR> o<Esc>

nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>

""""""""""""    General

let mapleader = ","

set clipboard=unnamed
set nowrap        " don't wrap lines
set backspace=indent,eol,start " allow backspacing over everything in insert mode
set backspace=2 " make backspace work like most other apps
set number
set autoindent    " always set autoindenting on
set smartindent
set copyindent    " copy the previous indentation on autoindenting

"Setting related to tab
set tabstop=2 shiftwidth=2 expandtab
set softtabstop=2 " makes the spaces feel like real tabs
set shiftround    " use multiple of shiftwidth when indenting with '<' and '>'

"Search related conf also look ~/.vim/vimrc/search-keybindings.vim
set showmatch     " set show matching parenthesis
"set ignorecase    " ignore case when searching
set smartcase     " ignore case if search pattern is all lowercase,
set nolazyredraw " don't redraw while executing macros
"set hlsearch      " highlight search terms
"set incsearch     " show search matches as you type

set history=1000         " remember more commands and search history
set undolevels=1000      " use many muchos levels of undo
set wildignore=*.swp,*.bak,*.pyc,*.class
set title                " change the terminal's title
set visualbell           " don't beep
set noerrorbells         " don't beep

set scrolloff=7 "when jumping makes at least 7 lines from top and bottom
set mouse=a

" neovide
let g:neovide_cursor_animation_length=0.01
let g:neovide_cursor_trail_length=0.0

set guifont=Meslo\ LG\ L\ DZ:h14


" Terminal
if has('vim')
    tnoremap <Esc> <C-\><C-n>
    tnoremap <M-[> <Esc>
    tnoremap <C-v><Esc> <Esc>
endif

" CoC
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

let g:nvim_tree_git_hl = 1 
