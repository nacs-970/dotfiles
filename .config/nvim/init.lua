-- Convert .vim to .lua
-- General settings
vim.o.number = true                -- set number
vim.o.relativenumber = true         -- set relativenumber
vim.o.tabstop = 4                  -- set tabstop=4
vim.o.softtabstop = 4              -- set softtabstop=4
vim.o.shiftwidth = 4               -- set shiftwidth=4
vim.o.swapfile = false             -- set noswapfile
vim.o.splitbelow = true            -- set splitbelow
vim.o.splitright = true            -- set splitright
vim.o.wildmode = 'longest,list,full' -- set wildmode=longest,list,full
vim.o.mouse = ''                   -- set mouse=

-- Keybindings for Alt keybinds
-- Move lines with Alt+J and Alt+K in normal mode
vim.api.nvim_set_keymap('n', '<A-j>', ':m .+1<CR>==', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<A-k>', ':m .-2<CR>==', { noremap = true, silent = true })

-- Move lines with Alt+J and Alt+K in visual mode
vim.api.nvim_set_keymap('v', '<A-j>', ':m \'>+1<CR>gv=gv', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', '<A-k>', ':m \'<-2<CR>gv=gv', { noremap = true, silent = true })

-- Yank lines with Alt+Shift+J and Alt+Shift+K in normal mode
vim.api.nvim_set_keymap('n', '<A-C-j>', 'yyp', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<A-C-k>', 'yyP', { noremap = true, silent = true })

-- Map Ctrl+Backspace in Insert Mode to delete the word before the cursor
vim.api.nvim_set_keymap('i', '<C-BS>', '<C-W>', { noremap = true, silent = true })

-- Map Ctrl+Backspace in Normal Mode to delete the word before the cursor
vim.api.nvim_set_keymap('n', '<C-BS>', 'db', { noremap = true, silent = true })

-- Terminal mode mapping for Ctrl+Backspace
vim.api.nvim_set_keymap('t', '<C-BS>', '<C-\\><C-N>db', { noremap = true, silent = true })

------------------------------------------------------------------------------------

vim.g.base46_cache = vim.fn.stdpath "data" .. "/base46/"
vim.g.mapleader = " "

-- bootstrap lazy and all plugins
local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"

if not vim.uv.fs_stat(lazypath) then
  local repo = "https://github.com/folke/lazy.nvim.git"
  vim.fn.system { "git", "clone", "--filter=blob:none", repo, "--branch=stable", lazypath }
end

vim.opt.rtp:prepend(lazypath)

local lazy_config = require "configs.lazy"

-- load plugins
require("lazy").setup({
  {
    "NvChad/NvChad",
    lazy = false,
    branch = "v2.5",
    import = "nvchad.plugins",
  },

  { import = "plugins" },
}, lazy_config)

-- load theme
dofile(vim.g.base46_cache .. "defaults")
dofile(vim.g.base46_cache .. "statusline")

require "options"
require "nvchad.autocmds"

vim.schedule(function()
  require "mappings"
end)
