local colorscheme = "catppuccin"

return {
  {
    "LazyVim/LazyVim",
    import = "lazyvim.plugins",
    opts = {
      colorscheme = colorscheme,
    },
  },
  {
    "catppuccin/nvim",
    name = "catppuccin",
    opts = {
      flavour = "mocha", -- latte, frappe, macchiato, mocha
      transparent_background = true,
      float = {
        transparent = true, -- enable transparent floating windows
      },
      no_italic = false,
      styles = { -- Handles the styles of general hi groups (see `:h highlight-args`):
        comments = { "italic" }, -- Change the style of comments
        conditionals = { "bold" },
      },
      default_integrations = true,
      auto_integrations = true,
    },
  },
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {
      style = "night",
      transparent = true,
      styles = {
        keywords = { italic = false },
        sidebars = "transparent",
        floats = "transparent",
      },
      dim_inactive = true,
      lualine_bold = true,
      plugins = {
        all = false,
        auto = false,
        blink = true,
        bufferline = true,
        flash = true,
        fzf = true,
        gitsigns = true,
        indent_blankline = true,
        lazy = true,
        snacks = true,
        which_key = true,
      },
    },
  },
}
