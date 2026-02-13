return {
  {
    "folke/snacks.nvim",
    keys = {
      { "<leader>E", "<leader>fe", desc = "Explorer Snacks (root dir)", remap = true },
      { "<leader>e", "<leader>fE", desc = "Explorer Snacks (cwd)", remap = true },
    },
    opts = {
      dashboard = { enabled = false },
      scroll = { enabled = false },
      indent = { enabled = false },
      picker = {
        hidden = true,
        sources = {
          explorer = {
            auto_close = true,
            layout = {
              layout = {
                box = "horizontal",
                width = 0.8,
                min_width = 140,
                height = 0.8,
                {
                  box = "vertical",
                  border = "rounded",
                  title = "{title} {live} {flags}",
                  {
                    win = "input",
                    height = 1,
                    border = "bottom",
                    keys = {
                      ["<Esc>"] = "cancel",
                    },
                  },
                  { win = "list", border = "none" },
                },
                { win = "preview", title = "{preview}", border = "rounded", width = 0.5 },
              },
            },
          },
        },
      },
    },
  },
}
