vim.g.mapleader = " "
-- Install all the plugins 
require("plugins.pack")
-- Configure every plugin
require("plugins.mason")
require("plugins.nvim-tree")
require("plugins.lualine")
require("plugins.telescope")
require("plugins.autopairs")
require("plugins.lsp")
require("plugins.outline")
require("plugins.fidget")
-- Base configuration
require("options")
