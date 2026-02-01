return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      diagnostics = {
        virtual_text = {
          prefix = "  ",
        },
      },
      servers = {
        ["*"] = {
          keys = {
            { "<leader>ca", false },
            { "<leader>cA", false },
            { "<leader>la", vim.lsp.buf.code_action, desc = "Code Action" },
          },
        },
      },
    },
  },
}
