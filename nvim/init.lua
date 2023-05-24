require("szelc.core.options")
require("szelc.plugins-setup")
require("szelc.core.keymaps")
vim.cmd([[
autocmd! FileType * set formatoptions-=cro
]])
require("szelc.plugins.termicons")
