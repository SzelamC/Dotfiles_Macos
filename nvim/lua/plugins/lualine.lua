return {
  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    opts = function()
      return {
        options = {
          theme = "kanagawa",
          component_separators = { left = "", right = "" },
          section_separators = { left = "", right = "" },
        },

        sections = {
          lualine_a = {
            {
              "mode",
            },
          },
        },
      }
    end,
  },
}
