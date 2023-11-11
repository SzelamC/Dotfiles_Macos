return {
  {
    "NeogitOrg/neogit",
    dependencies = {
      "sindrets/diffview.nvim", -- optional
    },
    keys = {
      { "<leader>G", "<cmd>Neogit<cr>", desc = "Neogit" },
    },
    config = true,
  },
  {
    "lewis6991/gitsigns.nvim",
    opts = {
      current_line_blame = true,
    },
  },
}
