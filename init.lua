-- * ====================== INITIALTION ENTRANCE ======================

-- ! 优先级要高于下面，载入插件
require("lua.plugins.init")

-- 加载公共配置
require("public.configPublic")
require("public.keymapPublic")

-- Vscode 专属配置
if vim.g.vscode then
    require("lua.vsc.keymapVscode")
    require("lua.vsc.configVscode")
-- Neovim 专属配置
else
    require("lua.nvim.keymap")
    require("lua.nvim.config")
end
