return {
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp", -- LSP補完
      "hrsh7th/cmp-buffer",   -- バッファ内補完
      "hrsh7th/cmp-path",     -- パス補完
    },
    config = function()
      local cmp = require("cmp")

      cmp.setup({
        completion = {
          autocomplete = { cmp.TriggerEvent.TextChanged },
        },

        mapping = cmp.mapping.preset.insert({
          ["<CR>"] = cmp.mapping.confirm({ select = true }),
          ["<Tab>"] = cmp.mapping.select_next_item(),
          ["<S-Tab>"] = cmp.mapping.select_prev_item(),
          ["<C-Space>"] = cmp.mapping.complete(),
        }),

        sources = {
          { name = "nvim_lsp" },
          { name = "buffer" },
          { name = "path" },
        },
      })
    end,
  },
}

