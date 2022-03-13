nnoremap <c-y> <Cmd>call VSCodeNotify('workbench.action.splitEditorRight')<CR>
nnoremap ? <Cmd>call VSCodeNotify('workbench.action.findInFiles', { 'query': expand('<cword>')})<CR>

nnoremap <leader>w <Cmd>call VSCodeNotify('workbench.action.closeActiveEditor')<CR>

" Move between windows in a tab
nnoremap <C-j> :call VSCodeNotify('workbench.action.navigateDown')<CR>
xnoremap <C-j> :call VSCodeNotify('workbench.action.navigateDown')<CR>

nnoremap <C-k> :call VSCodeNotify('workbench.action.navigateUp')<CR>
nnoremap <C-k> :call VSCodeNotify('-workbench.action.navigateUp')<CR>
xnoremap <C-k> :call VSCodeNotify('workbench.action.navigateUp')<CR>
xnoremap <C-k> :call VSCodeNotify('-workbench.action.navigateUp')<CR>

nnoremap <C-h> :call VSCodeNotify('workbench.action.navigateLeft')<CR>
xnoremap <C-h> :call VSCodeNotify('workbench.action.navigateLeft')<CR>

nnoremap <C-l> :call VSCodeNotify('workbench.action.navigateRight')<CR>
xnoremap <C-l> :call VSCodeNotify('workbench.action.navigateRight')<CR>

nnoremap <silent> <C-w>k :call VSCodeNotify('workbench.action.navigateUp')<CR>
xnoremap <silent> <C-w>k :call VSCodeNotify('workbench.action.navigateUp')<CR>

" TERMINAL
nnoremap <silent> <leader>tt <Cmd>:call VSCodeNotify('workbench.action.terminal.toggleTerminal')<CR>

" nnoremap <silent> <leader>f <Cmd>:call VSCodeNotify('workbench.action.quickOpenNavigateNextInFilePicker')<CR>
nnoremap <silent> <leader>f <Cmd>:call VSCodeNotify('workbench.action.quickOpen')<CR>
nnoremap <silent> <leader>s <Cmd>:call VSCodeNotify('workbench.action.gotoSymbol')<CR>


