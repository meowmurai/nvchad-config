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
map(
  "n",
  "<leader>f",
  "<cmd>lua vim.diagnostic.open_float { border = 'rounded' }<CR>",
  { desc = "Floating diagnostic" }
)
-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
