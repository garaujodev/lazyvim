return {
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      {
        "nvim-telescope/telescope-live-grep-args.nvim",
        -- This will not install any breaking changes.
        -- For major updates, this must be adjusted manually.
        version = "^1.0.0",
      },
    },
    config = function()
      require("telescope").load_extension("live_grep_args")
      require("telescope").setup({
        live_grep_args = {
          auto_quoting = true, -- enable/disable auto-quoting
          --   -- define mappings, e.g.
          --   mappings = { -- extend mappings
          --     i = {
          -- ["<C-k>"] = require("telescope-live-grep-args.actions").quote_prompt(),
          -- ["<C-i>"] = require("telescope-live-grep-args.actions").quote_prompt({ postfix = " --iglob " }),
          --     },
          --   },
        },
        defaults = {
          layout_strategy = "horizontal",
          layout_config = { prompt_position = "top" },
          sorting_strategy = "ascending",
          winblend = 0,
          vimgrep_arguments = {
            "rg",
            "--color=never",
            "--no-heading",
            "--with-filename",
            "--line-number",
            "--column",
            "--smart-case",
            "--hidden", -- Adicione esta linha para incluir arquivos ocultos
            "--glob=!.git/*",
            -- "--no-ignore", -- Adicione esta linha para ignorar as regras de .gitignore
          },
          mappings = {
            i = {
              ["<c-t>"] = require("telescope.actions").select_tab,
              ["<C-k>"] = require("telescope-live-grep-args.actions").quote_prompt(),
              ["<C-i>"] = require("telescope-live-grep-args.actions").quote_prompt({ postfix = " --iglob " }),
            },
            n = {
              ["<c-t>"] = require("telescope.actions").select_tab,
            },
          },
        },
        opts = {
          pickers = {
            find_files = {
              hidden = true,
              file_ignore_patterns = { ".git" },
            },
          },
        },
      })
    end,
  },
  {
    "nvim-telescope/telescope-fzy-native.nvim",
    config = function()
      require("telescope").load_extension("fzy_native")
    end,
  },
  {
    "nvim-pack/nvim-spectre",
    cmd = "Spectre",
    opts = { open_cmd = "noswapfile vnew" },
  },
}
