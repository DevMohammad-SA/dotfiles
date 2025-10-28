return {
  -- LSP support
  { "neovim/nvim-lspconfig" },
  { "mason-org/mason.nvim", build = ":MasonUpdate" },
  { "mason-org/mason-lspconfig.nvim" },

  -- Java LSP
  {
    "mfussenegger/nvim-jdtls",
    ft = { "java" }, -- load only for Java files
    dependencies = {
      "mfussenegger/nvim-dap", -- for debugging
      "mason-org/mason.nvim",
    },
  },

  -- Autocomplete
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "L3MON4D3/LuaSnip",
    },
  },

  -- Treesitter
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
  },
}
