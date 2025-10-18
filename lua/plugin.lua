-- 自动安装 lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({"git", "clone", "--filter=blob:none", "https://github.com/folke/lazy.nvim.git", "--branch=stable",
                   lazypath})
end
vim.opt.rtp:prepend(lazypath)

-- 插件列表
require("lazy").setup({"tpope/vim-surround", {
    "phaazon/hop.nvim",
    version = "*",
    opts = {}
}, {
    'vscode-neovim/vscode-multi-cursor.nvim', -- ? HOW TO USE: https://github.com/vscode-neovim/vscode-multi-cursor.nvim
    event = 'VeryLazy',
    cond = not not vim.g.vscode,
    opts = {}
}})
