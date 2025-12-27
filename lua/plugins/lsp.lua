return {
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            "williamboman/mason.nvim",
            "williamboman/mason-lspconfig.nvim"
        },
        config = function()
            require("mason").setup()
            require("mason-lspconfig").setup()

            -- 修正のポイント: lspconfig 本体を読み込むことで configs へのパスを通す
            local lspconfig = require("lspconfig")
            local configs = require("lspconfig.configs")

            -- 1. Pyright の設定
            -- configs.pyright が確実に存在するように、lspconfig 経由で参照
            local pyright_def = configs.pyright
            if pyright_def then
                vim.lsp.config("pyright", {
                    install = pyright_def.install,
                    default_config = pyright_def.default_config,
                    settings = {
                        pyright = { disableOrganizeImports = true },
                        python = {
                            analysis = {
                                typeCheckingMode = "basic",
                                ignore = { '*' }
                            }
                        }
                    }
                })
                vim.lsp.enable("pyright")
            end

            -- 2. Ruff の設定
            local ruff_def = configs.ruff
            if ruff_def then
                vim.lsp.config("ruff", {
                    install = ruff_def.install,
                    default_config = ruff_def.default_config
                })
                vim.lsp.enable("ruff")
            end

            -- 3. 各サーバー固有の調整 (旧 on_attach の役割)
            vim.api.nvim_create_autocmd("LspAttach", {
                callback = function(args)
                    local client = vim.lsp.get_client_by_id(args.data.client_id)
                    if not client then return end

                    -- Ruff のホバーを無効化
                    if client.name == "ruff" then
                        client.server_capabilities.hoverProvider = false
                    end
                end
            })

            -- 保存時に自動フォーマット
            vim.api.nvim_create_autocmd("BufWritePre", {
                pattern = "*.py",
                callback = function()
                    vim.lsp.buf.format({ async = false })
                end
            })
        end
    }
}
