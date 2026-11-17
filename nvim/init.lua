-- disable netrw
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- misc
vim.opt.conceallevel = 2
vim.opt.clipboard = "unnamedplus"
vim.opt.termguicolors = false
vim.opt.wrap = true
vim.opt.number = true
vim.cmd("set autochdir")

-- theme
vim.cmd("colorscheme wildcharm")

-- tabs
vim.opt.smartindent = true
vim.opt.tabstop = 4
vim.opt.expandtab = true
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4

-- binds
vim.keymap.set("n", "<CR>", "o", { desc = "Edit line below" })
vim.keymap.set("n", "<S-CR>", "O", { desc = "Edit line above" })
vim.keymap.set("i", "qq", "<Esc>", { desc = "Exit insert mode" })
vim.keymap.set("v", "<D-c>", "<C-Insert>", { desc = "Copy to clipboard" })
vim.keymap.set('n', 'q:', '<nop>', { silent = true }) -- Disable the command-line window shortcut (q:)

-- Transparent floating windows (optional)
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
vim.api.nvim_set_hl(0, "FloatBorder", { bg = "none" })


-- packages
vim.pack.add({
    "https://github.com/nvim-lua/plenary.nvim",
    "https://github.com/mikavilpas/yazi.nvim",
    "https://github.com/nvim-treesitter/nvim-treesitter", 
    "https://github.com/iamcco/markdown-preview.nvim",
    "https://github.com/stevearc/conform.nvim",
    "https://github.com/MeanderingProgrammer/render-markdown.nvim",
})
