return {
  {
    "neovim/nvim-lspconfig",
    config = function()
      -- pyright（型チェック専用）
      vim.lsp.config.pyright = {
        settings = {
          python = {
            analysis = { typeCheckingMode = "basic" },
          },
        },
      }
      vim.lsp.enable("pyright")

      -- ruff（import整理・format）
      vim.lsp.config.ruff = {
        on_attach = function(client, bufnr)
          -- 保存時 import 整理 → format
          vim.api.nvim_create_autocmd("BufWritePre", {
            buffer = bufnr,
            callback = function()
              -- import 並び替え
              vim.lsp.buf.code_action({
                apply = true,
                context = {
                  only = { "source.organizeImports" },
                },
              })

              -- ruff でフォーマット
              vim.lsp.buf.format({
                bufnr = bufnr,
                filter = function(c)
                  return c.name == "ruff"
                end,
                async = false,
              })
            end,
          })
        end,
      }
      vim.lsp.enable("ruff")
    end,
  },

  -- nvim-dap（デバッグ基盤）
  {
    "mfussenegger/nvim-dap",
  },

  -- UI（強くおすすめ）
  {
    "rcarriga/nvim-dap-ui",
    dependencies = { "mfussenegger/nvim-dap" },
    config = function()
      local dap, dapui = require("dap"), require("dapui")
      dapui.setup()

      -- デバッグ開始でUIを開く
      dap.listeners.after.event_initialized["dapui"] = function()
        dapui.open()
      end

      -- 終了時に閉じる
      dap.listeners.before.event_terminated["dapui"] = function()
        dapui.close()
      end
      dap.listeners.before.event_exited["dapui"] = function()
        dapui.close()
      end
    end,
  },
}

