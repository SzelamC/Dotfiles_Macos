local opt = vim.opt
local g = vim.g

-- line number
opt.relativenumber = true
opt.number = true

--tabs & indentation
opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.autoindent = true
opt.smartindent = true
opt.softtabstop = 2

-- line wrapping
opt.wrap = false

-- search settings
opt.ignorecase = true
opt.smartcase = true
opt.fillchars = { eob = " " }

-- apperance
opt.termguicolors = true
opt.background = "dark"
opt.signcolumn = "yes"
opt.guicursor = ""
opt.cursorline = true

--backspace
opt.backspace = "indent,eol,start"

--clipboard
opt.clipboard:append("unnamedplus")
opt.clipboard = "unnamedplus"

--split windows
opt.splitright = true
opt.splitbelow = true

opt.iskeyword:append("-")

opt.cmdheight = 1
opt.colorcolumn = "80"
opt.completeopt = { "menuone", "noselect" }
opt.conceallevel = 0
vim.opt.fileencoding = "utf-8"
opt.foldmethod = "manual"
opt.foldexpr = ""
opt.hlsearch = false
opt.incsearch = true
opt.mouse = "a"
opt.pumheight = 10
opt.showmode = false
opt.showtabline = 2
opt.swapfile = false
opt.backup = false
opt.scrolloff = 8
opt.sidescrolloff = 8
opt.timeoutlen = 200
opt.undofile = true
opt.whichwrap:append("<>[]hl")
vim.diagnostic.config({
  virtual_text = {
    prefix = "  ",
  },
  float = true,
})

-- highlight
vim.cmd([[
autocmd!
au TextYankPost * silent! lua vim.highlight.on_yank({higroup="Visual", timeout=40})
augroup END
]])

vim.g.copilot_no_tab_map = true

local default_plugins = {
  "2html_plugin",
  "getscript",
  "getscriptPlugin",
  "gzip",
  "logipat",
  "netrw",
  "netrwPlugin",
  "netrwSettings",
  "netrwFileHandlers",
  "matchit",
  "tar",
  "tarPlugin",
  "rrhelper",
  "spellfile_plugin",
  "vimball",
  "vimballPlugin",
  "zip",
  "zipPlugin",
  "tutor",
  "rplugin",
  "syntax",
  "synmenu",
  "optwin",
  "compiler",
  "bugreport",
  "ftplugin",
}

for _, plugin in pairs(default_plugins) do
  g["loaded_" .. plugin] = 1
end

