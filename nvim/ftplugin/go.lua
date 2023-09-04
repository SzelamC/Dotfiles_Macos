local keymap = vim.keymap

keymap.set("n", "<leader>r", ":sp<CR> :term go run %<CR>")
