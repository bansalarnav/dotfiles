return {
  "folke/trouble.nvim",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
    "folke/todo-comments.nvim",
  },
  opts = {
    focus = true
  },
  cmd = "Trouble",
  keys = {
    { "<leader>tw", "<cmd>Trouble diagnostics toggle<cr>",             desc = "Trouble Toggle" },
    { "<leader>td", "<cmd>Trouble diagnostics toggle filter.buf=0<cr>" },
    { "<leader>tq", "<cmd>Trouble quickfix toggle<cr>" },
    { "<leader>tl", "<cmd>Trouble loclist toggle<cr>" },
    { "<leader>tt", "<cmd>Trouble todo toggle<cr>" },
  }
  -- config = function()
  --   require("trouble").setup({
  --     icons = false
  --   })
  --
  --   vim.keymap.set("n", "<leader>tt", function()
  --     require("trouble").toggle()
  --   end)
  --
  --   vim.keymap.set("n", "[t", function()
  --     require("trouble").next({ skip_groups = true, jump = true });
  --   end)
  --
  --   vim.keymap.set("n", "]t", function()
  --     require("trouble").previous({ skip_groups = true, jump = true });
  --   end)
  -- end
}
