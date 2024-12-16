return {
  {
    "onsails/lspkind.nvim",
    event = "VeryLazy",
    config = function()
      local icons = require("lazyvim.config").icons.kinds
      require("lspkind").presets["default"] = icons
    end,
  },
}
