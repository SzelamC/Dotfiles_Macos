return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      auto_install = true,
      ensure_installed = {
        "bash",
        "html",
        "javascript",
        "json",
        "lua",
        "markdown",
        "markdown_inline",
        "python",
        "query",
        "regex",
        "tsx",
        "typescript",
        "vim",
        "yaml",
        "xml",
        "http",
        "graphql",
      },
      highlight = {
        additional_vim_regex_highlighting = false,
      },
      autotag = { enable = true },
    },
  },
}
