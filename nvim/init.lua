require("szelc.core.options")
require("szelc.plugins-setup")
require("szelc.core.keymaps")
require("szelc.plugins.termicons")
vim.cmd([[
autocmd! FileType * set formatoptions-=cro
]])
