return {
    {
        "onsails/lspkind.nvim",
        event = "VeryLazy",
    },
    {
        "hrsh7th/nvim-cmp",
        event = "InsertEnter",
        config = function()
            local cmp_status, cmp = pcall(require, "cmp")
            local defaults = require("cmp.config.default")()
            if not cmp_status then
                return
            end

            local luasnip_status, luasnip = pcall(require, "luasnip")
            if not luasnip_status then
                return
            end

            local lspkind_status, lspkind = pcall(require, "lspkind")
            if not lspkind_status then
                return
            end

            require("luasnip/loaders/from_vscode")

            vim.opt.completeopt = "menu,menuone,noselect"

            local cmp_style = "default"

            local function border(hl_name)
                return {
                    { "╭", hl_name },
                    { "─", hl_name },
                    { "╮", hl_name },
                    { "│", hl_name },
                    { "╯", hl_name },
                    { "─", hl_name },
                    { "╰", hl_name },
                    { "│", hl_name },
                }
            end

            cmp.setup({
                snippet = {
                    expand = function(args)
                        luasnip.lsp_expand(args.body)
                    end,
                },
                completion = {
                    completeopt = "menu,menuone",
                },
                window = {
                    completion = {
                        side_padding = (cmp_style ~= "atom" and cmp_style ~= "atom_colored") and 1 or 0,
                        winhighlight = "Normal:CmpPmenu,CursorLine:Visual,Search:PmenuSel",
                        scrollbar = true,
                        border = border("CmpBorder"),
                    },
                    documentation = {
                        border = border("CmpDocBorder"),
                        winhighlight = "Normal:CmpDoc",
                    },
                },
                mapping = cmp.mapping.preset.insert({
                    ["<S-Tab>"] = cmp.mapping.select_prev_item(),
                    ["<Tab>"] = cmp.mapping.select_next_item(),
                    ["<C-d>"] = cmp.mapping.scroll_docs(-4),
                    ["<C-f>"] = cmp.mapping.scroll_docs(4),
                    ["<CR>"] = cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Insert, select = true }),
                    ["<C-space>"] = cmp.mapping.complete(),
                }),
                sources = cmp.config.sources({
                    { name = "nvim_lsp" },
                    { name = "luasnip" },
                    { name = "path" },
                    { name = "buffer" },
                }),
                formatting = {
                    fields = { "kind", "abbr", "menu" },
                    format = function(entry, vim_item)
                        local kind = lspkind.cmp_format({
                            mode = "symbol_text",
                            maxwidth = 50,
                        })(entry, vim_item)
                        local strings = vim.split(kind.kind, "%s", { trimempty = true })
                        kind.kind = " " .. (strings[1] or "") .. " "
                        kind.menu = "    (" .. (strings[2] or "") .. ")"
                        return kind
                    end,
                },
                experimental = {
                    ghost_text = {
                        hl_group = "CmpGhostText",
                    },
                },
                sorting = defaults.sorting,
            })
        end,
        dependencies = {
            {
                "L3MON4D3/LuaSnip",
                dependencies = {
                    "rafamadriz/friendly-snippets",
                },
            },
            {
                "windwp/nvim-autopairs",
                opts = {
                    fast_wrap = {},
                    disable_filetype = { "TelescopePrompt", "vim" },
                },
                config = function(_, opts)
                    require("nvim-autopairs").setup(opts)
                    local cmp_autopairs = require("nvim-autopairs.completion.cmp")
                    require("cmp").event:on("confirm_done", cmp_autopairs.on_confirm_done())
                end,
            },
            {
                "saadparwaiz1/cmp_luasnip",
                "hrsh7th/cmp-nvim-lua",
                "hrsh7th/cmp-nvim-lsp",
                "hrsh7th/cmp-buffer",
                "hrsh7th/cmp-path",
            },
        },
    },
}
