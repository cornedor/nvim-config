require('treesitter-context').setup()

require'nvim-treesitter.configs'.setup {
  ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "javascript", "typescript" },
  sync_install = false,
  auto_install = true,
  ignore_install = { },

  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
}

