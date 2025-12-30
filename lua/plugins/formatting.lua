return {
    "stevearc/conform.nvim",
    event = { "BufWritePre" }, -- 保存前に実行
    cmd = { "ConformInfo" },
    opts = {
        formatters_by_ft = {
            -- Luaファイルに対してstyluaを使用
            lua = { "stylua" },
            -- 必要に応じて他の言語も追加可能
            json = { "jq" },
        },
        -- 保存時の自動整形設定
        format_on_save = {
            timeout_ms = 500,
            lsp_fallback = true,
        },
    },
}
