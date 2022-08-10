local vim = vim
local utils = require('artronics/utils')

utils.keymap('n', '<leader>w', ':q<CR>')

vim.opt.signcolumn="yes"

vim.g.auto_save = 1 -- enable vim-auto-save plugin during startup
vim.g.auto_save_silent = 1
-- auto save on focus lost
-- vim.cmd([[autocmd FocusLost * :w]]) -- it doesn't work in tmux, because tmux doesn't send focus lost

-- hide cmd content after certain time
vim.cmd [[
augroup cmdline
    autocmd!
    autocmd CmdlineLeave : lua vim.defer_fn(function() vim.cmd('echo ""') end, 2000)
    autocmd CmdlineLeave /,\? lua vim.defer_fn(function() vim.cmd('echo ""') end, 2000)
augroup END
]]
-- vimdows to close with 'q'
vim.cmd [[autocmd FileType help,qf,fugitive,fugitiveblame,netrw nnoremap <buffer><silent> q :close<CR>]]

-- highlight yank
vim.cmd [[ au TextYankPost * silent! lua vim.highlight.on_yank {higroup="IncSearch", timeout=500} ]]

-- source vimrc
vim.cmd('source /Users/jalal/.vimrc')

require('artronics/plugins')
require('artronics/lsp')
require('artronics/treesitter')
require('artronics/telescope')
require('artronics/gitsigns')
require('artronics/lualine')
require('artronics/git')


vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"

-- GUI
vim.g.neovide_cursor_animation_length=0.06
vim.g.neovide_cursor_trail_length=0.06
