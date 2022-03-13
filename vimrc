set nocompatible
filetype plugin indent on
syntax on

"colorscheme darcula

"""""""""""" Key Map
let mapleader = ","
let maplocalleader="\<space>"

nmap H ^
nmap L $
xmap H ^
xmap L $
omap H ^
omap L $

set signcolumn=yes
imap jj <Esc>
nmap <CR> o<Esc>
"imap <C-o> <esc>o " mapped in idea to next/prev edit; as idea keymap it
"doesn't distinguish between insert and normal mode

nnoremap U <C-r>
" nnoremap <space> viw
" vnoremap <space> e
nnoremap <bs> diw
nnoremap ;; A;<esc>
inoremap ;; <esc>A;

nnoremap <leader>rr :%s///g
nnoremap <leader>rc :%s///gc


if has("nvim")
	nmap == ==j

	nnoremap <leader><bar> :vsplit<CR>
	nnoremap <leader>_ :split<CR>

	nnoremap zz :update<CR>

	nnoremap <leader><leader>t :cclose<CR>
	set pastetoggle=<F2>
	vnoremap <tab> %

	nnoremap <C-j> <C-w>j
	nnoremap <C-k> <C-w>k
	nnoremap <C-h> <C-w>h
	nnoremap <C-l> <C-w>l
endif

" Buffer
nnoremap <leader><Tab> :bnext<CR>
nnoremap <leader><leader><Tab> :bprevious<CR>

""""""""""""    General
set updatetime=100
set autoread
"set clipboard=unnamed
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

set foldlevel=9

"Search related conf also look ~/.vim/vimrc/search-keybindings.vim
set showmatch     " set show matching parenthesis
"set ignorecase    " ignore case when searching
set smartcase     " ignore case if search pattern is all lowercase,
set nolazyredraw " don't redraw while executing macros
"set hlsearch      " highlight search terms
set incsearch     " show search matches as you type

set history=1000         " remember more commands and search history
set undolevels=1000      " use many muchos levels of undo
set wildignore=*.swp,*.bak,*.pyc,*.class
set title                " change the terminal's title
"set visualbell           " don't beep
set noerrorbells         " don't beep
set vb t_vb=
set belloff=all

set scrolloff=7 "when jumping makes at least 7 lines from top and bottom
set mouse=a

set guifont=JetbrainsMono\ NF:h20
let g:neovide_cursor_animation_length=0.0
let g:neovide_cursor_trail_length=0.0

nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>

if has("nvim")
	augroup toggleRelativeLineNumbers
		autocmd!

		autocmd InsertEnter,BufLeave,WinLeave,FocusLost * nested
					\ if &l:number && empty(&buftype) |
					\ setlocal norelativenumber |
					\ endif
		autocmd InsertLeave,BufEnter,WinEnter,FocusGained * nested
					\ if &l:number && empty(&buftype) |
					\ setlocal relativenumber |
					\ endif
	augroup END
endif

if has('ide')
	source /Users/jalal/.config/nvim/ideavimrc.vim
endif
if exists('g:vscode')
	source /Users/jalal/.config/nvim/vscode.vim
endif
