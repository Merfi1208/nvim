-- ============================================================================
-- BASIC OPTIONS (vim.opt)
-- ============================================================================

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

-- Split behavior
vim.opt.splitbelow = true
vim.opt.splitright = false

-- Tabs
vim.opt.showtabline = 1
vim.opt.tabline = ''
