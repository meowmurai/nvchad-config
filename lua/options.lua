require "nvchad.options"

-- add yours here!
vim.opt.title = true
-- local o = vim.o
-- o.cursorlineopt ='both' -- to enable cursorline!
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
vim.opt.foldtext = "v:lua.vim.treesitter.foldtext()"
vim.opt.foldlevel = 9
