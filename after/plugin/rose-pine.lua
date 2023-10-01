require('rose-pine').setup({
  bold_vert_split = true,
  dim_inactive = true,
  highlight_groups = {
    NeoTreeNormalNC = {
      bg = "highlight_low",
    },
    NeoTreeNormal = {
      bg = "highlight_low",
    },
    ['IndentBlanklineChar'] = { fg = "highlight_med", nocombine = true },
    ['IblWhitespace'] = { fg = "highlight_med", nocombine = true },
    ['IblIndent'] = { fg = "highlight_med", nocombine = true },
		['IndentBlanklineSpaceChar'] = { fg = "none", nocombine = true },
		['IndentBlanklineSpaceCharBlankline'] = { fg = "none", nocombine = true },
  }
})
