return {
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
      keys[#keys + 1] = { "<leader>la", vim.lsp.buf.code_action, desc = "Code Action" }
      keys[#keys + 1] = { "gl", vim.diagnostic.open_float, desc = "Hover Document" }
    end,
    opts = {
      inlay_hints = { enabled = false },
      diagnostics = {
        virtual_text = {
          prefix = "  ",
        },
      },
    },
  },
}
