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
    }
  }
}, {
  mode = 'n',
  prefix = '<leader>',
  silent = true
})
