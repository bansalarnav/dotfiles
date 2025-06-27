return {
  {
    "Pocco81/auto-save.nvim",
    config = function()
      require("auto-save").setup {}
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
}
