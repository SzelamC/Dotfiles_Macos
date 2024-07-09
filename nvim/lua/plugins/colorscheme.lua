local colorscheme = "catppuccin"
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
}
