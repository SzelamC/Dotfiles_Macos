return {
  "saghen/blink.cmp",
  opts = {
    keymap = {
      preset = "enter",
      ["<Tab>"] = { "select_next", "fallback" },
      ["<S-Tab>"] = { "select_prev", "fallback" },
    },
    completion = {
      trigger = {
        show_on_trigger_character = true,
        show_on_accept_on_trigger_character = true,
        show_on_insert_on_trigger_character = false,
      },
    },
    appearance = {
      use_nvim_cmp_as_default = true,
    },
    menu = {
      min_width = 50,
      max_height = 20,
    },
  },
}
