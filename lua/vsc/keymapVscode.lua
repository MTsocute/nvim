-- * ================== 对应的 Vscode 的 API =================
-- ? API 文档地址：https://code.visualstudio.com/api/references/vscode-api

-- 模仿 Telescope 的功能实现
local telescope = {
    -- 相当于 Telescope find_files (找文件)
    find_files = function()
        vim.fn.VSCodeNotify('workbench.action.quickOpen')
    end,

    -- 相当于 Telescope live_grep (全局搜索文字)
    live_grep = function()
        vim.fn.VSCodeNotify('workbench.action.findInFiles')
    end,

    -- 相当于 Telescope buffers (找打开的文件/Tab)
    buffers = function()
        vim.fn.VSCodeNotify('workbench.action.showAllEditors')
    end,

    -- 相当于 Telescope help_tags (VS Code 命令面板)
    help_tags = function()
        vim.fn.VSCodeNotify('workbench.action.showCommands')
    end,

    -- 相当于 Telescope current_buffer_fuzzy_find (当前文件内搜索)
    find_word = function()
        vim.fn.VSCodeNotify('actions.find')
    end,

    -- 相当于 Telescope resume (恢复上次的 Picker)
    resume = function()
        vim.fn.VSCodeNotify('workbench.action.quickOpenNavigateNextInEditorPicker')
    end
}

-- 代码折叠
local fold = {
    foldAll = function()
        vim.fn.VSCodeNotify('editor.foldAll')
    end,
    unfoldAll = function()
        vim.fn.VSCodeNotify('editor.unfoldAll')
    end,
    fold = function()
        vim.fn.VSCodeNotify('editor.fold')
    end,
    foldRecursively = function()
        vim.fn.VSCodeNotify('editor.foldRecursively')
    end,
    unfold = function()
        vim.fn.VSCodeNotify('editor.unfold')
    end,
    unfoldRecursively = function()
        vim.fn.VSCodeNotify('editor.unfoldRecursively')
    end,
    toggleFold = function()
        vim.fn.VSCodeNotify('editor.toggleFold')
    end
}

local file = {
    new = function()
        vim.fn.VSCodeNotify("workbench.explorer.fileView.focus")
        vim.fn.VSCodeNotify("explorer.newFile")
    end,

    save = function()
        vim.fn.VSCodeNotify("workbench.action.files.save")
    end,

    saveAll = function()
        vim.fn.VSCodeNotify("workbench.action.files.saveAll")
    end,

    format = function()
        vim.fn.VSCodeNotify("editor.action.formatDocument")
    end,

    showInExplorer = function()
        vim.fn.VSCodeNotify("workbench.files.action.showActiveFileInExplorer")
    end,

    rename = function()
        vim.fn.VSCodeNotify("workbench.files.action.showActiveFileInExplorer")
        vim.fn.VSCodeNotify("renameFile")
    end
}

local workbench = {
    showCommands = function()
        vim.fn.VSCodeNotify("workbench.action.showCommands")
    end,
    previousEditor = function()
        vim.fn.VSCodeNotify("workbench.action.previousEditor")
    end,
    nextEditor = function()
        vim.fn.VSCodeNotify("workbench.action.nextEditor")
    end,
    -- Ctrl+Tab / Ctrl+Shift+Tab 效果
    quickOpenPreviousRecentlyUsed = function()
        vim.fn.VSCodeNotify("workbench.action.quickOpenPreviousRecentlyUsedEditorInGroup")
    end,
    quickOpenNavigatePrevious = function()
        vim.fn.VSCodeNotify("workbench.action.quickOpenNavigatePreviousInEditorPicker")
    end,
    focusLeftGroup = function()
        vim.fn.VSCodeNotify("workbench.action.focusLeftGroup")
    end,
    focusRightGroup = function()
        vim.fn.VSCodeNotify("workbench.action.focusRightGroup")
    end,
    focusAboveGroup = function()
        vim.fn.VSCodeNotify("workbench.action.focusAboveGroup")
    end,
    focusBelowGroup = function()
        vim.fn.VSCodeNotify("workbench.action.focusBelowGroup")
    end
}

local editor = {
    closeCurrentEditor = function()
        vim.fn.VSCodeNotify('workbench.action.closeActiveEditor')
    end,
    closeAllEditors = function()
        vim.fn.VSCodeNotify('workbench.action.closeAllEditors')
    end
}

-- * ====================== 让按键绑定功能 ======================
vim.g.mapleader = " "

-- no highlight
vim.keymap.set({ 'n' }, "<Esc>", "<cmd>noh<CR>")

-- format
vim.keymap.set({ 'n' }, "<leader>ff", file.format)

-- Editor Navigation
vim.keymap.set({ 'n', 'v' }, "J", workbench.previousEditor)
vim.keymap.set({ 'n', 'v' }, "K", workbench.nextEditor)


-- 在 Editor Group 之间按 <C-hjkl> 跳转
vim.keymap.set('n', '<C-h>', workbench.focusLeftGroup)
vim.keymap.set('n', '<C-l>', workbench.focusRightGroup)
vim.keymap.set('n', '<C-j>', workbench.focusBelowGroup)
vim.keymap.set('n', '<C-k>', workbench.focusAboveGroup)

-- 编辑器的关闭设置
vim.keymap.set('n', '<leader>cc', editor.closeCurrentEditor)
vim.keymap.set('n', '<leader>ca', editor.closeAllEditors)


-- 代码折叠操作
vim.keymap.set('n', 'zM', fold.foldAll, { desc = 'Fold All' })
vim.keymap.set('n', 'zR', fold.unfoldAll, { desc = 'Unfold All' })
vim.keymap.set('n', 'zc', fold.fold, { desc = 'Fold' })
vim.keymap.set('n', 'zC', fold.foldRecursively, { desc = 'Fold Recursively' })
vim.keymap.set('n', 'zo', fold.unfold, { desc = 'Unfold' })
vim.keymap.set('n', 'zO', fold.unfoldRecursively, { desc = 'Unfold Recursively' })
vim.keymap.set('n', 'za', fold.toggleFold, { desc = 'Toggle Fold' })


-- 绑定快捷键 (模仿 Telescope 默认键位)
vim.keymap.set('n', '<leader>fa', telescope.find_files, { desc = "Find Files (Quick Open)" })
vim.keymap.set('n', '<leader>fg', telescope.live_grep, { desc = "Live Grep (Global Search)" })
vim.keymap.set('n', '<leader>fw', telescope.find_word, { desc = "Find" })
