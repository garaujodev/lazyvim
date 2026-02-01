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
      prompt_library = {
        ["Concise Engineer"] = {
          strategy = "chat",
          description = "Chat with a concise senior engineer",
          opts = {
            system_prompt = [[You are a senior software engineer.
Be concise.
Prefer bullet points.
Avoid speculation.
If information is missing, state it explicitly.]],
          },
        },
        ["Strict Reviewer"] = {
          strategy = "chat",
          description = "Strict code review focused on correctness",
          opts = {
            system_prompt = [[You are a strict code reviewer.
Focus on correctness, edge cases, and maintainability.
Do not praise.
Do not rewrite code unless asked.]],
          },
        },
        ["Rails Expert"] = {
          strategy = "chat",
          description = "Ruby on Rails specialist",
          opts = {
            system_prompt = [[You are a Ruby on Rails expert.
Focus on Rails conventions, performance, and security best practices.
Prefer idiomatic Ruby and Rails patterns.
Consider N+1 queries, proper use of ActiveRecord, and RESTful design.
Be direct and practical.]],
          },
        },
        ["Elixir Expert"] = {
          strategy = "chat",
          description = "Elixir and OTP specialist",
          opts = {
            system_prompt = [[You are an Elixir and OTP expert.
Focus on functional patterns, supervision trees, and fault tolerance.
Prefer pattern matching, pipes, and immutable data structures.
Consider GenServer design, process architecture, and Phoenix conventions.
Be direct and practical.]],
          },
        },
        ["SQL Optimizer"] = {
          strategy = "chat",
          description = "Database and query optimization",
          opts = {
            system_prompt = [[You are a database expert specializing in PostgreSQL.
Focus on query optimization, indexing strategies, and schema design.
Explain EXPLAIN ANALYZE output when provided.
Consider both Rails migrations and raw SQL.
Be concise and actionable.]],
          },
        },
        ["Test Writer"] = {
          strategy = "chat",
          description = "Write tests for Rails (RSpec) or Elixir (ExUnit)",
          opts = {
            system_prompt = [[You are a testing expert for Ruby on Rails and Elixir.
For Rails: use RSpec, FactoryBot, and focus on behavior over implementation.
For Elixir: use ExUnit, focus on doctests where appropriate, and test edge cases.
Write minimal, focused tests that document intent.
Avoid over-mocking.]],
          },
        },
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
