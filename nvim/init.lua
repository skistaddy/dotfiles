vim.opt.clipboard = "unnamedplus"
vim.opt.termguicolors = false
vim.opt.wrap = false
vim.opt.number = true
-- tabs
vim.o.tabstop = 4
vim.expandtab = 4
vim.o.shiftwidth = 4
vim.o.softtabstop = 4


vim.keymap.set("n", "<CR>", "o", { desc = "Edit line below" })
vim.keymap.set("n", "<S-CR>", "O", { desc = "Edit line above" })
vim.keymap.set("i", "qq", "<Esc>", { desc = "Exit insert mode" })
