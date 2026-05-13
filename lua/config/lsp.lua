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
vim.lsp.enable({'clangd'})

-- Configuration de Clangd pour le lua et ComputerCraft
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
                    'coroutine', 'bit', 'settings', 'multishell', 'inventory'
                },
            },
            workspace = {
                library = {
                    vim.api.nvim_get_runtime_file("", true),
                    vim.fn.expand("~/.config/nvim/lua_libs/computercraft/library"),
                },
                checkThirdParty = false,
            },
            telemetry = { enable = false },
        },
    },
})
vim.lsp.enable({ "lua_ls" })


vim.o.autocomplete = false
vim.api.nvim_create_autocmd("LspAttach", {
    callback = function(args)
		local client = assert(vim.lsp.get_client_by_id(args.data.client_id))
        if client:supports_method('textDocument/implementation') then
			vim.lsp.completion.enable(true, client.id, args.buf, {autotrigger = true})
        end
        vim.keymap.set('n', '<leader>u', vim.lsp.buf.hover, { buffer = args.buf, desc = "Open Documentation" })
	end
})

vim.opt.complete:append('o')
vim.opt.completeopt = { 'menuone', 'noselect', 'noinsert'}
vim.opt.pumheight = 5

-- Raccourci pour afficher les erreurs LSP
vim.keymap.set('n', '<leader>d', vim.diagnostic.open_float, { desc = "Lsp diagnostic" })
