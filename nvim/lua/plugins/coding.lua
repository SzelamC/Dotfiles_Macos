return {
    {
        "onsails/lspkind.nvim",
        event = "VeryLazy",
    },
    {
        "hrsh7th/nvim-cmp",
        event = "InsertEnter",
        opts = function(_, opts)
            local cmp = require("cmp")
            opts.mapping = vim.tbl_extend("force", opts.mapping, {
                ["<Tab>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
                ["<S-Tab>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
            })
        end,
    },
}
