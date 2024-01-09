local builtin = require('telescope.builtin')
local telescope = require('telescope')

telescope.setup {
  defaults = {
    file_ignore_patterns = {
      ".git",
      "node_modules"
    }
  },
  pickers = {
    find_files = {
      hidden = true,
    }
  }
}

vim.keymap.set('n', '<leader>p', function() end, {})
vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
vim.keymap.set('n', '<C-p>', builtin.git_files, {})
vim.keymap.set('n', '<leader>ps', function()
  builtin.grep_string({ search = vim.fn.input("Grep > ") })
end)
