vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
-- vim.keymap.set("n", "<leader>y", "\"+y")
-- vim.keymap.set("v", "<leader>y", "\"+y")
-- vim.keymap.set("n", "<leader>Y", "\"+Y")
vim.keymap.set("n", "Q", "<nop>")

vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")

local whichKey = require("which-key")

whichKey.register({
  ["<leader>"] = {
    p = {
      name = "Project",
      v  = { "<cmd>Ex<cr>", "Project view"}
    },
    e = { "<cmd>Neotree toggle<cr>", "Toggle Neotree"},
    c = {
      c = {"<cmd>noh<cr>", "Hide current search"}
    }
  },
})

