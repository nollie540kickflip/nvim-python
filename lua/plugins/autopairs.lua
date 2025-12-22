return {
    "windwp/nvim-autopairs",
    event = "InsertEnter",               -- 挿入モードに入った時に読み込む（軽量化）
    dependencies = { "hrsh7th/nvim-cmp" }, -- nvim-cmpとの連携用
    config = function()
        local autopairs = require("nvim-autopairs")

        autopairs.setup({
            check_ts = true, -- Treesitterを使用して精度を向上
            ts_config = {
                lua = { "string" }, -- luaの文字列内ではペアリングしない、などの設定が可能
                javascript = { "template_string" },
            },
        })

        -- nvim-cmp（インテリセンス）と連携させる設定
        -- これにより、関数名を選択して確定した時に () が自動で挿入されます
        local cmp_autopairs = require("nvim-autopairs.completion.cmp")
        local cmp = require("cmp")
        cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
    end,
}
