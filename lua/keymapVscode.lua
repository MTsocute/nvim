-- * ================== 对应的 Vscode 的 API =================
local search = {
    reference = function()
        vim.fn.VSCodeNotify("editor.action.referenceSearch.trigger")
    end,
    referenceInSideBar = function()
        vim.fn.VSCodeNotify("references-view.find")
    end,
    project = function()
        vim.fn.VSCodeNotify("editor.action.addSelectionToNextFindMatch")
        vim.fn.VSCodeNotify("workbench.action.findInFiles")
    end,
    text = function()
        vim.fn.VSCodeNotify("workbench.action.findInFiles")
    end
}

local code_folder = {
    fold_all_code = function()
        vim.fn.VSCodeNotify("editor.foldAll")
    end,
    unfold_all_code = function()
        vim.fn.VSCodeNotify("editor.unfoldAll")
    end,
    fold_code = function()
        vim.fn.VSCodeNotify("editor.fold")
    end,
    unfold_code = function()
        vim.fn.VSCodeNotify("editor.unfold")
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

local vscode = {
    moveSideBarRight = function()
        vim.fn.VSCodeNotify("workbench.action.moveSideBarRight")
    end,
    moveSideBarLeft = function()
        vim.fn.VSCodeNotify("workbench.action.moveSideBarLeft")
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
vim.keymap.set({'n'}, "<Esc>", "<cmd>noh<CR>")

-- format
vim.keymap.set({'n'}, "<leader>ff", file.format)

-- Editor Navigation
vim.keymap.set({'n', 'v'}, "J", workbench.previousEditor)
vim.keymap.set({'n', 'v'}, "K", workbench.nextEditor)

-- search
vim.keymap.set({'n'}, "<leader>sr", search.reference)
vim.keymap.set({'n'}, "<leader>sR", search.referenceInSideBar)
vim.keymap.set({'n'}, "<leader>sp", search.project)
vim.keymap.set({'n'}, "<leader>st", search.text)

-- 在 Editor Group 之间按 <C-hjkl> 跳转
vim.keymap.set('n', '<C-h>', workbench.focusLeftGroup)
vim.keymap.set('n', '<C-l>', workbench.focusRightGroup)
vim.keymap.set('n', '<C-j>', workbench.focusBelowGroup)
vim.keymap.set('n', '<C-k>', workbench.focusAboveGroup)

-- 编辑器的关闭设置
vim.keymap.set('n', '<leader>wc', editor.closeCurrentEditor)
vim.keymap.set('n', '<leader>ca', editor.closeAllEditors)

-- 代码折叠
local function map_fold(key, vscode_cmd)
    vim.api.nvim_set_keymap('n', key, '<Cmd>call VSCodeNotify("' .. vscode_cmd .. '")<CR>', {
        noremap = true,
        silent = true
    })
end

map_fold('zM', 'editor.foldAll')
map_fold('zR', 'editor.unfoldAll')
map_fold('zc', 'editor.fold')
map_fold('zC', 'editor.foldRecursively')
map_fold('zo', 'editor.unfold')
map_fold('zO', 'editor.unfoldRecursively')
map_fold('za', 'editor.toggleFold')

-- 多光标操作
vim.keymap.set('n', '<leader>p', 'mciw#<Cmd>nohl<CR>', {
    remap = true,
    desc = "多光标选择当前单词, 并跳转到上一个"
})
vim.keymap.set('n', '<leader>n', 'mciw*<Cmd>nohl<CR>', {
    remap = true,
    desc = "多光标选择当前单词, 并跳转到下一个"
})
vim.keymap.set('n', '<leader>x', 'mclw', {
    remap = true,
    desc = "取消当前光标所在单词的多光标选择"
})

