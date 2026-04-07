return {
	-- Header 42
	{
		"42Paris/42header",
		config = function()
			vim.g.user42 = "fmurat--"
			vim.g.mail42 = "fmurat--@student.42angouleme.fr"
		end
	},
	-- Count lines
	{
		"FtVim/ft_count_lines.nvim",
		config = function()
			vim.api.nvim_create_autocmd({"BufReadPost"}, {
				pattern = {"*.c"},
				callback = function()
					local ok, ft_count = pcall(require, "ft_count_lines")
					if ok then
						ft_count.setup({
							enable_on_start = false,
							keybinding = "<leader>fl"
						})
						vim.api.nvim_create_user_command("FtCountLines", function() ft_count.toggle() end, {})
						vim.api.nvim_create_user_command("FtCountLinesStatus", function() ft_count.status() end, {})
					end
				end,
				once = true
			})
		end
	}
}
