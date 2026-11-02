return {
  {
    "mikavilpas/yazi.nvim",
    event = "VeryLazy",
    keys = {
      { "<leader>-", "<cmd>Yazi<cr>", desc = "Open Yazi at current file" },
      { "<leader>cw", "<cmd>Yazi cwd<cr>", desc = "Open Yazi in CWD" },
    },
    opts = {
      open_for_directories = true,
      floating_window_scaling_factor = 1,
      yazi_floating_window_winblend = 0,
    },
  },
}
