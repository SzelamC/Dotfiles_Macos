-- harpoon
local mark = require("harpoon.mark")
local ui = require("harpoon.ui")
vim.keymap.set("n", "<leader>a", mark.add_file)
vim.keymap.set("n", "<C-]>", ui.toggle_quick_menu)
-- vim.keymap.set("n", "<leader>g", function()
-- 	ui.nav_file(tonumber(vim.fn.input("Enter buffer number: ")))
-- end)
-- vim.keymap.set("n", "<C-t>", function()
-- 	ui.nav_file(2)
-- end)
-- vim.keymap.set("n", "<C-n>", function()
-- 	ui.nav_file(3)
-- end)
-- vim.keymap.set("n", "<C-s>", function()
-- 	ui.nav_file(4)
-- end)

require("harpoon").setup({
	menu = {
		width = math.max(60, math.floor(vim.api.nvim_win_get_width(0) * 0.5)),
	},
})
