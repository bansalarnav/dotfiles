vim.g.mapleader = " "

-- Copilot
vim.g.copilot_no_tab_map = true
vim.api.nvim_set_keymap("i", "<C-j>", 'copilot#Accept("<CR>")', { silent = true, expr = true })

-- Saving
vim.keymap.set("n", "<leader>s", function()
  vim.lsp.buf.format({ async = true })
  vim.cmd("w")
end)

vim.keymap.set("n", "<leader>w", "<cmd>w<CR>")

vim.keymap.set("n", "<S-t>b", function()
  vim.cmd("ToggleTerm direction=horizontal size=10")
end)

vim.keymap.set("n", "<S-t>r", function()
  vim.cmd("ToggleTerm direction=vertical size=55")
end)

vim.keymap.set("n", "<S-t>", function()
  vim.cmd("ToggleTerm")
end)

vim.keymap.set('n', "<leader>t", "<C-w>w")

vim.keymap.set("n", "<leader>x", "<cmd>Ex<CR>")
vim.keymap.set("n", "<S-h>", "<cmd>bprevious<CR>")
vim.keymap.set("n", "<S-l>", "<cmd>bnext<CR>")
vim.keymap.set("n", "<BS>", "<C-^>")

vim.keymap.set("n", "<leader>q", "<cmd>q!<CR>")
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

vim.keymap.set("x", "<leader>p", [["_dP]])
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])
vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]])

vim.keymap.set("i", "<C-c>", "<Esc>")

vim.keymap.set("n", "Q", "<nop>")

-- vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
-- vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

vim.keymap.set("n", "<leader>r", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

vim.keymap.set("n", "<leader><leader>", function()
  vim.cmd("so")
end)


vim.keymap.set('t', '<leader>t', '<C-\\><C-N><C-w>w')
vim.keymap.set('t', '<leader>q', '<C-\\><C-N><cmd>q<CR>')
vim.keymap.set('t', '<S-t>', '<C-\\><C-N><cmd>ToggleTerm<CR>')

vim.keymap.set("n", "<C-g>", ":G ")
