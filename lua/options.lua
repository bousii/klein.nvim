-- Configure tabs to be 4 spaces
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4

-- Configure clipboard
vim.opt.clipboard = "unnamedplus"
-- Remove ~
vim.opt.fillchars = { eob = " " }

-- Enable line numbers
vim.opt.number = true
vim.opt.relativenumber = true

-- Disable netrw
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.opt.termguicolors = true

-- Remove the mode from the bottom, lualine makes it redundance
vim.opt.showmode = false

-- Change theme
vim.cmd.colorscheme("gruvbox")

-- Auto complete
vim.o.autocomplete = true
vim.o.pumborder = 'rounded'
vim.o.pummaxwidth = 60
vim.o.completeopt = 'menu,menuone,noselect'
vim.o.winborder = "single"

-- Plugin specific configs
-- nvim-tree
local api = require("nvim-tree.api")
vim.keymap.set('n', '<leader>e', api.tree.toggle, {})

-- Mapping keybinds
vim.keymap.set('n', '<leader>t', ':below term<CR>', { silent = true })
vim.keymap.set('n', '<leader>o', ':Outline<CR>', { silent = true })
vim.keymap.set("n", "<leader>.", vim.diagnostic.open_float, {})
vim.keymap.set('n', '<C-t>', ':tabnew<CR>', { silent = true })
vim.keymap.set('t', '<Esc>', [[<C-\><C-n>]])

vim.opt.scrolloff = 10
