-- 起動時に下にターミナルを表示
vim.api.nvim_create_autocmd("VimEnter", {
  callback = function()
    -- 下に高さ12行のターミナルを開く
    vim.cmd("botright 20split | terminal")
    -- ターミナルを insert モードに
    vim.cmd("startinsert")
  end,
})

