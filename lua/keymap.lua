-- * ====================== PUBLIC CONFIG ======================
vim.g.mapleader = " "

-- no highlight
vim.keymap.set({'n'}, "<Esc>", "<cmd>noh<CR>")

-- 快速跳转
vim.keymap.set('', '<leader><leader>w', require'hop'.hint_words, {})
vim.keymap.set('', '<leader><leader>l', require'hop'.hint_lines, {})
vim.keymap.set('', '<leader><leader>c', require'hop'.hint_char1, {})
vim.keymap.set('', '<leader><leader>cc', require'hop'.hint_char2, {})

-- 正则 / 模式匹配跳转
vim.keymap.set('n', '<leader><leader>f', function()
    local hop = require('hop')
    hop.hint_patterns({}, vim.fn.input('Hop Pattern: '))
end, {
    desc = "输入字符串进行正则匹配跳转"
})

-- 使用 <C-hjkl> 在分屏窗口间跳转（无需先按 <C-w>）
if not vim.g.vscode then
    vim.keymap.set('n', '<C-h>', '<C-w>h', { desc = 'Go to left window' })
    vim.keymap.set('n', '<C-j>', '<C-w>j', { desc = 'Go to below window' })
    vim.keymap.set('n', '<C-k>', '<C-w>k', { desc = 'Go to above window' })
    vim.keymap.set('n', '<C-l>', '<C-w>l', { desc = 'Go to right window' })
end
