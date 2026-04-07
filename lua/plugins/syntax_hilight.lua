return {
	"nvim-treesitter/nvim-treesitter",
	branch = "main",
	build = ":TSUpdate",
	event = { "BufReadPost", "BufNewFile" },
	lazy = false,

	config = function()
		-- Configuration des compilateurs, comme dans votre fichier original
		require("nvim-treesitter.install").compilers = { "gcc", "clang" }

		-- Liste des parseurs à installer (fusion des deux listes)
		local ensure_installed = {
			"bash", "c", "cpp", "css", "dockerfile", "go", "html",
			"javascript", "json", "lua", "markdown", "markdown_inline",
			"printf", "python", "rust", "svelte", "solidity", "typescript",
			"vue", "yaml",
		}

		-- Configuration de nvim-treesitter
		require("nvim-treesitter").setup({
			-- Installe automatiquement les parseurs de la liste `ensure_installed` si manquants
			ensure_installed = ensure_installed,

			-- Active la coloration syntaxique
			highlight = {
				enable = true,
			},
		})
	end,
}
