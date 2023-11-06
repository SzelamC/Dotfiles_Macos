-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here
local augroup = vim.api.nvim_create_augroup
local autocmds = vim.api.nvim_create_autocmd

vim.cmd([[
autocmd!
au TextYankPost * silent! lua vim.highlight.on_yank({higroup="Visual", timeout=40})
augroup END
]])

augroup("discontinue_comments", { clear = true })
autocmds({ "FileType" }, {
    pattern = { "*" },
    callback = function()
        vim.opt.formatoptions = vim.opt.formatoptions - "o"
    end,
    group = "discontinue_comments",
    desc = "Dont't continue comments with o/O",
})
