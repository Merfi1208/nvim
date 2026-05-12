-- ============================================================================
-- KEYMAPS
-- ============================================================================

-- Enlever Hilight Recherche
vim.keymap.set("n", "<leader>h", ":nohlsearch<CR>", { desc = "Clear search highlights" })

-- Delete without yanking
vim.keymap.set({ "n", "v" }, "<leader>d", '"_d', { desc = "Delete without yanking" })

-- Center screen when jumping
vim.keymap.set("n", "n", "nzzzv", { desc = "Next search result (centered)" })
vim.keymap.set("n", "N", "Nzzzv", { desc = "Previous search result (centered)" })
vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Half page down (centered)" })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Half page up (centered)" })

-- Splitting & Resizing
vim.keymap.set("n", "<leader>vs", ":vsplit<CR>", { desc = "Split window vertically" })
vim.keymap.set("n", "<leader>sp", ":split<CR>", { desc = "Split window horizontally" })
vim.keymap.set("n", "<C-Up>", ":resize +2<CR>", { desc = "Increase window height" })
vim.keymap.set("n", "<C-Down>", ":resize -2<CR>", { desc = "Decrease window height" })
vim.keymap.set("n", "<C-Left>", ":vertical resize -2<CR>", { desc = "Decrease window width" })
vim.keymap.set("n", "<C-Right>", ":vertical resize +2<CR>", { desc = "Increase window width" })

-- Move lines up/down
vim.keymap.set("n", "<A-j>", ":m .+1<CR>==", { desc = "Move line down" })
vim.keymap.set("n", "<A-k>", ":m .-2<CR>==", { desc = "Move line up" })
vim.keymap.set("v", "<A-j>", ":m '>+1<CR>gv=gv", { desc = "Move selection down" })
vim.keymap.set("v", "<A-k>", ":m '<-2<CR>gv=gv", { desc = "Move selection up" })

-- Quick file navigation
vim.keymap.set("n", "<leader>E", ":Explore<CR>", { desc = "Open file explorer" })

-- Quick config editing
vim.keymap.set("n", "<leader>rc", ":e ~/.config/nvim/init.lua<CR>", { desc = "Edit config" })

-- Active / Desactive Colonne
vim.keymap.set("n", "<leader>c", function()
	if #vim.opt.colorcolumn:get() == 0 then
		vim.opt.colorcolumn = "81"
	else
		vim.opt.colorcolumn = ""
	end
end, { desc = "Toggle colorcolumn at 81" })

-- Basculer la coloration syntaxique (Tree-sitter)
vim.keymap.set("n", "<leader>sh", function()
	local buf = vim.api.nvim_get_current_buf()
	if vim.b[buf].ts_highlight then
		vim.treesitter.stop(buf)
		vim.b[buf].ts_highlight = false
		print("Tree-sitter Highlight: OFF")
	else
		vim.treesitter.start(buf)
		vim.b[buf].ts_highlight = true
		print("Tree-sitter Highlight: ON")
	end
end, { desc = "Toggle Syntax Highlighting" })

-- Tabs
vim.keymap.set('n', '<leader>tn', ':tabnew<CR>', { desc = 'New tab' })
vim.keymap.set('n', '<leader>tc', ':tabclose<CR>', { desc = 'Close tab' })
