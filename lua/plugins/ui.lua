return {
  {
    "brenoprata10/nvim-highlight-colors",
    config = function()
      local highlight_colors = require("nvim-highlight-colors")

      highlight_colors.turnOn()

      highlight_colors.setup({
        render = "background",
        enable_named_colors = true,
        enable_tailwind = true,
      })
    end,
  },
  {
    "mrjones2014/smart-splits.nvim",
    lazy = false,
  },
}
