return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, {
        "ruby",
        "elixir",
        "heex",
        "eex",
        "scss",
      })
    end,
  },
  { "tpope/vim-rails" },
}
