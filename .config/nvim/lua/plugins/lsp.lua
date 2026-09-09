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
            { "gl", vim.diagnostic.open_float, desc = "Hover Document" },

            -- keys[#keys + 1] = { "gl", vim.diagnostic.open_float, desc = "Hover Document" }
          },
        },
      },
    },
  },
  {
    "ray-x/go.nvim",
    dependencies = { -- optional packages
      "ray-x/guihua.lua",
      "neovim/nvim-lspconfig",
      -- { "nvim-treesitter/nvim-treesitter", branch = 'main' } -- optional for master version
    },
    opts = function()
      require("go").setup(opts)
      local format_sync_grp = vim.api.nvim_create_augroup("GoFormat", {})
      vim.api.nvim_create_autocmd("BufWritePre", {
        pattern = "*.go",
        callback = function()
          require("go.format").goimports()
        end,
        group = format_sync_grp,
      })
      return {
        -- lsp_keymaps = false,
        -- other options
      }
    end,
    event = { "CmdlineEnter" },
    ft = { "go", "gomod" },
    build = ':lua require("go.install").update_all_sync()', -- if you need to install/update all binaries
  },
}
