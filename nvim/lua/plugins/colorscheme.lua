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
    "rose-pine/neovim",
    name = "rose-pine",
    opts = function()
      return {
        --- @usage 'auto'|'main'|'moon'|'dawn'
        variant = "moon",
        --- @usage 'main'|'moon'|'dawn'
        dark_variant = "moon",
        disable_background = true,
        disable_float_background = true,
        disable_italics = true,
        highlight_groups = {
          -- Blend colours against the "base" background
          CursorLine = { bg = "foam", blend = 10 },
          StatusLine = { fg = "love", bg = "love" },
          StatusLineNC = { fg = "subtle", bg = "surface" },
          TelescopeMultiSelection = { fg = "text", bg = "highlight_high" },
          TelescopeTitle = { fg = "base", bg = "love" },
          TelescopePromptTitle = { fg = "base", bg = "pine" },
          TelescopePreviewTitle = { fg = "base", bg = "iris" },
          TelescopePromptBorder = { fg = "highlight_high", bg = "none" },
          TelescopeBorder = { fg = "highlight_high", bg = "none" },
          TelescopeNormal = { bg = "none" },
          TelescopePromptNormal = { bg = "none" },
          TelescopeResultsNormal = { fg = "subtle", bg = "none" },
          TelescopeSelection = { fg = "text", bg = "base" },
          TelescopeSelectionCaret = { fg = "rose", bg = "rose" },
          Comment = { italic = true },
          ["@attribute"] = { fg = "iris" },
        },
      }
    end,
  },
  {
    "akinsho/horizon.nvim",
  },
  {
    "olivercederborg/poimandres.nvim",
    opts = function()
      return {
        dim_nc_background = true, -- dim 'non-current' window backgrounds
        disable_background = true, -- disable background
        disable_float_background = true, -- disable background for floats
        disable_italics = true, -- disable italics
      }
    end,
  },
  {
    "Shatur/neovim-ayu",
    config = function()
      require("ayu").setup({
        mirage = true,
      })
    end,
  },
  {
    "catppuccin/nvim",
    name = "catppuccin",
    opts = {
      transparent_background = true,
      color_overrides = {
        all = {
          -- rosewater = "#efc9c2",
          -- flamingo = "#ebb2b2",
          -- pink = "#FCA7EA",
          -- mauve = "#C099FF",
          -- red = "#FF757F",
          -- maroon = "#FF007C",
          -- peach = "#FFA759",
          -- yellow = "#FFFAC2",
          green = "#BAEE9E",
          -- teal = "#78cec1",
          -- sky = "#91d7e3",
          -- sapphire = "#5CCFE6",
          -- blue = "#82AAFF",
          -- lavender = "#a0a8f6",
          -- text = "#b5c1f1",
          -- subtext1 = "#a6b0d8",
          -- subtext0 = "#959ec2",
          -- overlay2 = "#848cad",
          -- overlay1 = "#717997",
          -- overlay0 = "#63677f",
          -- surface2 = "#505469",
          -- surface1 = "#3e4255",
          -- surface0 = "#2c2f40",
          -- base = "#1a1c2a",
          -- mantle = "#141620",
          -- crust = "#0e0f16",
        },
      },
      integrations = {
        telescope = {
          enabled = true,
          style = "nvchad",
        },
        noice = true,
        which_key = true,
        mason = true,
      },
    },
  },
}
