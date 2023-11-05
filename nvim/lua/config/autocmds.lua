-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here
vim.cmd([[
autocmd!
au TextYankPost * silent! lua vim.highlight.on_yank({higroup="Visual", timeout=40})
augroup END
]])
