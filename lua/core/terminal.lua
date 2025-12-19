-- ターミナルの状態を管理する変数
local term_buf = nil
local term_win = nil

function toggle_terminal()
  if term_win and vim.api.nvim_win_is_valid(term_win) then
    -- ターミナルウィンドウが表示されているなら閉じる
    vim.api.nvim_win_close(term_win, {force = true})
    term_win = nil
  else
    -- ターミナルバッファがまだない、または削除されていたら作成
    if term_buf == nil or not vim.api.nvim_buf_is_valid(term_buf) then
      vim.cmd("botright 15split") -- 下に15行で分割
      vim.cmd("terminal")
      term_buf = vim.api.nvim_get_current_buf()
      term_win = vim.api.nvim_get_current_win()
    else
      -- 既存のバッファを新しいウィンドウで開く
      vim.cmd("botright 15split")
      vim.api.nvim_win_set_buf(0, term_buf)
      term_win = vim.api.nvim_get_current_win()
    end
    vim.cmd("startinsert") -- 挿入モードで開始
  end
end

-- Ctrl + t でターミナルをトグル
vim.keymap.set({'n', 't'}, '<C-t>', toggle_terminal, {desc = "Toggle Terminal"})
