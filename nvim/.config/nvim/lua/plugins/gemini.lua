return {
  "olimorris/codecompanion.nvim",
  dependencies = { "nvim-lua/plenary.nvim", "nvim-treesitter/nvim-treesitter" },
  config = function()
    require("codecompanion").setup({
      strategies = {
        chat = { adapter = "gemini" },
        inline = { adapter = "gemini" },
      },
      adapters = {
        gemini = function()
          return require("codecompanion.adapters").extend("gemini", {
            env = {
              api_key = os.getenv("GEMINI_API_KEY"),
            },
            schema = {
              model = {
                -- We change the ACTUAL default value in the schema
                default = "gemini-2.0-flash",
              },
            },
          })
        end,
      },
    })
  end,
}
