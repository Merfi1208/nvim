return {
	"windwp/nvim-autopairs",
	event = "InsertEnter", -- Charge le plugin uniquement quand on passe en mode insertion
	config = function()
		require('nvim-autopairs').setup({
			check_ts = true, -- Vérification avec Treesitter si disponible
			disable_filetype = { "TelescopePrompt", "vim" }, -- Désactiver pour certains filetypes
			fast_wrap = {
				map = '<M-e>', -- Alt+e pour entourer du texte
				chars = { '{', '[', '(', '"', "'" },
				pattern = string.gsub([[ [%'%"%)%>%]%)%}%,] ]], '%s+', ''),
				end_key = '$',
				keys = 'qwertyuiopzxcvbnmasdfghjkl',
				check_comma = true,
				highlight = 'Search'
			},
			-- Comportement avec espace entre parenthèses
			enable_check_bracket_line = true,      -- Ne pas ajouter de paire si la même existe après le curseur
			ignored_next_char = "[%w%.%(%)]",      -- Ne pas ajouter de paire si le caractère suivant est un mot
		})
	end
}
