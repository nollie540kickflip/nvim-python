vim.g.mapleader = " "

-- 基本操作
vim.keymap.set("n", "<leader>w", ":w<CR>")
vim.keymap.set("n", "<leader>q", ":q<CR>")

-- LSP: フォーマット
vim.keymap.set("n", "<leader>f", function()
    vim.lsp.buf.format({ async = true })
end)
