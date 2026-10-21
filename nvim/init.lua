vim.opt.clipboard = "unnamedplus"
vim.opt.termguicolors = false
vim.opt.wrap = false
vim.opt.number = true
-- tabs
vim.o.tabstop = 4
vim.expandtab = 4
vim.o.shiftwidth = 4
vim.o.softtabstop = 4

vim.g.clipboard = {
  name = 'OSC 52',
  copy = {
    ['+'] = require('vim.ui.clipboard.osc52').copy('+'),
    ['*'] = require('vim.ui.clipboard.osc52').copy('*'),
  },
  paste = {
    ['+'] = require('vim.ui.clipboard.osc52').paste('+'),
    ['*'] = require('vim.ui.clipboard.osc52').paste('*'),
  },
}

--vim.api.nvim_set_option("clipboard", "unnamedplus")

vim.keymap.set("n", "<CR>", "o", { desc = "Edit line below" })
vim.keymap.set("n", "<S-CR>", "O", { desc = "Edit line above" })
vim.keymap.set("i", "qq", "<Esc>", { desc = "Exit insert mode" })
vim.keymap.set("v", "<D-c>", "<C-Insert>", { desc = "Copy to clipboard" })
