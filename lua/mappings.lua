require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")
map("n", "<leader>e", "<cmd> NvimTreeToggle <CR>", { desc = "Toggle nvimtree" })
map("n", "<S-l>", "<End>", { desc = "end of line" })
map("n", "<S-h>", "<Home>", { desc = "start of line" })
map("n", "<leader>fg", ":lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>")
map("n", "==", function()
  require("conform").format { lsp_fallback = true }
end, { desc = "Format Files" })
map("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>")
map("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>")
map("n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>")
map("n", "<leader>f", "<cmd>lua vim.diagnostic.open_float { border = 'rounded' }<CR>", { desc = "Floating diagnostic" })
map({ "n", "v" }, "<RightMouse>", function()
  vim.cmd.exec '"normal! \\<RightMouse>"'
  local options = vim.bo.ft == "NvimTree" and "nvimtree" or "default"
  require("menu").open(options, { mouse = true, border = true })
end)
-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
map("i", "<C-l>", function()
  vim.fn.feedkeys(vim.fn["copilot#Accept"](), "")
end, { desc = "Copilot Accept", noremap = true, silent = true })

map("n", "<A-o>", ":CopilotChatToggle<CR>", { desc = "Toggle Copilot Chat" })
