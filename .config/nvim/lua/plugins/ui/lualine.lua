return {
  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    opts = {
      options = {
        -- component_separators = { left = "", right = "" },
        -- section_separators = { left = "", right = "" },
      },
      sections = {
        lualine_a = {
          { "mode", icon = "󰊠" },
        },
        lualine_x = {
          {
            function()
              local msg = "No LSP"
              local clients = vim.lsp.get_clients({ bufnr = 0 })
              if next(clients) == nil then
                return msg
              end
              local client_names = {}
              for _, client in pairs(clients) do
                table.insert(client_names, client.name)
              end
              return "[" .. table.concat(client_names, ", ") .. "]"
            end,
            icon = " ",
          },
        },
      },
    },
  },
}
