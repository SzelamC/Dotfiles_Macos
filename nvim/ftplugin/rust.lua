local keymap = vim.keymap

keymap.set("n", "<leader>r", ":RustRun<CR>")
keymap.set("n", "<leader>ls", ":RustStartStandaloneServerForBuffer<CR>")
