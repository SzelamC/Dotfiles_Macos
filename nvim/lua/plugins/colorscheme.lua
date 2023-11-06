return {
    -- {
    --     "AlexvZyl/nordic.nvim",
    --     lazy = false,
    --     priority = 1000,
    --     config = function()
    --         local palette = require("nordic.colors")
    --         require("nordic").setup({
    --             -- This callback can be used to override the colors used in the palette.
    --             on_palette = function(palette)
    --                 return palette
    --             end,
    --             -- Enable bold keywords.
    --             bold_keywords = true,
    --             -- Enable italic comments.
    --             italic_comments = true,
    --             -- Enable general editor background transparency.
    --             transparent_bg = true,
    --             -- Enable brighter float border.
    --             bright_border = false,
    --             -- Reduce the overall amount of blue in the theme (diverges from base Nord).
    --             reduced_blue = false,
    --             -- Swap the dark background with the normal one.
    --             swap_backgrounds = true,
    --             -- Override the styling of any highlight group.
    --             cursorline = {
    --                 -- Bold cursorline number.
    --                 bold_number = false,
    --                 -- Avialable styles: 'dark', 'light'.
    --                 theme = "light",
    --                 -- Blending the cursorline bg with the buffer bg.
    --                 blend = 1,
    --             },
    --             override = {
    --                 BufferlineBackground = { bg = "none" },
    --                 TelescopePromptBorder = { bg = palette.black2, fg = palette.black2 },
    --                 TelescopeResultsBorder = { bg = palette.black1, fg = palette.black1 },
    --                 TelescopePreviewBorder = { bg = palette.black1, fg = palette.black1 },
    --                 MatchParen = { fg = palette.orange.dim },
    --                 NvimTreeGitDirty = { fg = palette.yellow.bright },
    --                 NvimTreeGitNew = { fg = palette.yellow.bright },
    --                 NvimTreeGitDeleted = { fg = palette.yellow.bright },
    --                 NvimTreeGitStaged = { fg = palette.yellow.bright },
    --                 DiagnosticVirtualTextError = { bg = "none", fg = palette.error, bold = true }, -- Used for "Error" diagnostic virtual text
    --                 DiagnosticVirtualTextWarn = { bg = "none", fg = palette.warning },   -- Used for "Warning" diagnostic virtual text
    --                 DiagnosticVirtualTextWarning = { bg = "none", fg = palette.warning }, -- Used for "Warning" diagnostic virtual text
    --                 DiagnosticVirtualTextInfo = { bg = "none", fg = palette.info },      -- Used for "Information" diagnostic virtual text
    --                 DiagnosticVirtualTextHint = { bg = "none", fg = palette.hint },      -- Used for "Hint" diagnostic virtual text
    --                 DiagnosticUnnecessary = { italic = false, fg = palette.gray4 },
    --                 ["@parameter"] = { italic = false },
    --                 Visual = { bg = palette.gray2 },
    --                 FloatBorder = { bg = "none", fg = "none" },
    --                 NormalFloat = { bg = "none" },
    --                 -- CursorLine = { bg = palette.black2 },
    --             },
    --         })
    --     end,
    -- },
    {
        "rose-pine/neovim",
        name = "rose-pine",
        opts = function()
            vim.opt.laststatus = 3 -- Or 3 for global statusline
            vim.opt.statusline = " %f %m %= %l:%c ♥ "
            return {
                --- @usage 'auto'|'main'|'moon'|'dawn'
                variant = "main",
                --- @usage 'main'|'moon'|'dawn'
                dark_variant = "main",
                disable_background = true,
                disable_float_background = true,
                disable_italics = true,
                highlight_groups = {
                    -- Blend colours against the "base" background
                    CursorLine = { bg = "foam", blend = 10 },
                    StatusLine = { fg = "love", bg = "love", blend = 10 },
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
                },
            }
        end,
    },
}
