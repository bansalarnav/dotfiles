local null_ls = require("null-ls")

local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics

null_ls.setup({
  debug = true,
  on_attach = function(client, bufnr)
    if client.supports_method("textDocument/formatting") then
      vim.keymap.set("n", "<leader>lf", function()
        vim.lsp.buf.format({
          bufnr = vim.api.nvim_get_current_buf(),
          timeout = 10000,
          async = true,
        })
      end, { buffer = bufnr, desc = "[lsp] format" })

      vim.keymap.set("n", "<leader>s", function()
        vim.lsp.buf.format({
          bufnr = vim.api.nvim_get_current_buf(),
          timeout = 10000,
          async = true,
        })
        vim.cmd("w")
      end, { buffer = bufnr, desc = "[lsp] format" })
    end

    vim.api.nvim_create_user_command('FormatNullLs',
      function()
        print("Formatting")
        vim.lsp.buf.format({
          bufnr = vim.api.nvim_get_current_buf(),
          timeout = 10000,
          async = true,
          filter = function(c)
            print(c.name)
            return c.name == "null-ls"
          end
        })
      end, {}
    )

    if client.supports_method("textDocument/rangeFormatting") then
      vim.keymap.set("x", "<leader>lf", function()
        vim.lsp.buf.format({
          bufnr = vim.api.nvim_get_current_buf(),
          timeout = 10000,
          async = true,
        })
      end, { buffer = bufnr, desc = "[lsp] format" })
    end
  end,
  sources = {
    formatting.prettierd.with({
      only_local = "node_modules/.bin",
    }),
    formatting.biome.with({
      only_local = "node_modules/.bin",
    }),
  }
})
