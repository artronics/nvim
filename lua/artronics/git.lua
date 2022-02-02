local vim = vim
local utils = require('artronics/utils')
local popup = require('popup')
local git = {}

function git.start()
 popup.create('hello there', {
    line = 3,
    col = 11,
    minwidth = 20,
    highlight = 'PopupColor1'
  })
end

utils.keymap('n', '<C-a>', ':lua require("artronics/git").start()<CR>')

return git
