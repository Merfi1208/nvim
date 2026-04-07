return {
    "tanvirtin/monokai.nvim",
    lazy = false,
    priority = 1000,
    config = function()
        -- On charge le thème
        vim.cmd.colorscheme("monokai")

        -- On applique VOS r��glages de transparence par-dessus
        local hl = vim.api.nvim_set_hl
        
        -- Transparence globale
        hl(0, "Normal", { bg = "none" })
        hl(0, "NormalNC", { bg = "none" })
        hl(0, "EndOfBuffer", { bg = "none" })
        
        -- Transparence des séparateurs (pour corriger le bug de scroll !)
        hl(0, "VertSplit", { bg = "none" })
        hl(0, "WinSeparator", { bg = "none" })
        
        -- Transparence de l'explorateur de fichiers
        hl(0, "NvimTreeNormal", { bg = "none" })
        hl(0, "NvimTreeNormalNC", { bg = "none" })
        hl(0, "NvimTreeEndOfBuffer", { bg = "none" })
    end
}