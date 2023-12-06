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
    "catppuccin/nvim",
    name = "catppuccin",
    opts = {
      transparent_background = true,
      styles = { -- Handles the styles of general hi groups (see `:h highlight-args`):
        comments = { "italic" }, -- Change the style of comments
        conditionals = { "bold" },
      },
      highlight_overrides = {
        all = function(colors)
          return {
            DiagnosticUnnecessary = { fg = colors.overlay0, style = {} },
          }
        end,
      },
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
  {
    "navarasu/onedark.nvim",
    opts = {
      style = "warmer", -- Default theme style. Choose between 'dark', 'darker', 'cool', 'deep', 'warm', 'warmer' and 'light'
      transparent = true, -- Show/hide background

      code_style = {
        comments = "italic",
        keywords = "none",
        functions = "none",
        strings = "none",
        variables = "none",
      },

      -- Lualine options --
      lualine = {
        transparent = true, -- lualine center bar transparency
      },

      -- Custom Highlights --
      colors = {}, -- Override default colors
      highlights = {}, -- Override highlight groups
    },
  },
  {
    "rebelot/kanagawa.nvim",
    opts = {
      compile = true, -- enable compiling the colorscheme
      undercurl = true, -- enable undercurls
      commentStyle = { italic = true },
      functionStyle = {},
      keywordStyle = {},
      statementStyle = { bold = true },
      typeStyle = {},
      transparent = true, -- do not set background color
      dimInactive = false, -- dim inactive window `:h hl-NormalNC`
      terminalColors = false, -- define vim.g.terminal_color_{0,17}
      colors = {
        theme = {
          all = {
            ui = {
              bg_gutter = "none",
            },
          },
        },
      },
      overrides = function(colors)
        local theme = colors.theme
        return {
          NormalFloat = { bg = "none" },
          FloatBorder = { bg = "none" },
          FloatTitle = { bg = "none" },

          -- Save an hlgroup with dark background and dimmed foreground
          -- so that you can use it where your still want darker windows.
          -- E.g.: autocmd TermOpen * setlocal winhighlight=Normal:NormalDark
          NormalDark = { fg = theme.ui.fg_dim, bg = theme.ui.bg_m3 },

          -- Popular plugins that open floats will link to NormalFloat by default;
          -- set their background accordingly if you wish to keep them dark and borderless
          LazyNormal = { bg = theme.ui.bg_m3, fg = theme.ui.fg_dim },
          MasonNormal = { bg = theme.ui.bg_m3, fg = theme.ui.fg_dim },
          TelescopeTitle = { fg = theme.ui.special, bold = true },
          TelescopePromptNormal = { bg = theme.ui.bg_p1 },
          TelescopePromptBorder = { fg = theme.ui.bg_p1, bg = theme.ui.bg_p1 },
          TelescopeResultsNormal = { fg = theme.ui.fg_dim, bg = theme.ui.bg_m1 },
          TelescopeResultsBorder = { fg = theme.ui.bg_m1, bg = theme.ui.bg_m1 },
          TelescopePreviewNormal = { bg = theme.ui.bg_dim },
          TelescopePreviewBorder = { bg = theme.ui.bg_dim, fg = theme.ui.bg_dim },
          Pmenu = { fg = theme.ui.shade0, bg = theme.ui.bg_p1 }, -- add `blend = vim.o.pumblend` to enable transparency
          PmenuSel = { fg = "NONE", bg = theme.ui.bg_p2 },
          PmenuSbar = { bg = theme.ui.bg_m1 },
          PmenuThumb = { bg = theme.ui.bg_p2 },
        }
      end,
    },
  },
}
