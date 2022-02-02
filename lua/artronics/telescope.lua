local utils = require('artronics/utils')
local ts = require('telescope')
local actions = require('telescope.actions')
local builtin = require('telescope.builtin')

local M = {}

local themes = require('telescope.themes')
local dropdown = themes.get_dropdown({previewer = false})
local ivy = themes.get_ivy()
local cursor = themes.get_cursor()

function M.find_files()
    builtin.find_files(dropdown)
end
function M.git_files()
    builtin.git_files(dropdown)
end
function M.grep_string()
    builtin.grep_string()
end
function M.live_grep()
    builtin.live_grep()
end
function M.buffers()
    builtin.buffers(dropdown)
end
function M.code_actions()
    builtin.lsp_code_actions(cursor)
end
function M.references()
    builtin.lsp_references(ivy)
end
function M.goto_implementation()
    builtin.lsp_implementations(ivy)
end

function M.list_symbols()
    builtin.treesitter(dropdown)
end

function M.actions()
    builtin.builtin()
end

function M.git_branches()
    builtin.git_branches(dropdown)
end

utils.keymap('n', '<leader>F', ':lua require("artronics/telescope").find_files()<cr>')
utils.keymap('n', '<leader>f', ':lua require("artronics/telescope").git_files()<cr>')

utils.keymap('n', '<leader>g', ':lua require("artronics/telescope").grep_string()<cr>')
utils.keymap('n', '<leader><leader>g', ':lua require("artronics/telescope").live_grep()<cr>')

utils.keymap('n', '<C-Space>', ':lua require("artronics/telescope").buffers()<cr>')

utils.keymap('n', '<M-CR>', ':lua require("artronics/telescope").code_actions()<cr>')

utils.keymap('n', '<leader>r', ':lua require("artronics/telescope").references()<cr>')
utils.keymap('n', '<leader>i', ':lua require("artronics/telescope").goto_implementation()<cr>')
utils.keymap('n', '<leader>s', ':lua require("artronics/telescope").list_symbols()<cr>')
utils.keymap('n', '<leader>a', ':lua require("artronics/telescope").actions()<cr>')

utils.keymap('n', '<C-G>', ':lua require("artronics/telescope").git_branches()<cr>')

ts.setup {
    pickers = {
        find_files = {
            theme = 'dropdown',
            hidden = true,
            sort_lastused = true
        },

    },
    defaults = {
        prompt_prefix = " ",
        selection_caret = " ",
        path_display = { "smart" },
        file_ignore_patterns = {"%.cache", "zig%-cache/", "zig%-out/"},

        mappings = {
            i = {
                ["<C-n>"] = actions.cycle_history_next,
                ["<C-p>"] = actions.cycle_history_prev,

                ["<C-c>"] = actions.close,

                ["<C-j>"] = actions.move_selection_next,
                ["<C-k>"] = actions.move_selection_previous,

                ["<CR>"] = actions.select_default,
                ["<M-_>"] = actions.select_horizontal,
                ["<C-CR>"] = actions.select_vertical,
                ["<C-t>"] = actions.select_tab,

                ["<C-u>"] = actions.preview_scrolling_up,
                ["<C-d>"] = actions.preview_scrolling_down,

                ["<PageUp>"] = actions.results_scrolling_up,
                ["<PageDown>"] = actions.results_scrolling_down,

                ["<Tab>"] = actions.toggle_selection + actions.move_selection_worse,
                ["<S-Tab>"] = actions.toggle_selection + actions.move_selection_better,
                ["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
                ["<M-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
                ["<C-l>"] = actions.complete_tag,
                ["<C-_>"] = actions.which_key, -- keys from pressing <C-/>
                ["<C-w>"] = { "<c-s-w>", type = "command" },
            },

            n = {
                ["<esc>"] = actions.close,
                ["<CR>"] = actions.select_default,
                ["<M-_>"] = actions.select_horizontal,
                ["<C-CR>"] = actions.select_vertical,
                ["<C-t>"] = actions.select_tab,

                ["<Tab>"] = actions.toggle_selection + actions.move_selection_worse,
                ["<S-Tab>"] = actions.toggle_selection + actions.move_selection_better,
                ["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
                ["<M-q>"] = actions.send_selected_to_qflist + actions.open_qflist,

                -- TODO: This would be weird if we switch the ordering.
                ["j"] = actions.move_selection_next,
                ["k"] = actions.move_selection_previous,
                ["H"] = actions.move_to_top,
                ["M"] = actions.move_to_middle,
                ["L"] = actions.move_to_bottom,

                ["<Down>"] = actions.move_selection_next,
                ["<Up>"] = actions.move_selection_previous,
                ["gg"] = actions.move_to_top,
                ["G"] = actions.move_to_bottom,

                ["<C-u>"] = actions.preview_scrolling_up,
                ["<C-d>"] = actions.preview_scrolling_down,

                ["<PageUp>"] = actions.results_scrolling_up,
                ["<PageDown>"] = actions.results_scrolling_down,

                ["?"] = actions.which_key,
            },
        }
    }
}

ts.setup {
  extensions = {
    fzf = {
      fuzzy = true,
      override_generic_sorter = true,
      override_file_sorter = true,
      case_mode = "smart_case",
    }
  }
}

ts.load_extension('fzf')

return M
