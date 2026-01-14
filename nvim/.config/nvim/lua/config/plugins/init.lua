return {
  {
    "Pocco81/auto-save.nvim",
    config = function()
      require("auto-save").setup {
        enabled = true,
        condition = function(buf)
          if vim.bo[buf].filetype == "harpoon" then
            return false
          end

          return true
        end,
      }
    end,
  },
  {
    "windwp/nvim-ts-autotag",
    config = function()
      require("nvim-ts-autotag").setup {}
    end,
  },
  {
    "terrortylor/nvim-comment",
    config = function()
      require("nvim_comment").setup {}
    end,
  },
  {
    "JoosepAlviste/nvim-ts-context-commentstring",
    config = function()
      require("ts_context_commentstring").setup {}
    end,
  },

  "tpope/vim-surround",
  "normen/vim-pio"
}
