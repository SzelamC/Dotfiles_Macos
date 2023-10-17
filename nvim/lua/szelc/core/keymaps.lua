local g = vim.g
local keymap = vim.keymap

-- leader key
g.mapleader = " "
local opts = { silent = true }

-- common keymap
keymap.set("i", "jk", "<ESC>", opts)
keymap.set("n", "<leader>h", ":nohl<CR>", opts)
keymap.set("n", "x", '"_x', opts)
keymap.set("v", "d", '"_d', opts)
keymap.set("n", "<C-s>", ":w<CR>", opts)
keymap.set("n", "<C-h>", "<C-w>h", opts)
keymap.set("n", "<C-j>", "<C-w>j", opts)
keymap.set("n", "<C-k>", "<C-w>k", opts)
keymap.set("n", "<C-l>", "<C-w>l", opts)
keymap.set("v", "K", ":m '<-2<CR>gv=gv", opts)
keymap.set("v", "J", ":m '>+1<CR>gv=gv", opts)
keymap.set("v", "<", "<gv", opts)
keymap.set("v", ">", ">gv", opts)
keymap.set("n", "<C-d>", "<C-d>zz", opts)
keymap.set("n", "<C-u>", "<C-u>zz", opts)
keymap.set("n", "n", "nzzzv", opts)
keymap.set("n", "N", "Nzzzv", opts)
keymap.set("n", "<C-u>", "<C-u>zz", opts)
keymap.set("n", "<leader>y", '"+y', opts)
keymap.set("v", "<leader>y", '"+y', opts)
keymap.set("n", "<leader>vs", ":vsplit<CR>", opts)
keymap.set("n", "<leader>s", ":split<CR>", opts)
keymap.set("n", "qq", "q", opts)
