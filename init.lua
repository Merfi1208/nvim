-- ================================================================================================
-- title : The Best NeoVim Config
-- author: Firmin Murat-Jaillet
-- ================================================================================================

-- 1. Keymap
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Activer le correcteur pour les fichiers Tree-sitter (.scm)
vim.g.query_lint_on = { 'InsertLeave', 'TextChanged', 'BufEnter', 'BufWrite' }

-- Lazy nvim
require("config.lazy")

-- ============================================================================
-- THEME, COLORATION & TRANSPARENCE
-- ============================================================================
vim.api.nvim_create_autocmd("ColorScheme", {
	pattern = "*",
	callback = function()
		local hl = vim.api.nvim_set_hl

		-- ==========================================
		-- 1. VARIABLES & PARAMÈTRES (Texte normal/gris)
		-- ==========================================
		hl(0, "@variable", { link = "Normal" })
		hl(0, "@variable.parameter", { link = "Normal" })
		hl(0, "@variable.builtin", { link = "Normal" })
		hl(0, "@parameter", { link = "Normal" })
		hl(0, "@property", { link = "Normal" }) -- Membres de structures (ex: tmp->next)

		-- ==========================================
		-- 2. FONCTIONS & MÉTHODES (Bleu ciel et Orange)
		-- ==========================================
		-- #66D9EF = bleu ciel
		-- #FF5D00 = orange
		hl(0, "@function", { link = "Normal" })         -- Déclaration de fonction
		hl(0, "@function.call", { link = "Normal" })    -- Appel de fonction 
		hl(0, "@function.builtin", { link = "Normal" }) -- Fonctions intégrées (ex: print, require)
		hl(0, "@function.macro", { link = "Normal" }) -- Orange comme les built-ins
		hl(0, "@method", { fg = "#66D9EF" })           -- Déclaration de méthode (POO)
		hl(0, "@method.call", { fg = "#66D9EF" })      -- Appel de méthode


		-- ==========================================
		-- 3. PONCTUATION & OPÉRATEURS (Texte normal/gris)
		-- ==========================================
		hl(0, "@operator", { link = "Normal" })              -- Opérateurs mathématiques et pointeurs (+, -, *, &)
		hl(0, "@punctuation.bracket", { link = "Normal" })   -- Parenthèses et accolades (), {}, []
		hl(0, "@punctuation.delimiter", { link = "Normal" }) -- Virgules, points, flèches (,) (.) (->)
		hl(0, "@punctuation.special", { link = "SpecialChar" })   -- Ponctuation spéciale

		-- ==========================================
		-- 4. MOTS-CLÉS & TYPES (Couleurs Unokai par défaut)
		-- ==========================================
		hl(0, "@keyword", { link = "Keyword" })
		hl(0, "@keyword.return", { link = "Keyword" })
		hl(0, "@keyword.function", { link = "Keyword" })
		hl(0, "@type", { link = "Type" })
		hl(0, "@type.builtin", { link = "Type" })

		-- ==========================================
		-- 5. VALEURS & CONSTANTES
		-- ==========================================
		hl(0, "@string", { link = "String" })
		hl(0, "@string.escape", { link = "SpecialChar" })
		hl(0, "@string.special", { link = "SpecialChar" })
		hl(0, "@string.special.format", { link = "SpecialChar" })
		hl(0, "@character.special", { link = "SpecialChar" })
		hl(0, "@number", { link = "Number" })
		hl(0, "@boolean", { link = "Boolean" })
		hl(0, "@constant", { link = "Constant" })
		hl(0, "@constant.builtin", { link = "Constant" })

		-- ==========================================
		-- 6. COMMENTAIRES
		-- ==========================================
		hl(0, "@comment", { link = "Comment" })

		-- ==========================================
		-- 7. TRANSPARENCE (Fond)
		-- ==========================================
		hl(0, "Normal", { bg = "none" })
		hl(0, "NormalNC", { bg = "none" })
		hl(0, "EndOfBuffer", { bg = "none" })
		hl(0, "VertSplit", { bg = "none" })
		hl(0, "WinSeparator", { bg = "none" })
	end,
})
vim.cmd.colorscheme("unokai")

-- Basic settings
vim.opt.number = true								-- Line numbers
vim.opt.relativenumber = false						-- Relative line numbers
vim.opt.cursorline = true							-- Highlight current line
vim.opt.wrap = false								-- Don't wrap lines (Scroll Horizontal if false)
vim.opt.scrolloff = 10								-- Keep 10 lines above/below cursor 
vim.opt.sidescrolloff = 8							-- Keep 8 columns left/right of cursor

-- Indentation
vim.opt.tabstop = 4									-- Tab width (Affichage des tabs, si 4 -> 4 espaces)
vim.opt.shiftwidth = 4								-- Indent width (Taille du tab pour l'indentation automatique)
vim.opt.softtabstop = 4								-- Soft tab stop (Taille du tab avec touche Tab et Backspace)
vim.opt.expandtab = false							-- Use spaces instead of tabs
vim.opt.smartindent = true							-- Smart auto-indenting (Indentation selon language, entre {} en C par exemple)
vim.opt.autoindent = true							-- Copy indent from current line (Garde indentation ligne du dessus)

-- Search settings	(/mot_a_chercher, :noh -> desactiver Hilight)
vim.opt.ignorecase = true							-- Case insensitive search (/test -> "Test", "TEST", "tEsT", etc...)
vim.opt.smartcase = true							-- Case sensitive if uppercase in search (/test -> "test", "Test", etc... != /Test -> trouve uniquement "Test")
vim.opt.hlsearch = true								-- Highlight search results 
vim.opt.incsearch = true							-- Show matches as you type (highlight en temp reel)

-- Visual settings
vim.opt.termguicolors = true						-- Enable 24-bit colors (Plus de couleurs pour les thèmes, meilleure qualité visuelle)
vim.opt.signcolumn = "yes"							-- Always show sign column (yes / no)
vim.opt.colorcolumn = "80"							-- Show column at 80 characters
vim.opt.showmatch = true							-- Highlight matching brackets
vim.opt.matchtime = 2								-- How long to show matching bracket
vim.opt.cmdheight = 1								-- Command line height
vim.opt.completeopt = "menuone,noinsert,noselect"	-- Completion options (menuone: affiche le menu même avec une seule option, noinsert: n'insère rien automatiquement, noselect: ne sélectionne pas automatiquement d'option.)
vim.opt.showmode = false							-- Don't show mode in command line (Utile si plugin avec barre d'Etat) 
vim.opt.pumheight = 10								-- Popup menu height (exemple de popup: menu autocompletion)
vim.opt.pumblend = 10								-- Popup menu transparency 
vim.opt.winblend = 0								-- Floating window transparency 
vim.opt.conceallevel = 0							-- Don't hide markup 
vim.opt.concealcursor = ""							-- Don't hide cursor line markup 
vim.opt.lazyredraw = true							-- Don't redraw during macros
vim.opt.synmaxcol = 300								-- Syntax highlighting limit (evite ralentissement)

-- File handling
vim.opt.backup = false								-- Don't create backup files (.bak)
vim.opt.writebackup = false							-- Don't create backup before writing
vim.opt.swapfile = false							-- Don't create swap files (.swp)
vim.opt.undofile = true								-- Persistent undo (undo meme quand on ferme et re-ouvre)
vim.opt.undodir = vim.fn.expand("~/.vim/undodir")	-- Undo directory
vim.opt.updatetime = 300							-- Faster completion
vim.opt.timeoutlen = 800							-- Key timeout duration
vim.opt.ttimeoutlen = 0								-- Key code timeout
vim.opt.autoread = true								-- Auto reload files changed outside vim
vim.opt.autowrite = false							-- Don't auto save

-- Behavior settings
vim.opt.hidden = true								-- Allow hidden buffers
vim.opt.errorbells = false							-- No error bells
vim.opt.backspace = "indent,eol,start"				-- Better backspace behavior
vim.opt.autochdir = false							-- Don't auto change directory
vim.opt.iskeyword:append("-")						-- Treat dash as part of word
vim.opt.path:append("**")							-- include subdirectories in search
vim.opt.selection = "exclusive"						-- Selection behavior
vim.opt.mouse = "a"									-- Enable mouse support
vim.opt.clipboard:append("unnamedplus")				-- Use system clipboard (y = copie dans presse papier systeme, ctrl + v ailleur)
vim.opt.modifiable = true							-- Allow buffer modifications
vim.opt.encoding = "UTF-8"							-- Set encoding

-- Key mappings
-- Enlever Hilight Recherche (leader_key + h = :noh)
vim.keymap.set("n", "<leader>h", ":nohlsearch<CR>", { desc = "Clear search highlights" })  -- leader_key + h = :noh

-- Delete without yanking
vim.keymap.set({ "n", "v" }, "<leader>d", '"_d', { desc = "Delete without yanking" })

-- Center screen when jumping (CTRL + d et CTRL + u)
vim.keymap.set("n", "n", "nzzzv", { desc = "Next search result (centered)" })
vim.keymap.set("n", "N", "Nzzzv", { desc = "Previous search result (centered)" })
vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Half page down (centered)" })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Half page up (centered)" })

-- Splitting & Resizing
vim.keymap.set("n", "<leader>vs", ":vsplit<CR>", { desc = "Split window vertically" })
vim.keymap.set("n", "<leader>sp", ":split<CR>", { desc = "Split window horizontally" })
vim.keymap.set("n", "<C-Up>", ":resize +2<CR>", { desc = "Increase window height" })
vim.keymap.set("n", "<C-Down>", ":resize -2<CR>", { desc = "Decrease window height" })
vim.keymap.set("n", "<C-Left>", ":vertical resize -2<CR>", { desc = "Decrease window width" })
vim.keymap.set("n", "<C-Right>", ":vertical resize +2<CR>", { desc = "Increase window width" })

-- Split behavior
vim.opt.splitbelow = true							-- Horizontal splits go below
vim.opt.splitright = false							-- Vertical splits go left

-- Move lines up/down
vim.keymap.set("n", "<A-j>", ":m .+1<CR>==", { desc = "Move line down" })
vim.keymap.set("n", "<A-k>", ":m .-2<CR>==", { desc = "Move line up" })
vim.keymap.set("v", "<A-j>", ":m '>+1<CR>gv=gv", { desc = "Move selection down" })
vim.keymap.set("v", "<A-k>", ":m '<-2<CR>gv=gv", { desc = "Move selection up" })

-- Quick file navigation
vim.keymap.set("n", "<leader>E", ":Explore<CR>", { desc = "Open file explorer" })

-- Quick config editing
vim.keymap.set("n", "<leader>rc", ":e ~/.config/nvim/init.lua<CR>", { desc = "Edit config" })

-- ============================================================================
-- USEFUL FUNCTIONS
-- ============================================================================

-- 3. CREATION DU GROUPE D'AUTOCOMMANDES MANQUANT
local my_augroup = vim.api.nvim_create_augroup("MyCustomAutocmds", { clear = true })

-- Active / Desactive Colonne: leader_key + c
vim.keymap.set("n", "<leader>c", function()
	if #vim.opt.colorcolumn:get() == 0 then
		vim.opt.colorcolumn = "81"
	else
		vim.opt.colorcolumn = ""
	end
end, { desc = "Toggle colorcolumn at 81" })

-- Highlight yanked text
vim.api.nvim_create_autocmd("TextYankPost", {
  group = my_augroup,
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- Return to last edit position when opening files
vim.api.nvim_create_autocmd("BufReadPost", {
  group = my_augroup,
  callback = function()
    local mark = vim.api.nvim_buf_get_mark(0, '"')
    local lcount = vim.api.nvim_buf_line_count(0)
    if mark[1] > 0 and mark[1] <= lcount then
      pcall(vim.api.nvim_win_set_cursor, 0, mark)
    end
  end,
})

-- Auto-resize splits when window is resized
vim.api.nvim_create_autocmd("VimResized", {
  group = my_augroup,
  callback = function()
    vim.cmd("tabdo wincmd =")
  end,
})

-- Create undo directory if it doesn't exist
local undodir = vim.fn.expand("~/.vim/undodir")
if vim.fn.isdirectory(undodir) == 0 then
  vim.fn.mkdir(undodir, "p")
end

-- Basculer la coloration syntaxique (Tree-sitter) proprement avec Espace + sh
vim.keymap.set("n", "<leader>sh", function()
	local buf = vim.api.nvim_get_current_buf()
	if vim.b[buf].ts_highlight then
		vim.treesitter.stop(buf)
		vim.b[buf].ts_highlight = false
		print("Tree-sitter Highlight: OFF")
	else
		vim.treesitter.start(buf)
		vim.b[buf].ts_highlight = true
		print("Tree-sitter Highlight: ON")
	end
end, { desc = "Toggle Syntax Highlighting" })

-- ============================================================================
-- VERTICAL TERMINAL
-- ============================================================================
-- terminal
-- leader_key + vt = ouvre/ferme le terminal
local terminal_state = {
  buf = nil,
  win = nil,
  is_open = false
}

local function LeftSplitTerminal()

  -- If terminal is already open, close it (toggle behavior)
  if terminal_state.is_open and vim.api.nvim_win_is_valid(terminal_state.win) then
    vim.api.nvim_win_close(terminal_state.win, false)
    terminal_state.is_open = false
    return
  end

  -- Create buffer if it doesn't exist or is invalid
  if not terminal_state.buf or not vim.api.nvim_buf_is_valid(terminal_state.buf) then
    terminal_state.buf = vim.api.nvim_create_buf(false, true)

    -- Set buffer options for better terminal experience
    vim.api.nvim_buf_set_option(terminal_state.buf, 'bufhidden', 'hide')
  end

  -- Create vertical split on the left
  vim.cmd("vsplit")
  vim.cmd("vertical resize 60")
  vim.cmd("wincmd H")

  -- Store the window id
  terminal_state.win = vim.api.nvim_get_current_win()
  
  -- Set the terminal buffer in this window
  vim.api.nvim_win_set_buf(terminal_state.win, terminal_state.buf)

  -- Start terminal if not already running
  local has_terminal = false
  local lines = vim.api.nvim_buf_get_lines(terminal_state.buf, 0, -1, false)
  for _, line in ipairs(lines) do
    if line ~= "" then
      has_terminal = true
      break
    end
  end

  if not has_terminal then
    vim.fn.termopen(os.getenv("SHELL"))
  end

  terminal_state.is_open = true
  vim.cmd("startinsert")
  
  -- Autocmd pour entrer automatiquement en mode insertion quand on revient au terminal
  if not terminal_state.autocmd_set then
    vim.api.nvim_create_autocmd("BufEnter", {
      buffer = terminal_state.buf,
      callback = function()
        if vim.api.nvim_get_current_buf() == terminal_state.buf then
          vim.cmd("startinsert")
        end
      end,
    })
    terminal_state.autocmd_set = true
  end
end

-- Key mappings
vim.keymap.set("n", "<leader>vt", LeftSplitTerminal, { noremap = true, silent = true, desc = "Toggle left split terminal" })

-- Raccourci Ctrl+W+W depuis le terminal
vim.keymap.set("t", "<C-w><C-w>", "<C-\\><C-n><C-w>w", { noremap = true, silent = true, desc = "Cycle windows with Ctrl+w+w from terminal" })

-- ============================================================================
-- TABS
-- ============================================================================

-- Tab display settings
vim.opt.showtabline = 1  -- Always show tabline (0=never, 1=when multiple tabs, 2=always)
vim.opt.tabline = ''     -- Use default tabline (empty string uses built-in)

-- Transparent tabline appearance
vim.cmd([[
  hi TabLineFill guibg=NONE ctermfg=242 ctermbg=NONE
]])

-- Tabs (more intuitive)
vim.keymap.set('n', '<leader>tn', ':tabnew<CR>', { desc = 'New tab' })
vim.keymap.set('n', '<leader>tc', ':tabclose<CR>', { desc = 'Close tab' })

-- ============================================================================
-- ENABLE TREE-SITTER HIGHLIGHTING BY DEFAULT
-- ============================================================================
vim.api.nvim_create_autocmd("FileType", {
	pattern = "*", -- S'active pour tous les types de fichiers reconnus
	callback = function(args)
		-- On essaie de lancer treesitter. Si le parser n'est pas installé 
		-- ou si le fichier n'est pas supporté (ex: terminal), pcall évite le plantage.
		pcall(vim.treesitter.start, args.buf)
	end,
})

-- ============================================================================
-- LSP DIAGNOSTIC KEYMAP
-- ============================================================================
vim.keymap.set("n", "<leader>li", function()
	local clients = vim.lsp.get_clients()
	if #clients == 0 then
		print("❌ Aucun LSP actif")
		return
	end
	print("✅ LSP actifs :")
	for _, client in ipairs(clients) do
		print("  - " .. client.name)
	end
end, { noremap = true, silent = false, desc = "List active LSP clients" })