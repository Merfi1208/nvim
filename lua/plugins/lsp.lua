return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
		"hrsh7th/nvim-cmp",
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-path",
		"L3MON4D3/LuaSnip",
		"saadparwaiz1/cmp_luasnip",
		"ibhagwan/fzf-lua",
	},
	config = function()
		-- Setup Mason
		require("mason").setup()
		require("mason-lspconfig").setup({
			ensure_installed = { "lua_ls", "pyright", "ts_ls", "clangd" },
			automatic_installation = true,
		})

		-- Diagnostics
		vim.diagnostic.config({
			virtual_text = { prefix = "●" },
			float = { border = "rounded" },
			update_in_insert = false,
			severity_sort = true,
		})

		-- On attach
		local on_attach = function(client, bufnr)
			local opts = { buffer = bufnr, noremap = true, silent = true }
			vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
			vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
			vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
			vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)
		end

		local capabilities = require("cmp_nvim_lsp").default_capabilities()

		-- LSP Configs
		vim.lsp.config("clangd", {
			on_attach = on_attach,
			capabilities = capabilities,
			root_dir = function(fname)
				return vim.fs.dirname(vim.fs.find({ "Makefile", ".git" }, { upward = true })[1]) or vim.fn.getcwd()
			end,
			cmd = { "clangd", "--background-index", "--clang-tidy" },
		})

		vim.lsp.config("lua_ls", {
			on_attach = on_attach,
			capabilities = capabilities,
			settings = {
				Lua = { diagnostics = { globals = { "vim" } }, telemetry = { enable = false } },
			},
		})

		vim.lsp.config("pyright", { on_attach = on_attach, capabilities = capabilities })
		vim.lsp.config("ts_ls", { on_attach = on_attach, capabilities = capabilities })

		-- Enable servers
		vim.lsp.enable({ "lua_ls", "pyright", "ts_ls", "clangd" })

		-- Setup cmp
		local cmp = require("cmp")
		local luasnip = require("luasnip")

		cmp.setup({
			snippet = { expand = function(args) luasnip.lsp_expand(args.body) end },
			sources = cmp.config.sources({
				{ name = "nvim_lsp" },
				{ name = "luasnip" },
				{ name = "buffer" },
				{ name = "path" },
			}),
			mapping = cmp.mapping.preset.insert({
				["<C-Space>"] = cmp.mapping.complete(),
				["<CR>"] = cmp.mapping.confirm({ select = true }),
				["<Tab>"] = cmp.mapping(function(fallback)
					if cmp.visible() then cmp.select_next_item()
					elseif luasnip.expand_or_jumpable() then luasnip.expand_or_jump()
					else fallback() end
				end, { "i", "s" }),
			}),
		})
	end,
}