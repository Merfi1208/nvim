return {
	{
		"lukas-reineke/indent-blankline.nvim",
		config = function()
			local highlight = {
				"IndentBlanklineIndent1",
				"IndentBlanklineIndent2",
			}
			local hooks = require("ibl.hooks")
			hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
				vim.api.nvim_set_hl(0, "IndentBlanklineIndent1", { fg = "#504945" })
				vim.api.nvim_set_hl(0, "IndentBlanklineIndent2", { fg = "#665c54" })
			end)
			
			-- Configuration du plugin
			require("ibl").setup {
				indent = {
					char = "│",
					tab_char = "│",
					highlight = highlight,
				},
				scope = {
					enabled = true,
					show_start = true,
					show_end = true,
				},
				exclude = {
					filetypes = {
						"help",
						"dashboard",
						"lazy",
						"neogitstatus",
						"NvimTree",
						"Trouble",
					},
					buftypes = { "terminal", "nofile" },
				},
			}
		end
	}
}
