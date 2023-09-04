local opt = vim.opt
local g = vim.g

-- line number
opt.relativenumber = true
opt.number = true

--tabs & indentation
opt.expandtab = true
opt.shiftwidth = 4
opt.autoindent = true
opt.smartindent = true
opt.tabstop = 4
opt.softtabstop = 4
opt.breakindent = true
-- opt.smarttab = true

-- line wrapping
opt.wrap = false

-- search settings
opt.ignorecase = true
opt.smartcase = true
opt.fillchars = { eob = " " }

-- apperance
opt.title = true
opt.termguicolors = true
opt.background = "dark"
opt.signcolumn = "yes"
opt.guicursor = ""
opt.cursorline = true
-- opt.list = true
-- opt.listchars = {
-- 	trail = "·",
-- 	space = "·",
-- 	tab = "··",
-- }

--backspace
opt.backspace = "indent,eol,start"

--clipboard
opt.clipboard:append("unnamedplus")
opt.clipboard:prepend({ "unnamed", "unnamedplus" })

--split windows
opt.splitright = true
opt.splitbelow = true

opt.iskeyword:append("-")

opt.cmdheight = 1
opt.colorcolumn = "200"
opt.completeopt = { "menuone", "noselect" }
opt.conceallevel = 0
opt.foldmethod = "manual"
opt.foldexpr = ""
opt.hlsearch = false
opt.incsearch = true
opt.mouse = "a"
opt.pumheight = 10
opt.showmode = false
opt.showtabline = 2
opt.isfname:append("@-@")
opt.swapfile = false
opt.backup = false
opt.scrolloff = 8
opt.sidescrolloff = 8
opt.undofile = true
opt.whichwrap:append("<>[]hl")
opt.updatetime = 50
opt.path:append({ "**" })
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
	"tohtml",
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
	"editorconfig",
}

for _, plugin in pairs(default_plugins) do
	g["loaded_" .. plugin] = 1
end
