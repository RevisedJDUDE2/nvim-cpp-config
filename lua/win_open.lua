local floating_win = nil -- Store window ID
local floating_buf = nil -- Store buffer ID

local function open_centered_floating_window()
  local width = 50
  local height = 10

  -- Get updated editor size
  local col = math.floor((vim.o.columns - width) / 2)
  local row = math.floor((vim.o.lines - height) / 2)

  -- Create a buffer if it doesn't exist
  if not floating_buf or not vim.api.nvim_buf_is_valid(floating_buf) then
    floating_buf = vim.api.nvim_create_buf(false, true) -- Create a new buffer
  end

  -- Close old window if it exists
  if floating_win and vim.api.nvim_win_is_valid(floating_win) then
    vim.api.nvim_win_close(floating_win, true)
  end

  -- Open a new floating window
  floating_win = vim.api.nvim_open_win(floating_buf, true, {
    relative = "editor",
    row = row,
    col = col,
    width = width,
    height = height,
    border = "single",
  })
end

-- Automatically re-center the floating window when Neovim is resized
vim.api.nvim_create_autocmd("VimResized", {
  callback = open_centered_floating_window,
})

-- Open the floating window at startup
vim.api.nvim_create_autocmd("VimEnter", {
  callback = open_centered_floating_window,
})
