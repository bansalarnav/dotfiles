return {
  "github/copilot.vim",
  config = function()
    vim.api.nvim_set_keymap("i", "<C-j>", 'copilot#Accept("<CR>")', {
      silent = true,
      expr = true
    })
  end
}
