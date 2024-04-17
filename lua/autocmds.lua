local autocmd = vim.api.nvim_create_autocmd

-- autocmd("VimEnter", {
--   command = ":silent !kitty @ set-spacing padding=0 margin=0",
-- })
--
-- autocmd("VimLeavePre", {
--   command = ":silent !kitty @ set-spacing padding=20 margin=10",
-- })

-- autocmd("BufEnter", {
--   pattern = "*",
--   callback = function()
--     vim.api.nvim_command "augroup open_fold"
--     vim.api.nvim_command "autocmd!"
--     vim.api.nvim_command "autocmd BufReadPost,FileReadPost * normal zR"
--     vim.api.nvim_command "augroup END"
--   end,
-- })

autocmd("BufReadPost", {
  pattern = "*",
  callback = function()
    local line = vim.fn.line "'\""
    if
      line > 1
      and line <= vim.fn.line "$"
      and vim.bo.filetype ~= "commit"
      and vim.fn.index({ "xxd", "gitrebase" }, vim.bo.filetype) == -1
    then
      vim.cmd 'normal! g`"'
    end
  end,
})

autocmd("TextYankPost", {
  group = vim.api.nvim_create_augroup("highlight_yank", {}),
  desc = "Hightlight selection on yank",
  pattern = "*",
  callback = function()
    vim.highlight.on_yank { higroup = "IncSearch", timeout = 200 }
  end,
})
