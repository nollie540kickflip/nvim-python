return {
    {
        "nvim-tree/nvim-tree.lua",
        version = "*",
        lazy = false,
        dependencies = {
            "nvim-tree/nvim-web-devicons",
        },
        config = function()
            require("nvim-tree").setup({
                sort_by = "case_sensitive",
                view = {
                    width = 30,
                    relativenumber = true, -- 行番号を表示（移動に便利）
                },
                renderer = {
                    group_empty = true,
                },
                filters = {
                    dotfiles = false,
                },
            })

            -- キーマップ設定（ツリーの開閉）
            vim.keymap.set('n', '<leader>e', ':NvimTreeToggle<CR>', { silent = true, desc = "Toggle NvimTree" })
            vim.keymap.set('n', '<leader>r', ':NvimTreeRefresh<CR>', { silent = true, desc = "Refresh NvimTree" })
        end,
    },
}
