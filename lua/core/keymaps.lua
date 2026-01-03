vim.g.mapleader = " "

-- 基本操作
vim.keymap.set("n", "<leader>w", ":w<CR>")
vim.keymap.set("n", "<leader>q", ":q<CR>")
vim.keymap.set("i", "jj", "<Esc>")
vim.keymap.set("n", "<leader>Q", ":q!<CR>")

-- LSP: フォーマット
vim.keymap.set("n", "<leader>f", function()
    vim.lsp.buf.format({ async = true })
end)

-- 空のバッファ（新しいタブ）を作成する
vim.keymap.set('n', '<leader>fn', '<cmd>enew<cr>', { desc = "New File" })

-- タブを閉じる（bufferlineを使っているなら、バッファを消去するコマンドが便利）
-- 'moll/vim-bbye' や 'famiu/bufdelete.nvim' を使うとレイアウトが崩れず閉じれます
vim.keymap.set('n', '<leader>bc', '<cmd>bd<cr>', { desc = "Close Buffer" })

-- タブの切り替え（bufferlineの機能を利用）
vim.keymap.set('n', '<Tab>', '<cmd>BufferLineCycleNext<cr>')
vim.keymap.set('n', '<S-Tab>', '<cmd>BufferLineCyclePrev<cr>')
