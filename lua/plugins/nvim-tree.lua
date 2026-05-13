return {
	"nvim-tree/nvim-tree.lua",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	config = function()
		require("nvim-tree").setup({
			disable_netrw = false,
			hijack_netrw = false,
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
		vim.keymap.set('n', '<leader>e', ':NvimTreeToggle<CR>', { noremap = true, silent = true, desc = "Toggle NvimTree" })
	end
}
