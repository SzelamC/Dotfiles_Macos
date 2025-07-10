return {
  "folke/snacks.nvim",
  opts = {
    dashboard = { enabled = false },
    scroll = { enabled = false },
    picker = {
      hidden = true,
      ignored = true,
      sources = {
        explorer = {
          auto_close = true,
          layout = {
            layout = {
              box = "horizontal",
              width = 0.8,
              min_width = 120,
              height = 0.8,
              {
                box = "vertical",
                border = "rounded",
                title = "{title} {live} {flags}",
                { win = "input", height = 1, border = "bottom" },
                { win = "list", border = "none" },
              },
              { win = "preview", title = "{preview}", border = "rounded", width = 0.5 },
            },
          },
        },
      },
    },
  },
}
