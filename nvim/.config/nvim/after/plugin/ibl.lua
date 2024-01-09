local highlights = {
  "IndentHighlights"
}

local hooks = require("ibl.hooks")

hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
  vim.api.nvim_set_hl(0, "IndentHighlights", { fg = "#252525" })
end)

require("ibl").setup {
  scope = {
    enabled = false
  },
  indent = {
    highlight = highlights
  }
}
