-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local set_keymap = vim.api.nvim_set_keymap

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
-- set_keymap("n", "<C-a>", "<cmd>CodeCompanionActions<cr>", { noremap = true, silent = true })
-- set_keymap("v", "<C-a>", "<cmd>CodeCompanionActions<cr>", { noremap = true, silent = true })
-- set_keymap("n", "<leader>a", "<cmd>CodeCompanionToggle<cr>", { noremap = true, silent = true })
-- set_keymap("v", "<leader>a", "<cmd>CodeCompanionToggle<cr>", { noremap = true, silent = true })
-- set_keymap("v", "ga", "<cmd>CodeCompanionAdd<cr>", { noremap = true, silent = true })
--
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
