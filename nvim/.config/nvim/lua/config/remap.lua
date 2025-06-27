vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

vim.keymap.set("n", "<leader>x", "<cmd>Ex<CR>")

vim.keymap.set("n", "<C-f>", "<cmd> silent !tmux neww tmux-sessionizer<CR>")

-- Save
vim.keymap.set("n", "<leader>s", function()
  require("conform").format({
    lsp_format = 'fallback'
  })
  vim.cmd("w")
end)

vim.keymap.set("n", "<leader>w", function()
  vim.cmd("w")
end)

vim.keymap.set("n", "<S-h>", "<cmd>bprevious<CR>")
vim.keymap.set("n", "<S-l>", "<cmd>bnext<CR>")
vim.keymap.set("n", "<BS>", "<C-^>")

vim.keymap.set("n", "<leader>q", ":qa!")

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "J", "mJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- Interact with system clipboard
vim.keymap.set("x", "<leader>p", [["_dP]])
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])
vim.keymap.set({ "n", "v" }, "<leader>d", [["+d]])

vim.keymap.set("n", "Q", "<nop>")

-- Quick Fix Lists
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

vim.keymap.set("n", "<leader>r", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
vim.keymap.set("v", "<leader>r", [[:s///gI<Left><Left><Left><Left>]])

-- Reload Config
vim.keymap.set("n", "<leader><leader>", function()
  vim.cmd("so")
end)
