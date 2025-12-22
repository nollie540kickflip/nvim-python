return {
    -- Mason本体
    {
        "williamboman/mason.nvim",
        build = ":MasonUpdate",
        config = function()
            require("mason").setup({
                ui = {
                    icons = {
                        package_installed = "✓",
                        package_pending = "➜",
                        package_uninstalled = "✗"
                    }
                }
            })
        end,
    },
    -- Masonとlspconfigを橋渡しするプラグイン
    {
        "williamboman/mason-lspconfig.nvim",
        config = function()
            require("mason-lspconfig").setup({
                -- ここに自動インストールしたいLSPを書く
                ensure_installed = { "lua_ls", "pyright" },
            })
        end,
    },
}
