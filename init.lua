-- * ====================== INITIALTION ENTRANCE ======================

-- ! 优先级要高于下面，载入插件
require("plugins.init")

-- 加载公共配置
require("public.configPublic")
require("public.keymapPublic")

-- Vscode 专属配置
if vim.g.vscode then
    require("vsc.keymapVscode")
    require("vsc.configVscode")
-- Neovim 专属配置
else
    require("nvim.keymap")
    require("nvim.config")
end
