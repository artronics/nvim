" Plugin emulators
set highlightedyank "highlight yanked objects
set surround
set argtextobj
"set NERDTree
"set exchange
set 'vim-paragraph-motion'
set textobj-indent

" Settings
" set clipboard+=ideaput

" Keymaps
nmap <C-S-j> <C-w>j
nmap <C-S-k> <C-w>k
nmap <C-S-h> <C-w>h
nmap <C-S-l> <C-w>l

nnoremap <leader><bar> :vsplit<CR>
nnoremap <leader>_ :split<CR>
nmap <leader><leader>w <Action>(Unsplit)
nmap <leader>w <Action>(CloseContent)

nmap U <Action>($Redo)
nmap <C-S-p> <Action>(PasteMultiple)

imap <C-S-i> <Action>(ParameterInfo)

nmap <C-r> <Action>(Run)
imap <C-r> <Action>(Run)

nmap <C-d> <Action>(Debug)
nmap <leader>d <Action>(GotoDeclaration)

nmap <leader>f <Action>(GotoFile)
nmap <leader>c <Action>(GotoClass)
nmap <leader>s <Action>(GotoSymbol)
nmap <leader>a <Action>(GotoAction)

nmap <leader>F <Action>(FindInPath)


nmap <leader>gg <Action>(ChangesView.Commit)

nmap <c-z> <Action>(ToggleDistractionFreeMode)
nmap <leader>t <Action>(ActivateTerminalToolWindow)
nmap <leader><leader>t <Action>(HideActiveWindow)

nmap <c-u> <Action>(GotoNextError)
nmap <c-s-u> <Action>(GotoPreviousError)

nmap <leader>ge <Action>(ShowErrorDescription)

" Refactoring
nmap <leader><leader>r <Action>(RenameElement)
nmap <leader><leader>f <Action>(ReformatCode)
nmap <leader><leader>o <Action>(OptimizeImports)
nmap <leader><leader>s <Action>(SurroundWith)
nmap <leader><leader>x <Action>(Unwrap)

nmap <leader>ii <Action>(ImplementMethods)
nmap <leader>oo <Action>(OverrideMethods)

vmap <c-j> <Action>(MoveLineDown)
vmap <c-k> <Action>(MoveLineUp)
nmap <c-j> <Action>(MoveLineDown)
nmap <c-k> <Action>(MoveLineUp)

" mapped to exapand/shrink selection instead
" nmap <c-s-j> <Action>(MoveStatementDown) 
" nmap <c-s-k> <Action>(MoveStatementUp)

" Git
nmap <leader>gc <Action>(ActivateCommitToolWindow)
nmap <leader>gp <Action>(Vcs.Push)
nmap <leader>gb <Action>(Git.Branches)
nmap <leader>gj <Action>(VcsShowNextChangeMarker)
nmap <leader>gk <Action>(VcsShowPrevChangeMarker)
nmap <leader>gm <Action>(Git.Merge)

nmap <c-h> <Action>(PrevSplitter)
nmap <c-l> <Action>(NextSplitter)

"nmap <leader>w <Action>(KJumpAction.Word0)
" nmap <leader>l <Action>(KJumpAction.Line)

" For clojure
" set iskeyword=@,48-57,_,192-255,?,-,*,!,+,/,=,<,>,.,:,$
set iskeyword=@,48-57,_,192-255

