return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      auto_install = false,
      ensure_installed = {
        "javascript",
        "typescript",
        "tsx",
        "yaml",
        "html",
        "css",
        "markdown",
        "svelte",
        "graphql",
        "bash",
        "lua",
        "vim",
        "dockerfile",
        "gitignore",
      },
      highlight = {
        additional_vim_regex_highlighting = false,
      },
      autotag = { enable = true },
    },
  },
}
