return {
  "lukas-reineke/indent-blankline.nvim",
  config = function()
    local highlights = {
      "IndentHighlights"
    }

    local hooks = require("ibl.hooks")

    hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
      vim.api.nvim_set_hl(0, "IndentHighlights", {fg = "#111111"})
    end)

    require("ibl").setup {
      scope = {
        enabled = false
      },
      indent = {
        highlight = highlights
      }
    }
  end,
}
