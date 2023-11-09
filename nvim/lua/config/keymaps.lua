-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
-- local opts = function(desc)
--     return { silent = true, desc = desc }
-- end
local opts = { silent = true }
vim.keymap.set("i", "jk", "<ESC>", opts)
vim.keymap.set("n", "<leader>h", ":nohl<CR>", opts)
vim.keymap.set("n", "x", '"_x', opts)
vim.keymap.set("v", "d", '"_d', opts)
vim.keymap.set("n", "<C-s>", ":w<CR>", opts)
vim.keymap.set("n", "<C-h>", "<C-w>h", opts)
vim.keymap.set("n", "<C-j>", "<C-w>j", opts)
vim.keymap.set("n", "<C-k>", "<C-w>k", opts)
vim.keymap.set("n", "<C-l>", "<C-w>l", opts)
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", opts)
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", opts)
vim.keymap.set("v", "<", "<gv", opts)
vim.keymap.set("v", ">", ">gv", opts)
vim.keymap.set("n", "<C-d>", "<C-d>zz", opts)
vim.keymap.set("n", "<C-u>", "<C-u>zz", opts)
vim.keymap.set("n", "n", "nzzzv", opts)
vim.keymap.set("n", "N", "Nzzzv", opts)
vim.keymap.set("n", "<C-u>", "<C-u>zz", opts)
vim.keymap.set("n", "<leader>y", '"+y', opts)
vim.keymap.set("v", "<leader>y", '"+y', opts)
vim.keymap.set("n", "q", "<nop>", opts)
vim.keymap.set("n", "qq", "q", opts)

vim.keymap.del("n", "<leader>l")
vim.keymap.del("n", "<leader>gg")
vim.keymap.del("n", "<leader>gG")
vim.keymap.del("n", "<leader>w-")
vim.keymap.del("n", "<leader>w|")
