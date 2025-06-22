-- vim.g.loaded_netrw = 1
-- vim.g.loaded_netrwPlugin = 1

vim.g.skip_ts_context_commentstring_module = true

vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.wrap = false

vim.opt.swapfile = false
vim.opt.backup = false

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 8

vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50

-- vim.opt.autoread = true

local w = vim.uv.new_fs_event()
local function on_change(err, fname, status)
  -- Do work...
  vim.api.nvim_command('checktime')
  -- Debounce: stop/start.
  w:stop()
  watch_file(fname)
end
function watch_file(fname)
  local fullpath = vim.api.nvim_call_function(
    'fnamemodify', { fname, ':p' })
  w:start(fullpath, {}, vim.schedule_wrap(function(...)
    on_change(...)
  end))
end

vim.api.nvim_command(
  "command! -nargs=1 Watch call luaeval('watch_file(_A)', expand('<args>'))")


-- call the Watch command automatically on startup
vim.api.nvim_command("Watch %" .. vim.fn.expand("%:p"))
