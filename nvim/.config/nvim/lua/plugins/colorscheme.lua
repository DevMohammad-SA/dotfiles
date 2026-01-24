return {
  -- Install the theme
  {
    "bluz71/vim-moonfly-colors",
    name = "moonfly",
    lazy = false,
    priority = 1000,
    config = function()
      -- set any Moonfly globals you want
      vim.g.moonflyCursorColor = true -- cursor gets theme color
      vim.g.moonflyItalics = false -- disable italics
      vim.g.moonflyNormalPmenu = true -- popup menu uses theme colors
      vim.g.moonflyNormalFloat = false
      vim.g.moonflyTerminalColors = true
      vim.g.moonflyTransparent = false
      vim.g.moonflyUndercurls = true
      vim.g.moonflyUnderlineMatchParen = false
      vim.g.moonflyVirtualTextColor = true
      vim.g.moonflyWinSeparator = 2 -- thin separators
    end,
  },
  -- Set default theme
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "tokyonight-night",
    },
  },
}
