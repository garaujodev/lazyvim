-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local set_keymap = vim.api.nvim_set_keymap
local wk = require("which-key")

-- Helper function to set key mappings for multiple modes
local function multiple_set_keymap(modes, lhs, rhs, opts)
  for mode in string.gmatch(modes, "%a") do
    set_keymap(mode, lhs, rhs, opts)
  end
end

-- navigation
set_keymap("n", "<C-j>", "10j", { desc = "Jump down" })
set_keymap("n", "<C-k>", "10k", { desc = "Jump up" })

set_keymap("n", "<Tab>", ":BufferLineCycleNext<cr>", { desc = "Next buffer" })
set_keymap("n", "<S-Tab>", ":BufferLineCyclePrev<cr>", { desc = "Previous buffer" })

-- commands
set_keymap("n", ";", ":", { desc = "Fast command" })

set_keymap("n", "<C-O>", ":Neotree <C-r>=expand('%:p:h')<cr>/", { desc = "Open command in current path" })

set_keymap("c", "<C-e>", "<C-r>=expand('%:p:h')<cr>/", { desc = "Fill current dir" })

-- Disable arrow keys in insert mode
-- set_keymap("i", "<Up>", "<Nop>", { noremap = true, silent = true })
-- set_keymap("i", "<Down>", "<Nop>", { noremap = true, silent = true })

-- Call Telescope file finder directly with <Ctrl+p> in normal and insert modes
multiple_set_keymap("n,i", "<C-p>", "<cmd>Telescope find_files<cr>", {
  noremap = true, -- Do not remap nested mappings
  silent = true, -- Do not show the mapping in command-line area
  desc = "Find files", -- Description for the key mapping
})

set_keymap("n", "\\", "<C-W>w", { desc = "Change window" })

-- Telescope
set_keymap("n", "<leader>fg", "<cmd>Telescope find_files<cr>", { desc = "Find Files, incl hidden (root dir)" })
set_keymap("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "Find Files, incl hidden (root dir)" })
set_keymap("n", "<leader><space>", "<cmd>Telescope git_files<cr>", { desc = "Find Git Files (root dir)" })

-- CodeCompanion
wk.add({
  -- Normal mode group
  { "<leader>a", group = "AI (CodeCompanion)", mode = "n" },

  -- Visual mode group (THIS fixes the label)
  { "<leader>a", group = "AI (CodeCompanion)", mode = "v" },

  -- Normal mode
  { "<leader>aa", "<cmd>CodeCompanionChat<cr>", desc = "Chat" },
  { "<leader>ac", "<cmd>CodeCompanionChat Toggle<cr>", desc = "Chat (toggle)" },
  { "<leader>ap", "<cmd>CodeCompanionActions<cr>", desc = "Actions picker" },

  -- Visual mode
  {
    "<leader>as",
    "<cmd>CodeCompanionChat Add<cr>",
    desc = "Add selection to chat",
    mode = "v",
  },
})

-- CodeCompanion buffer-local mapping to send requests with ENTER key
vim.api.nvim_create_autocmd("FileType", {
  pattern = "codecompanion",
  callback = function()
    -- Map Enter to submit the prompt
    vim.keymap.set("n", "<CR>", "<cmd>CodeCompanionChat Submit<cr>", { buffer = true, silent = true })

    -- Optional: also allow Enter in insert mode
    -- vim.keymap.set("i", "<CR>", "<Esc><cmd>CodeCompanionChat Submit<cr>", { buffer = true, silent = true })
  end,
})

-- Gitdiff
wk.add({
  { "<leader>g", group = "Git" },
  { "<leader>gv", group = "Diffview" },

  { "<leader>gvo", "<cmd>DiffviewOpen<cr>", desc = "Open Diffview" },
  { "<leader>gvq", "<cmd>DiffviewClose<cr>", desc = "Close Diffview" },

  { "<leader>gve", "<cmd>DiffviewToggleFiles<cr>", desc = "Toggle files panel" },
  { "<leader>gvE", "<cmd>DiffviewFocusFiles<cr>", desc = "Focus files panel" },

  { "<leader>gvh", "<cmd>DiffviewFileHistory<cr>", desc = "Repo history" },
  { "<leader>gvf", "<cmd>DiffviewFileHistory %<cr>", desc = "Current file history" },

  { "<leader>gvr", "<cmd>DiffviewRefresh<cr>", desc = "Refresh Diffview" },

  { "<leader>gt", "<cmd>Gitsigns toggle_signs<cr>", desc = "Toggle Gitsigns" },
})

-- Live grep
set_keymap(
  "n",
  "<leader>/",
  ":lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>",
  { desc = "Live Grep Args" }
)

vim.keymap.set("n", "<leader>ws", function()
  require("window-picker").pick_window({})
end, { desc = "Pick a window" })

-- Spectre (search and replace)
vim.keymap.set("n", "<leader>sr", function()
  require("spectre").open()
end, { desc = "Replace in files (Spectre)" })

-- Elixir extras
vim.keymap.set("n", "<leader>ed", function()
  require("elixir-extras").elixir_view_docs({})
end, { desc = "Elixir View Docs" })

vim.keymap.set("n", "<leader>em", function()
  require("elixir-extras").elixir_view_docs({ include_mix_libs = true })
end, { desc = "Elixir View Docs (mix libs)" })

vim.keymap.set("n", "<leader>ec", function()
  require("elixir-extras").module_complete()
end, { desc = "Elixir Module Complete" })

-- Find plugin files
vim.keymap.set("n", "<leader>fp", function()
  require("telescope.builtin").find_files({ cwd = require("lazy.core.config").options.root })
end, { desc = "Find Plugin File" })
