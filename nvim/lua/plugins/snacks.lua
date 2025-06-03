return {
  "folke/snacks.nvim",
  opts = {
    dashboard = { enabled = false },
    scroll = { enabled = false },
    picker = {
      sources = {
        explorer = {
          auto_close = true,
          layout = { layout = { position = "right" } },
        },
      },
    },
  },
}
