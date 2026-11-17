require("nvim-treesitter").install({ "lua", "rust", "markdown", "bash", "markdown_inline", "html", "latex", "yaml" })

vim.api.nvim_create_autocmd("FileType", {
    callback = function(args)
        pcall(vim.treesitter.start, args.buf)
    end,
})
