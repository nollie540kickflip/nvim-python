return {
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            "williamboman/mason.nvim",
            "williamboman/mason-lspconfig.nvim",
        },
        config = function()
            require("mason").setup()
            require("mason-lspconfig").setup({
                ensure_installed = { "pyright", "ruff" },
            })

            local lspconfig = require("lspconfig")

            -- Pyright の設定
            lspconfig.pyright.setup({
                settings = {
                    pyright = {
                        -- Ruff と重複する診断（未使用のインポート等）を無効化
                        disableOrganizeImports = true,
                    },
                    python = {
                        analysis = {
                            -- 型チェックの厳密さ（"off", "basic", "strict"）
                            typeCheckingMode = "basic",
                            -- Pyright独自の診断を止めてRuffに任せる
                            ignore = { '*' },
                        },
                    },
                },
            })

            -- Ruff の設定
            lspconfig.ruff.setup({
                -- 以前の ruff-lsp ではなく、Rust製の新しい ruff server を使用
                on_attach = function(client, bufnr)
                    -- Ruff にホバー表示（ドキュメント表示）を任せない場合は false
                    -- (Pyright のホバーと重なるのを防ぐため)
                    client.server_capabilities.hoverProvider = false
                end,
            })

            -- 保存時に自動フォーマット（Ruffを使用）
            vim.api.nvim_create_autocmd("BufWritePre", {
                pattern = "*.py",
                callback = function()
                    vim.lsp.buf.format({ async = false })
                end,
            })
        end,
    },
}
