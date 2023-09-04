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
keymap.set("n", "<leader>c", ":lua require('mini.bufremove').delete(0, true)<CR>", opts)
keymap.set("n", "q", "<nop>", opts)
keymap.set("n", "Q", "q", opts)

keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>", opts)

-- Telescope
keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<CR>", opts)
keymap.set("n", "<leader>fs", "<cmd>Telescope live_grep<CR>", opts)
keymap.set("n", "<leader>fc", "<cmd>Telescope grep_string<CR>", opts)
keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<CR>", opts)
keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags<CR>", opts)

-- lsp related
keymap.set("n", "<leader>lf", vim.lsp.buf.format, opts)

-- barbar
keymap.set("n", "H", ":BufferLineCyclePrev<CR>", opts)
keymap.set("n", "L", ":BufferLineCycleNext<CR>", opts)

-- git related
keymap.set("n", "<leader>G", ":Neogit<CR>", opts)

-- harpoon
local mark = require("harpoon.mark")
local ui = require("harpoon.ui")
keymap.set("n", "<leader>a", mark.add_file)
keymap.set("n", "<C-]>", ui.toggle_quick_menu)
-- keymap.set("n", "<leader>g", function()
-- 	ui.nav_file(tonumber(vim.fn.input("Enter buffer number: ")))
-- end)
-- keymap.set("n", "<C-t>", function()
-- 	ui.nav_file(2)
-- end)
-- keymap.set("n", "<C-n>", function()
-- 	ui.nav_file(3)
-- end)
-- keymap.set("n", "<C-s>", function()
-- 	ui.nav_file(4)
-- end)
