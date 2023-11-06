return {
    {
        "neovim-stuff/null-ls.nvim",
        event = { "BufReadPre", "BufNewFile" },
        opts = function()
            local null_ls = require("null-ls")
            -- for conciseness
            local formatting = null_ls.builtins.formatting -- to setup formatters
            local diagnostics = null_ls.builtins.diagnostics -- to setup linters
            return {
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
            }
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
            diagnostics = {
                virtual_text = {
                    prefix = "  ",
                },
            },
            setup = {
                eslint = function()
                    require("lazyvim.util").lsp.on_attach(function(client)
                        if client.name == "eslint" then
                            client.server_capabilities.documentFormattingProvider = true
                        elseif client.name == "tsserver" then
                            client.server_capabilities.documentFormattingProvider = false
                        end
                    end)
                end,
            },
        },
    },
    {
        "simrat39/rust-tools.nvim",
    },
}
