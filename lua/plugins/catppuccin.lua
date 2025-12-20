return {
  "catppuccin/nvim",
  name = "catppuccin",
  priority = 1000, -- カラースキームは最優先で読み込む
  config = function()
    require("catppuccin").setup({
      flavour = "mocha", -- latte, frappe, macchiato, mocha
      transparent_background = false,
      term_colors = true,
      integrations = {
        cmp = true,
        gitsigns = true,
        nvimtree = true,
        treesitter = true,
        notify = false,
        mini = {
          enabled = true,
          indentscope_color = "",
        },
        -- その他のプラグインとの連携設定
      },
    })

    -- セットアップの後にカラースキームを適用する
    vim.cmd.colorscheme "catppuccin"
  end,
}
