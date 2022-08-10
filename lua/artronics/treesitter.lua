configs = require'nvim-treesitter.configs'

configs.setup {
  enable = true,
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = "<C-K>",  -- See (and comments): https://stackoverflow.com/a/42461580/3943054
      node_incremental = "<C-K>",
      node_decremental = "<C-J>",
      scope_incremental = "<C-M-K>", -- works on visual mode
    },
  },
  indent = {
    enable = true,
  },
  textobjects = {
    select = {
      enable = true,
      disable = {}, -- nvim hangs when opening zig files see: https://github.com/nvim-treesitter/nvim-treesitter/issues/2049#issuecomment-993853458
      -- Automatically jump forward to textobj, similar to targets.vim
      lookahead = true,
      keymaps = {
        -- You can use the capture groups defined in textobjects.scm
        ["af"] = "@function.outer",
        ["if"] = "@function.inner",
        ["ac"] = "@class.outer",
        ["ic"] = "@class.inner",
        ["aa"] = "@parameter.outer",
        ["ia"] = "@parameter.inner",
      },
    },
    move = {
      enable = true,
      disable = {}, -- nvim hangs when opening zig files see: https://github.com/nvim-treesitter/nvim-treesitter/issues/2049#issuecomment-993853458
      set_jumps = true, -- whether to set jumps in the jumplist
      goto_next_start = {
        ["]m"] = "@function.outer",
        ["]]"] = "@class.outer",
      },
      goto_next_end = {
        ["]M"] = "@function.outer",
        ["]["] = "@class.outer",
      },
      goto_previous_start = {
        ["[m"] = "@function.outer",
        ["[["] = "@class.outer",
      },
      goto_previous_end = {
        ["[M"] = "@function.outer",
        ["[]"] = "@class.outer",
      },
    },
    swap = {
      enable = true,
      disable = {}, -- nvim hangs when opening zig files see: https://github.com/nvim-treesitter/nvim-treesitter/issues/2049#issuecomment-993853458
      swap_next = {
        ["<leader><leader>a"] = "@parameter.inner",
      },
      swap_previous = {
        ["<leader><leader>,A"] = "@parameter.inner",
      },
    },
  },
  rainbow = {
    enable = true,
    extended_mode = true, -- Highlight also non-parentheses delimiters
    max_file_lines = 1000,
  },
}


