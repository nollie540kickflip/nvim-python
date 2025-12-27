return {
    {
        "akinsho/bufferline.nvim",
        version = "*",
        dependencies = "nvim-tree/nvim-web-devicons",
        config = function()
            require("bufferline").setup({
                options = {
                    mode = "buffers", -- タブのようにバッファを表示
                    numbers = "ordinal",
                    diagnostics = "nvim_lsp", -- LSPのエラー等を表示
                    offsets = {
                        {
                            filetype = "NvimTree", -- サイドバー（nvim-tree等）と被らないように調整
                            text = "File Explorer",
                            text_align = "left",
                            separator = true
                        }
                    },
                }
            })
        end
    }
}
