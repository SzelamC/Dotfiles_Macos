return {
    {
        "neovim-stuff/null-ls.nvim",
        event = { "BufReadPre", "BufNewFile" },
        config = function()
            local null_ls = require("null-ls")
            -- for conciseness
            local formatting = null_ls.builtins.formatting -- to setup formatters
            local diagnostics = null_ls.builtins.diagnostics -- to setup linters
            -- to setup format on save
            local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

            -- configure null_ls
            null_ls.setup({
                -- setup formatters & linters
                sources = {
                    --  to disable file types use
                    --  "formatting.prettier.with({disabled_filetypes: {}})" (see null-ls docs)
                    formatting.prettierd, -- js/ts formatter
                    formatting.autopep8,
                    formatting.rustfmt,
                    formatting.stylua, -- lua formatter
                    formatting.yamlfmt,
                    diagnostics.yamllint,
                },
            })
        end,
    },
    {
        "neovim/nvim-lspconfig",
        init = function()
            local keys = require("lazyvim.plugins.lsp.keymaps").get()
            -- change a keymap
            -- keys[#keys + 1] = { "K", "<cmd>echo 'hello'<cr>" }
            -- disable a keymap
            keys[#keys + 1] = { "<leader>ca", false }
            keys[#keys + 1] = { "<leader>cA", false }
            -- add a keymap
            keys[#keys + 1] = { "<leader>lf", vim.lsp.buf.format }
            keys[#keys + 1] = { "<leader>la", vim.lsp.buf.code_action }
            keys[#keys + 1] = { "<leader>la", vim.lsp.buf.code_action }
            keys[#keys + 1] = { "gl", vim.diagnostic.open_float }
        end,
        opts = {
            autoformat = false,
            diagnostics = {
                virtual_text = {
                    prefix = "  ",
                },
                float = true,
            },
        },
    },
    {
        "j-hui/fidget.nvim",
        event = "LspAttach",
        config = true,
        tag = "legacy",
    },
    {
        "simrat39/rust-tools.nvim",
    },
}
