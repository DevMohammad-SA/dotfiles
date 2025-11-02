return {
  -- Installed Themes
  { "Mofiqul/dracula.nvim" },
  { "ellisonleao/gruvbox.nvim" },

  -- Default theme with transparency + blur
  {
    "folke/tokyonight.nvim",
    priority = 1000,
    opts = {
      style = "night", -- or "storm", "moon", "day"
      transparent = true, -- make background transparent
      styles = {
        sidebars = "transparent",
        floats = "transparent",
      },
      dim_inactive = true, -- slightly dim inactive windows
      lualine_bold = true, -- bold section headers in lualine
      on_colors = function(colors)
        -- tweak background for blur effect (depends on compositor)
        colors.bg = "none"
        colors.bg_dark = "none"
        colors.bg_float = "none"
      end,
    },
  },

  -- Set colorscheme in LazyVim
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "gruvbox",
    },
  },
}
