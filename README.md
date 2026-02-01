# Neovim Configuration

A personal Neovim configuration built on [LazyVim](https://github.com/LazyVim/LazyVim), optimized for Ruby/Rails and Elixir/Phoenix development with AI assistance.

## Structure

```
~/.config/nvim/
├── init.lua                 # Entry point (bootstraps lazy.nvim)
├── lua/
│   ├── config/
│   │   ├── lazy.lua         # Plugin manager setup
│   │   ├── keymaps.lua      # Custom keybindings
│   │   ├── options.lua      # Editor options
│   │   └── autocmds.lua     # Auto commands
│   └── plugins/             # Plugin configurations
│       ├── ai.lua           # AI assistant (CodeCompanion)
│       ├── editor.lua       # Editor enhancements
│       ├── elixir-extras.lua
│       ├── finder.lua       # Telescope & search
│       ├── git.lua          # Git integration
│       ├── testing.lua      # Test runners
│       ├── treesitter.lua   # Syntax highlighting
│       └── ui.lua           # UI improvements
```

## Plugins

### Finder & Search
| Plugin | Description |
|--------|-------------|
| [telescope.nvim](https://github.com/nvim-telescope/telescope.nvim) | Fuzzy finder and search |
| [telescope-live-grep-args.nvim](https://github.com/nvim-telescope/telescope-live-grep-args.nvim) | Advanced grep with arguments |
| [telescope-fzy-native.nvim](https://github.com/nvim-telescope/telescope-fzy-native.nvim) | Native fuzzy matching |
| [nvim-spectre](https://github.com/nvim-pack/nvim-spectre) | Search and replace across files |

### Testing
| Plugin | Description |
|--------|-------------|
| [neotest](https://github.com/nvim-neotest/neotest) | Testing framework |
| [neotest-elixir](https://github.com/jfpedroza/neotest-elixir) | Elixir test runner |
| [neotest-rspec](https://github.com/olimorris/neotest-rspec) | RSpec test runner |

### Git
| Plugin | Description |
|--------|-------------|
| [gitsigns.nvim](https://github.com/lewis6991/gitsigns.nvim) | Git signs in gutter |
| [diffview.nvim](https://github.com/sindrets/diffview.nvim) | Git diff viewer |

### Editor
| Plugin | Description |
|--------|-------------|
| [neo-tree.nvim](https://github.com/nvim-neo-tree/neo-tree.nvim) | File tree explorer |
| [nvim-window-picker](https://github.com/s1n7ax/nvim-window-picker) | Window selection |
| [smart-splits.nvim](https://github.com/mrjones2014/smart-splits.nvim) | Smart window resizing |

### Syntax & Languages
| Plugin | Description |
|--------|-------------|
| [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter) | Incremental syntax parsing |
| [vim-rails](https://github.com/tpope/vim-rails) | Rails enhancements |
| [elixir-extras.nvim](https://github.com/emmanueltouzery/elixir-extras.nvim) | Elixir documentation utilities |

### UI
| Plugin | Description |
|--------|-------------|
| [nvim-highlight-colors](https://github.com/brenoprata10/nvim-highlight-colors) | Color highlighting (Tailwind support) |

### AI
| Plugin | Description |
|--------|-------------|
| [codecompanion.nvim](https://github.com/olimorris/codecompanion.nvim) | AI chat and code assistance |

#### CodeCompanion Personas
- **Concise Engineer** - Senior engineer assistant
- **Strict Reviewer** - Code review focused on correctness
- **Rails Expert** - Ruby on Rails specialist
- **Elixir Expert** - Elixir/OTP specialist
- **SQL Optimizer** - PostgreSQL optimization
- **Test Writer** - RSpec/ExUnit test generation

## Keymaps

### Navigation
| Keymap | Action |
|--------|--------|
| `<C-j>` | Jump down 10 lines |
| `<C-k>` | Jump up 10 lines |
| `<Tab>` | Next buffer |
| `<S-Tab>` | Previous buffer |
| `\` | Change window |

### Commands
| Keymap | Action |
|--------|--------|
| `;` | Command mode (`:` shortcut) |
| `<C-O>` | Open Neotree in current dir |
| `<C-e>` | Fill current dir in command mode |

### Telescope
| Keymap | Action |
|--------|--------|
| `<C-p>` | Find files |
| `<leader>fg` | Find files (including hidden) |
| `<leader>ff` | Find files (including hidden) |
| `<leader><space>` | Find git files |
| `<leader>/` | Live grep with args |
| `<leader>fp` | Find plugin files |

### CodeCompanion (AI)
| Keymap | Action |
|--------|--------|
| `<leader>aa` | Open chat |
| `<leader>ac` | Toggle chat |
| `<leader>ap` | Actions picker |
| `<leader>as` | Add selection to chat (visual) |

### Git / Diffview
| Keymap | Action |
|--------|--------|
| `<leader>gt` | Toggle Gitsigns |
| `<leader>gvo` | Open Diffview |
| `<leader>gvq` | Close Diffview |
| `<leader>gve` | Toggle files panel |
| `<leader>gvE` | Focus files panel |
| `<leader>gvh` | Repository history |
| `<leader>gvf` | Current file history |
| `<leader>gvr` | Refresh Diffview |

### Window & Search
| Keymap | Action |
|--------|--------|
| `<leader>ws` | Pick a window |
| `<leader>sr` | Replace in files (Spectre) |

### Elixir
| Keymap | Action |
|--------|--------|
| `<leader>ed` | View docs |
| `<leader>em` | View docs (with mix libs) |
| `<leader>ec` | Module complete |

## Languages

Configured for:
- Ruby / Rails
- Elixir / Phoenix (heex, eex)
- SCSS

