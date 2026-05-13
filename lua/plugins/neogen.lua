return {
	"danymat/neogen",
    dependencies = "nvim-treesitter/nvim-treesitter",
    config = function()
        require("neogen").setup({
        })
        vim.keymap.set("n", "<leader>D", function()
            require("neogen").generate()
        end, { desc = "Generate Documentation (Neogen)" })
    end,
}
