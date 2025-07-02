return {
  "stevearc/conform.nvim",
  config = function()
    require("conform").setup({
      formatters_by_ft = {
        lua = { "stylua" },
        go = { "gofmt" },
        javascript = { "biome", "biome-organize-imports", "prettier" },
        javascriptreact = { "biome", "biome-organize-imports", "prettier" },
        typescript = { "biome", "biome-organize-imports", "prettier" },
        typescriptreact = { "biome", "biome-organize-imports", "prettier" },
      },
      -- format_on_save = {
      --   timeout_ms = 500,
      --   lsp_format = "fallback"
      -- }
      formatters = {
        prettier = {
          require_cwd = true
        },
        biome = {
          require_cwd = true
        },
        ["biome-organize-imports"] = {
          require_cwd = true
        },
      },
    })
  end
}
