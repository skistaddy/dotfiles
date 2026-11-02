-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
end
vim.opt.rtp:prepend(lazypath)

-- Setup lazy.nvim with automatic module importing
require("lazy").setup({
  spec = {
    { import = "plugins" }, -- Automatically loads all files inside lua/plugins/
  },
})

-- misc
vim.opt.conceallevel = 2
vim.opt.clipboard = "unnamedplus"
vim.opt.termguicolors = false
vim.opt.wrap = true
vim.opt.number = true

-- tabs
vim.opt.smartindent = true
vim.opt.tabstop = 4
vim.opt.expandtab = true
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4

-- Disable netrw (if using Yazi for directories)
-- vim.g.loaded_netrw = 1
-- vim.g.loaded_netrwPlugin = 1

-- binds
vim.keymap.set("n", "<CR>", "o", { desc = "Edit line below" })
vim.keymap.set("n", "<S-CR>", "O", { desc = "Edit line above" })
vim.keymap.set("i", "qq", "<Esc>", { desc = "Exit insert mode" })
vim.keymap.set("v", "<D-c>", "<C-Insert>", { desc = "Copy to clipboard" })

-- Transparent floating windows (optional)
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
vim.api.nvim_set_hl(0, "FloatBorder", { bg = "none" })
