local status, treesitter = pcall(require, "nvim-treesitter.configs")
if not status then
  return
end

vim.api.nvim_set_hl(0, "@rainbow.red", { fg = "#FD8A8A" })
vim.api.nvim_set_hl(0, "@rainbow.pink", { fg = "#F6C6EA" })
vim.api.nvim_set_hl(0, "@rainbow.yellow", { fg = "#F9F9C5" })
vim.api.nvim_set_hl(0, "@rainbow.orange", { fg = "#FAAB7B" })

-- configure treesitter
treesitter.setup({
  -- enable syntax highlighting
  highlight = {
    enable = true,
  },
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = "gnn", -- set to `false` to disable one of the mappings
      node_incremental = "grn",
      scope_incremental = "grc",
      node_decremental = "grm",
    },
  },
  playground = {
    enable = true,
    disable = {},
    updatetime = 25,       -- Debounced time for highlighting nodes in the playground from source code
    persist_queries = false, -- Whether the query persists across vim sessions
    keybindings = {
      toggle_query_editor = "o",
      toggle_hl_groups = "i",
      toggle_injected_languages = "t",
      toggle_anonymous_nodes = "a",
      toggle_language_display = "I",
      focus_language = "f",
      unfocus_language = "F",
      update = "R",
      goto_node = "<cr>",
      show_help = "?",
    },
  },
  -- enable indentation
  indent = { enable = true },
  -- enable autotagging (w/ nvim-ts-autotag plugin)
  autotag = { enable = true },
  rainbow = {
    enable = true,
    disable = {},
    extended_mode = false,
    hlgroups = {
      "@rainbow.red",
      "@rainbow.pink",
      "@rainbow.yellow",
      "@rainbow.orange",
    },
  },
  -- ensure these language parsers are installed
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
  -- auto install above language parsers
  auto_install = true,
})
