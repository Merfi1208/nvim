return {
	"nvim-tree/nvim-tree.lua",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	config = function()
		vim.g.loaded_netrw = 1
		vim.g.loaded_netrwPlugin = 1

		require("nvim-tree").setup({
			view = {
				width = 40,
				side = "left",
			},
			actions = {
				open_file = { quit_on_open = false },
			},
			filters = { dotfiles = false },
			git = { enable = true },
			renderer = {
				highlight_git = true,
				icons = { show = { git = true, folder = true, file = true, folder_arrow = true } },
			},
		})

		-- Mappings
		vim.keymap.set('n', '<leader>e', ':NvimTreeToggle<CR>', { noremap = true, silent = true })

		vim.api.nvim_create_autocmd("FileType", {
			pattern = "NvimTree",
			callback = function()
				vim.keymap.set('n', '<Esc>', ':NvimTreeClose<CR>', { noremap = true, silent = true, buffer = true })
			end,
		})
	end
}
