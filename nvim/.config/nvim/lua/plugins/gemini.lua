return {
  "olimorris/codecompanion.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
    "hrsh7th/nvim-cmp",
    "nvim-telescope/telescope.nvim",
  },
  config = function()
    require("codecompanion").setup({
      strategies = {
        chat = { adapter = "gemini" },
        inline = { adapter = "gemini" },
        agent = { adapter = "gemini" },
      },
      adapters = {
        gemini = function()
          return require("codecompanion.adapters").extend("gemini", {
            -- 1. Environment variables go here
            env = {
              api_key = os.getenv("GEMINI_API_KEY"),
            },
            -- 2. Schema (Model settings) goes OUTSIDE of env
            schema = {
              model = {
                default = "gemini-2.0-flash",
              },
            },
          })
        end,
      },
    })
  end,
}
