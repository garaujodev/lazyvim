return {
  {
    "nvim-neotest/neotest",
    optional = true,
    dependencies = {
      "jfpedroza/neotest-elixir",
      "olimorris/neotest-rspec",
    },
    opts = {
      adapters = {
        ["neotest-elixir"] = {},
        ["neotest-rspec"] = {},
      },
    },
  },
}
