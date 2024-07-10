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
      diagnostics = {
        virtual_text = {
          prefix = "  ",
        },
      },
    },
  },
  {
    "mfussenegger/nvim-jdtls",
    ft = { "java" },
    opts = function(_, opts)
      local lombok_path = "/Users/sam.slchan/.local/share/nvim/mason/packages/jdtls/lombok.jar"
      opts.full_cmd = function(opts)
        local fname = vim.api.nvim_buf_get_name(0)
        local root_dir = opts.root_dir(fname)
        local project_name = opts.project_name(root_dir)
        local cmd = vim.deepcopy(opts.cmd)
        vim.list_extend(cmd, {
          "--jvm-arg=" .. string.format("-javaagent:%s", lombok_path),
        })
        if project_name then
          vim.list_extend(cmd, {
            "-configuration",
            opts.jdtls_config_dir(project_name),
            "-data",
            opts.jdtls_workspace_dir(project_name),
          })
        end
        return cmd
      end
    end,
  },
}
