return {
  {
    "olimorris/codecompanion.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
      "ravitemer/codecompanion-history.nvim", -- history extension
      {
        "MeanderingProgrammer/render-markdown.nvim", -- Render markdonw properly on chat
        ft = { "markdown", "codecompanion" },
      },
      {
        "HakonHarnes/img-clip.nvim", -- Copy image from clipboard into chat using :PasteImage
        opts = {
          filetypes = {
            codecompanion = {
              prompt_for_file_name = false,
              template = "[Image]($FILE_PATH)",
              use_absolute_path = true,
            },
          },
        },
      },
    },
    opts = {
      -- NOTE: The log_level is in `opts.opts`
      opts = {
        log_level = "DEBUG", -- or "TRACE"
      },
      interactions = {
        chat = {
          adapter = {
            name = "claude_code",
            model = "opus",
          },
        },
      },
      adapters = {
        acp = {
          claude_code = function()
            return require("codecompanion.adapters").extend("claude_code", {
              defaults = {
                model = "opus",
              },
              env = {
                CLAUDE_CODE_OAUTH_TOKEN = os.getenv("CLAUDE_CODE_OAUTH_TOKEN"),
              },
            })
          end,
        },
      },
    },
  },
}
