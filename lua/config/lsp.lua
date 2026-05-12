-- ============================================================================
-- LSP (Language Server Protocol)
-- ============================================================================

-- On initialise Mason d'abord
local mason_ok, mason = pcall(require, "mason")
if mason_ok then
    mason.setup()
end

-- Configuration de Clangd pour le C/C++
vim.lsp.config('clangd', {
	cmd = { 'clangd' },
	filetypes = {'c', 'h', 'cpp', 'hpp'},
	init_options = {
		fallbackFlags = { 
			'-Wall', 
			'-Wextra', 
			'-Werror', 
			'-I.',
			'-Iincludes',
			'-I../includes',
			'-I../../includes',
			'-I../../../includes',
			'-Iinclude',
			'-I../include',
			'-I../../include',
			'-I../../../include'
		}
	}
})

-- On active le serveur
vim.lsp.enable({'clangd'})

-- Raccourci pour afficher les erreurs LSP
vim.keymap.set('n', '<leader>d', vim.diagnostic.open_float, { desc = "LSP: Show diagnostic float" })
