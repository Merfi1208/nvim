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

-- ╔══════════════════════════════╗
-- ║         LUA LSP             ║
-- ╚══════════════════════════════╝

vim.lsp.config('lua_ls', {
    cmd = { "lua-language-server" },
    filetypes = { "lua" },
    settings = {
        Lua = {
            runtime = { 
                version = 'Lua 5.1', 
            },
            diagnostics = {
                globals = { 
                    'vim', 
                    'term', 'fs', 'os', 'redstone', 'rs', 
                    'colors', 'colours', 'keys', 'peripheral', 
                    'turtle', 'pocket', 'commands', 'http', 'gps',
                    'window', 'textutils', 'vector', 'parallel',
                    'coroutine', 'bit', 'settings', 'multishell'
                },
            },
            workspace = {
                library = {
                    vim.api.nvim_get_runtime_file("", true),
                    -- Attention, avec ce dépôt, il faut pointer vers le sous-dossier "library" :
                    vim.fn.expand("~/.config/nvim/lua_libs/computercraft/library"), 
                },
                checkThirdParty = false,
            },
            telemetry = { enable = false },
        },
    },
})

vim.lsp.enable({ "lua_ls" })


-- Raccourci pour afficher les erreurs LSP
vim.keymap.set('n', '<leader>d', vim.diagnostic.open_float, { desc = "LSP: Show diagnostic float" })
