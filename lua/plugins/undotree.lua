return {
	"mbbill/undotree",
	config = function()
		-- Raccourci pour ouvrir/fermer l'historique : <leader>u (Espace + u)
		vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle, { desc = "Ouvrir l'historique des modifications (UndoTree)" })
		
		-- Optionnel : Met le focus automatiquement sur la fenêtre Undotree quand elle s'ouvre
		vim.g.undotree_SetFocusWhenToggle = 1
	end
}