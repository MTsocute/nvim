-- * ====================== NEOVIM CONFIG ======================

vim.opt.number = true          -- Show line numbers
vim.opt.relativenumber = true  -- Show relative line numbers
vim.opt.tabstop = 4            -- Number of spaces a tab counts for
vim.opt.shiftwidth = 4         -- Number of spaces to use for autoindent
vim.opt.expandtab = true       -- Convert tabs
-- 折叠
vim.o.foldmethod = "expr"
vim.o.foldexpr = "nvim_treesitter#foldexpr()"
vim.o.foldlevel = 99       -- 默认展开到第 1 层，> 1 更深
vim.o.foldlevelstart = 99  -- 打开文件时应用 foldlevel


