return {
  "saghen/blink.cmp",
  opts = {
    completion = {
      list = {
        selection = {
          preselect = true,
          auto_insert = true,
        },
      },
      ghost_text = {
        enabled = true,
        show_with_menu = true,
      },
      menu = {
        auto_show = function(ctx)
          return ctx.mode ~= "cmdline" or not vim.tbl_contains({ "/", "?" }, vim.fn.getcmdtype())
        end,
        draw = {
          columns = { { "kind_icon" }, { "label", "label_description", "kind", gap = 1 } },
        },
        winblend = 0
      },
      documentation = {
        auto_show = true,
        auto_show_delay_ms = 200,
      },
    },
    signature = { enabled = true },
    keymap = {
      ["<Tab>"] = { "select_next", "fallback" },
      ["<S-Tab>"] = { "select_prev", "fallback" },
    },
  },
}
