-- ============================================================================
-- Firmin Murat-Jaillet (fmurat) nvim config
-- ============================================================================


vim.g.mapleader = " "
vim.g.maplocalleader = " "

require("config.options")
require("config.keymaps")
require("config.autocmds")
require("config.terminal")
require("config.lazy")
require("config.theme")
require("config.lsp")
