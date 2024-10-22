return {
  {
    "folke/noice.nvim",
    opts = {
      routes = {
        {
          filter = {
            event = "lsp",
            kind = "progress",
            find = "jdtls",
          },
          opts = { skip = true },
        },
      },
      messages = {
        enabled = false,
      },
      notify = {
        enabled = false,
      },
      presets = {
        lsp_doc_border = true,
      },
    },
  },
}
