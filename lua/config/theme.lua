-- ============================================================================
-- THEME, COLORATION & TRANSPARENCE
-- ============================================================================
vim.api.nvim_create_autocmd("ColorScheme", {
	pattern = "*",
	callback = function()
		local hl = vim.api.nvim_set_hl

		-- #66D9EF = bleu ciel
		-- #FF5D00 = orange
		hl(0, "@variable", { link = "Normal" })
		hl(0, "@variable.parameter", { link = "Normal" })
		hl(0, "@variable.builtin", { link = "Normal" })
		hl(0, "@parameter", { link = "Normal" })
		hl(0, "@property", { link = "Normal" }) -- Membres de structures (ex: tmp->next)

		hl(0, "@function", { link = "Normal" })        -- Déclaration de fonction 
		hl(0, "@function.call", { link = "Normal" })   -- Appel de fonction  
		hl(0, "@function.builtin", { link = "Normal" }) -- Fonctions intégrées (ex: print, require)
		hl(0, "@function.macro", { link = "Normal" }) 
		hl(0, "@method", { fg = "#66D9EF" })           
		hl(0, "@method.call", { fg = "#66D9EF" })      

		hl(0, "@operator", { link = "Normal" })              -- Opérateurs mathématiques et pointeurs (+, -, *, &)
		hl(0, "@punctuation.bracket", { link = "Normal" })   -- Parenthèses et accolades (), {}, []
		hl(0, "@punctuation.delimiter", { link = "Normal" }) -- Virgules, points, flèches (,) (.) (->)
		hl(0, "@punctuation.special", { link = "SpecialChar" })   -- Ponctuation spéciale

		hl(0, "@keyword", { link = "Keyword" })
		hl(0, "@keyword.return", { link = "Keyword" })
		hl(0, "@keyword.function", { link = "Keyword" })
		hl(0, "@type", { link = "Type" })
		hl(0, "@type.builtin", { link = "Type" })

		hl(0, "@string", { link = "String" })
		hl(0, "@string.escape", { link = "SpecialChar" })
		hl(0, "@string.special", { link = "SpecialChar" })
		hl(0, "@string.special.format", { link = "SpecialChar" })
		hl(0, "@character.special", { link = "SpecialChar" })
		hl(0, "@number", { link = "Number" })
		hl(0, "@boolean", { fg = "#66D9EF" })
		hl(0, "@constant", { link = "Constant" })
		hl(0, "@constant.builtin", { link = "Constant" })

		hl(0, "@comment", { link = "Comment" })

		-- TRANSPARENCE
		hl(0, "Normal", { bg = "none" })
		hl(0, "NormalNC", { bg = "none" })
		hl(0, "EndOfBuffer", { bg = "none" })
		hl(0, "VertSplit", { bg = "none" })
		hl(0, "WinSeparator", { bg = "none" })
	end,
})

-- Application du thème
vim.cmd.colorscheme("unokai")

-- Apparence des onglets
vim.cmd([[
  hi TabLineFill guibg=NONE ctermfg=242 ctermbg=NONE
]])
