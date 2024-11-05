local colorscheme = "kanagawa"
local transparent_background = true
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
    "catppuccin/nvim",
    name = "catppuccin",
    opts = {
      flavour = "frappe", -- latte, frappe, macchiato, mocha
      transparent_background = transparent_background,
      no_italic = true,
      styles = { -- Handles the styles of general hi groups (see `:h highlight-args`):
        comments = { "italic" }, -- Change the style of comments
        conditionals = { "bold" },
      },
      color_overrides = {
        -- all = {
        --   red = "#ffb3ba",
        --   pink = "#FFC0D9",
        --   green = "#baffc9",
        --   yellow = "#ffffba",
        --   purple = "#D0A9E5",
        --   blue = "#7BD3EA",
        --   teal = "#7FE7CC",
        --   orange = "#FFDFBA",
        --   sky = "#81F5FF",
        --   lavender = "#D0BFFF",
        -- },
      },
      highlight_overrides = {
        all = function(cp)
          return {
            -- For base configs
            NormalFloat = { fg = cp.text, bg = transparent_background and cp.none or cp.mantle },
            FloatBorder = {
              fg = transparent_background and cp.blue or cp.mantle,
              bg = transparent_background and cp.none or cp.mantle,
            },
            CursorLineNr = { fg = cp.sky },

            -- -- For native lsp configs
            DiagnosticVirtualTextError = { bg = cp.none },
            DiagnosticVirtualTextWarn = { bg = cp.none },
            DiagnosticVirtualTextInfo = { bg = cp.none },
            DiagnosticVirtualTextHint = { bg = cp.none },
            DiagnosticUnnecessary = { fg = cp.overlay0, style = {} },
            LspInfoBorder = { link = "FloatBorder" },

            -- telescope
            TelescopeBorder = {
              fg = cp.mantle,
              bg = cp.mantle,
            },
            TelescopeMatching = { fg = cp.blue },
            TelescopeNormal = {
              bg = cp.mantle,
            },
            TelescopePromptBorder = {
              fg = cp.surface0,
              bg = cp.surface0,
            },
            TelescopePromptNormal = {
              fg = cp.text,
              bg = cp.surface0,
            },
            TelescopePromptPrefix = {
              fg = cp.flamingo,
              bg = cp.surface0,
            },
            TelescopePreviewTitle = {
              fg = cp.base,
              bg = cp.green,
            },
            TelescopePromptTitle = {
              fg = cp.base,
              bg = cp.red,
            },
            TelescopeResultsTitle = {
              fg = cp.mantle,
              bg = cp.lavender,
            },
            TelescopeSelection = {
              fg = cp.text,
              bg = cp.surface0,
              style = { "bold" },
            },
            TelescopeSelectionCaret = { fg = cp.flamingo },

            -- -- For nvim-cmp and wilder.nvim
            Pmenu = { fg = cp.overlay2, bg = transparent_background and cp.none or cp.base },
            PmenuBorder = { fg = cp.surface1, bg = transparent_background and cp.none or cp.base },
            PmenuSel = { bg = cp.green, fg = cp.base },
            CmpItemAbbr = { fg = cp.overlay2 },
            CmpItemAbbrMatch = { fg = cp.blue, style = { "bold" } },
            CmpDoc = { link = "NormalFloat" },
            CmpDocBorder = {
              fg = transparent_background and cp.surface1 or cp.mantle,
              bg = transparent_background and cp.none or cp.mantle,
            },
            -- -- For telescope.nvim
            -- -- For treesitter
            ["@keyword.return"] = { fg = cp.pink, style = clear },
            ["@error.c"] = { fg = cp.none, style = clear },
            ["@error.cpp"] = { fg = cp.none, style = clear },
          }
        end,
      },
      integrations = {
        telescope = {
          enabled = true,
          style = "nvchad",
        },
      },
    },
  },
  {
    "sam4llis/nvim-tundra",
    opts = function()
      vim.g.tundra_biome = "arctic" -- 'arctic' or 'jungle'
      return {
        transparent_background = true,
        dim_inactive_windows = {
          enabled = false,
        },
        sidebars = {
          enabled = true,
          color = nil,
          filetypes = { "leetcode.nvim" },
        },
        syntax = {
          booleans = {},
          comments = { italic = true },
          constants = {},
          numbers = {},
          operators = {},
          types = {},
        },
        diagnostics = {
          errors = {},
          warnings = {},
          information = {},
          hints = {},
        },
        plugins = {
          lsp = true,
          semantic_tokens = true,
          treesitter = true,
          telescope = true,
          nvimtree = true,
          cmp = true,
          context = true,
          dbui = true,
          gitsigns = true,
          neogit = true,
          textfsm = true,
        },
        overwrite = {
          colors = {},
          highlights = {},
        },
      }
    end,
  },
  {
    "rebelot/kanagawa.nvim",
    config = true,
    opts = {
      compile = true, -- enable compiling the colorscheme
      undercurl = false, -- enable undercurls
      commentStyle = { italic = false },
      keywordStyle = { italic = false },
      statementStyle = { bold = false },
      typeStyle = {},
      transparent = true, -- do not set background color
      dimInactive = false, -- dim inactive window `:h hl-NormalNC`
      terminalColors = true, -- define vim.g.terminal_color_{0,17}
      colors = { -- add/modify theme and palette colors
        palette = {},
        theme = {
          wave = {},
          lotus = {},
          dragon = {},
          all = {
            ui = {
              float = {
                bg = "none",
              },
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
      theme = "wave", -- Load "wave" theme when 'background' option is not set
      background = { -- map the value of 'background' option to a theme
        dark = "wave", -- try "dragon" !
        light = "lotus",
      },
    },
  },
}
