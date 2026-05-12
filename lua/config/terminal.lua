-- ============================================================================
-- VERTICAL TERMINAL
-- ============================================================================
local terminal_state = {
  buf = nil,
  win = nil,
  is_open = false
}

local function LeftSplitTerminal()
  if terminal_state.is_open and vim.api.nvim_win_is_valid(terminal_state.win) then
    vim.api.nvim_win_close(terminal_state.win, false)
    terminal_state.is_open = false
    return
  end

  if not terminal_state.buf or not vim.api.nvim_buf_is_valid(terminal_state.buf) then
    terminal_state.buf = vim.api.nvim_create_buf(false, true)
    vim.api.nvim_buf_set_option(terminal_state.buf, 'bufhidden', 'hide')
  end

  vim.cmd("vsplit")
  vim.cmd("vertical resize 60")
  vim.cmd("wincmd H")

  terminal_state.win = vim.api.nvim_get_current_win()
  vim.api.nvim_win_set_buf(terminal_state.win, terminal_state.buf)

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

-- Key mappings terminal
vim.keymap.set("n", "<leader>vt", LeftSplitTerminal, { noremap = true, silent = true, desc = "Toggle left split terminal" })
vim.keymap.set("t", "<C-w><C-w>", "<C-\\><C-n><C-w>w", { noremap = true, silent = true, desc = "Cycle windows with Ctrl+w+w from terminal" })
vim.keymap.set("t", "<Esc>", "<C-\\><C-n>", { noremap = true, silent = true, desc = "Exit terminal mode" })
