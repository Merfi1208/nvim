return {
	"sainnhe/sonokai",
	lazy = false,
	priority = 1000,
	config = function()
		-- Optionnel : style du thème (default, atlantis, andromeda, shusia, maia, espresso)
		vim.g.sonokai_style = 'default'
		vim.g.sonokai_enable_italic = 1
		vim.g.sonokai_disable_italic_comment = 1
		
		-- Charge le thème
		vim.cmd.colorscheme("sonokai")
		
		-- Remet vos options de transparence juste après
		vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
		vim.api.nvim_set_hl(0, "NormalNC", { bg = "none" })
		vim.api.nvim_set_hl(0, "EndOfBuffer", { bg = "none" })
		vim.api.nvim_set_hl(0, "VertSplit", { bg = "none" })
		vim.api.nvim_set_hl(0, "WinSeparator", { bg = "none" })
		vim.api.nvim_set_hl(0, "NvimTreeNormal", { bg = "none" })
		vim.api.nvim_set_hl(0, "NvimTreeNormalNC", { bg = "none" })
		vim.api.nvim_set_hl(0, "NvimTreeEndOfBuffer", { bg = "none" })
	end
}
