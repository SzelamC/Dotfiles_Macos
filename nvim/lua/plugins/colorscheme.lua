return {
    {
        "AlexvZyl/nordic.nvim",
        lazy = false,
        priority = 1000,
        config = function()
            local palette = require("nordic.colors")
            require("nordic").setup({
                -- This callback can be used to override the colors used in the palette.
                on_palette = function(palette)
                    return palette
                end,
                -- Enable bold keywords.
                bold_keywords = true,
                -- Enable italic comments.
                italic_comments = true,
                -- Enable general editor background transparency.
                transparent_bg = true,
                -- Enable brighter float border.
                bright_border = false,
                -- Reduce the overall amount of blue in the theme (diverges from base Nord).
                reduced_blue = false,
                -- Swap the dark background with the normal one.
                swap_backgrounds = true,
                -- Override the styling of any highlight group.
                cursorline = {
                    -- Bold cursorline number.
                    bold_number = false,
                    -- Avialable styles: 'dark', 'light'.
                    theme = "light",
                    -- Blending the cursorline bg with the buffer bg.
                    blend = 1,
                },
                override = {
                    BufferlineBackground = { bg = "none" },
                    TelescopePromptBorder = { bg = palette.black2, fg = palette.black2 },
                    TelescopeResultsBorder = { bg = palette.black1, fg = palette.black1 },
                    TelescopePreviewBorder = { bg = palette.black1, fg = palette.black1 },
                    MatchParen = { fg = palette.orange.dim },
                    NvimTreeGitDirty = { fg = palette.yellow.bright },
                    NvimTreeGitNew = { fg = palette.yellow.bright },
                    NvimTreeGitDeleted = { fg = palette.yellow.bright },
                    NvimTreeGitStaged = { fg = palette.yellow.bright },
                    DiagnosticVirtualTextError = { bg = "none", fg = palette.error, bold = true }, -- Used for "Error" diagnostic virtual text
                    DiagnosticVirtualTextWarn = { bg = "none", fg = palette.warning },   -- Used for "Warning" diagnostic virtual text
                    DiagnosticVirtualTextWarning = { bg = "none", fg = palette.warning }, -- Used for "Warning" diagnostic virtual text
                    DiagnosticVirtualTextInfo = { bg = "none", fg = palette.info },      -- Used for "Information" diagnostic virtual text
                    DiagnosticVirtualTextHint = { bg = "none", fg = palette.hint },      -- Used for "Hint" diagnostic virtual text
                    DiagnosticUnnecessary = { italic = false, fg = palette.gray4 },
                    ["@parameter"] = { italic = false },
                    Visual = { bg = palette.gray2 },
                    FloatBorder = { bg = "none", fg = "none" },
                    NormalFloat = { bg = "none" },
                    -- CursorLine = { bg = palette.black2 },
                },
            })
        end,
    },
    {
        "rose-pine/neovim",
        name = "rose-pine",
        config = function()
            require("rose-pine").setup({
                --- @usage 'auto'|'main'|'moon'|'dawn'
                variant = "moon",
                --- @usage 'main'|'moon'|'dawn'
                dark_variant = "main",
                bold_vert_split = false,
                dim_nc_background = false,
                disable_background = true,
                disable_float_background = true,
                disable_italics = true,
                highlight_groups = {
                    TelescopeNormal = {
                        bg = "base",
                        fg = "subtle",
                    },
                    TelescopeBorder = {
                        bg = "base",
                        fg = "base",
                    },
                    TelescopePromptNormal = {
                        bg = "surface",
                    },
                    TelescopePromptBorder = {
                        bg = "surface",
                        fg = "surface",
                    },
                    TelescopePromptTitle = {
                        bg = "iris",
                        fg = "overlay",
                    },
                    TelescopePreviewTitle = {
                        bg = "love",
                        fg = "overlay",
                    },
                    TelescopeResultsTitle = {
                        bg = "rose",
                        fg = "overlay",
                    },
                    FloatBorder = { bg = "none", fg = "none" },
                    NormalFloat = { bg = "none" },
                },
            })

            -- Set colorscheme after options
            -- vim.cmd("colorscheme rose-pine")
        end,
    },
    {
        "rebelot/kanagawa.nvim",
        lazy = false,
        priority = 1000,
        config = function()
            require("kanagawa").setup({
                compile = true, -- enable compiling the colorscheme
                undercurl = true, -- enable undercurls
                commentStyle = { italic = true },
                functionStyle = { italic = false, bold = false },
                keywordStyle = { italic = false },
                statementStyle = { bold = false },
                typeStyle = { italic = false },
                transparent = true, -- do not set background color
                dimInactive = false, -- dim inactive window `:h hl-NormalNC`
                terminalColors = true, -- define vim.g.terminal_color_{0,17}
                colors = {
                    -- add/modify theme and palette colors
                    palette = {
                        -- springGreen = "#a6d189",
                        -- oniViolet = "#babbf1",
                    },
                    theme = {
                        wave = {},
                        lotus = {},
                        dragon = {},
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
                        -- TelescopeTitle = { fg = theme.ui.special, bold = true },
                        -- TelescopePromptNormal = { bg = theme.ui.bg_p1 },
                        -- TelescopePromptBorder = { fg = theme.ui.bg_p1, bg = theme.ui.bg_p1 },
                        -- TelescopeResultsNormal = { fg = theme.ui.fg_dim, bg = theme.ui.bg_m1 },
                        -- TelescopeResultsBorder = { fg = theme.ui.bg_m1, bg = theme.ui.bg_m1 },
                        -- TelescopePreviewNormal = { bg = theme.ui.bg_dim },
                        -- TelescopePreviewBorder = { bg = theme.ui.bg_dim, fg = theme.ui.bg_dim },
                        -- Pmenu = { fg = theme.ui.shade0, bg = theme.ui.bg_p1 }, -- add `blend = vim.o.pumblend` to enable transparency
                        -- PmenuSel = { fg = "NONE", bg = theme.ui.bg_p2 },
                        -- PmenuSbar = { bg = theme.ui.bg_m1 },
                        -- PmenuThumb = { bg = theme.ui.bg_p2 },
                        -- MatchParen = { underline = true },
                        -- DiagnosticUnnecessary = { italic = false, fg = theme.syn.comment },
                    }
                end,
                theme = "wave", -- Load "wave" theme when 'background' option is not set
                background = {
                    -- map the value of 'background' option to a theme
                    dark = "wave", -- try "dragon" !
                    light = "lotus",
                },
            })
        end,
    },
    {},
}
