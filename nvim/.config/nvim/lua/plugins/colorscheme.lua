return {
  -- Install the theme
  {
    "scottmckendry/cyberdream.nvim",
    lazy = false,
    priority = 1000,
    opts = {
      variant = "default",
      transparent = true,
      saturation = 1,
      italic_comments = false,
    },
  },

  -- Set cyberdream as default colorscheme
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "cyberdream",
    },
  },
}
