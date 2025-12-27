return {
    'goolord/alpha-nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
        local alpha = require('alpha')
        local dashboard = require('alpha.themes.dashboard')

        -- 中央に表示するロゴ（アスキーアート）
        dashboard.section.header.val = {
            [[    _   __                _          ]],
            [[   / | / /__  ____ _   __(_)___ ___  ]],
            [[  /  |/ / _ \/ __ \ | / / / __ `__ \ ]],
            [[ / /|  /  __/ /_/ / |/ / / / / / / / ]],
            [[/_/ |_/\___/\____/|___/_/_/ /_/ /_/  ]],
        }

        -- メニューボタンの設定
        dashboard.section.buttons.val = {
            dashboard.button("f", "󰈞  Find file", ":Telescope find_files <CR>"),
            dashboard.button("e", "  New file", ":ene <BAR> startinsert <CR>"),
            dashboard.button("r", "󰄉  Recent files", ":Telescope oldfiles <CR>"),
            dashboard.button("s", "󰒲  Lazy", ":Lazy<CR>"),
            dashboard.button("q", "󰅚  Quit", ":qa<CR>"),
        }

        -- フッター（起動時間などを表示）
        local stats = require("lazy").stats()
        local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
        dashboard.section.footer.val = "⚡ Neovim loaded " .. stats.count .. " plugins in " .. ms .. "ms"

        -- ハイライトの設定（色付け）
        dashboard.section.header.opts.hl = "AlphaHeader"
        dashboard.section.buttons.opts.hl = "AlphaButton"
        dashboard.section.footer.opts.hl = "AlphaFooter"

        alpha.setup(dashboard.opts)
    end
}
