return {
  {
    "emmanueltouzery/elixir-extras.nvim",
    lazy = true,
    ft = "elixir",
    dependencies = {
      "nvim-telescope/telescope.nvim",
    },
    config = function()
      require("elixir-extras").setup_multiple_clause_gutter()
    end,
  },
}

