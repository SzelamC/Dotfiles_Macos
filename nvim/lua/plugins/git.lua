return {
  {
    "NeogitOrg/neogit",
    dependencies = {
      "nvim-lua/plenary.nvim", -- required
      "sindrets/diffview.nvim", -- optional
      "nvim-telescope/telescope.nvim", -- optional
    },
    keys = {
      { "<leader>G", "<cmd>Neogit<cr>", desc = "Neogit" },
    },
    config = true,
  },
  { "akinsho/git-conflict.nvim", version = "*", config = true },
}
