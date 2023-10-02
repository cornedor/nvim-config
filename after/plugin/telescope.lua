local builtin = require('telescope.builtin')
vim.keymap.set('n', '<C-p>', builtin.git_files, {})

local whichKey = require('which-key')
whichKey.register({
  f = {
    name = "Find (Telescope)",
    f = {
      "<cmd>Telescope find_files<cr>", "Find files"
    },
    g = {
      "<cmd>Telescope live_grep<cr>", "Live grep"
    },
    b = {
      "<cmd>Telescope buffers<cr>", "Find buffers"
    },
    h = {
      "<cmd>Telescope help_tags<cr>", "Find help tags"
    },
    s = {
      function ()
        builtin.symbols({})
      end,
      "Find symbols"
    },
    F = {
      function()
        builtin.find_files({ hidden = true })
      end,
      "Find files"
    },
    G = {
      function ()
        builtin.live_grep({ hidden = true })
      end,
      "Live grep"
    },
  }
}, {
  mode = 'n',
  prefix = '<leader>',
  silent = true
})
