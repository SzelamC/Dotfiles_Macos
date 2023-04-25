local cmp_status, cmp = pcall(require, "cmp")
if not cmp_status then
	return
end

local luasnip_status, luasnip = pcall(require, "luasnip")
if not luasnip_status then
	return
end

local lspkind_status, lspkind = pcall(require, "lspkind")
if not lspkind_status then
	return
end

require("luasnip/loaders/from_vscode")

vim.opt.completeopt = "menu,menuone,noselect"

-- local kind_icons = {
-- 	Array = "",
-- 	Boolean = "",
-- 	Class = "",
-- 	Color = "",
-- 	Constant = "",
-- 	Constructor = "",
-- 	Enum = "",
-- 	EnumMember = "",
-- 	Event = "",
-- 	Field = "",
-- 	File = "",
-- 	Folder = "",
-- 	Function = "",
-- 	Interface = "",
-- 	Key = "",
-- 	Keyword = "",
-- 	Method = "",
-- 	Module = "",
-- 	Namespace = "",
-- 	Null = "ﳠ",
-- 	Number = "",
-- 	Object = "",
-- 	Operator = "",
-- 	Package = "",
-- 	Property = "",
-- 	Reference = "",
-- 	Snippet = "",
-- 	String = "",
-- 	Struct = "",
-- 	Text = "",
-- 	TypeParameter = "",
-- 	Unit = "",
-- 	Value = "",
-- 	Variable = "",
-- }

cmp.setup({
	snippet = {
		expand = function(args)
			luasnip.lsp_expand(args.body)
		end,
	},
	window = {
		completion = cmp.config.window.bordered({
			col_offset = -3,
			side_padding = 0,
			winhighlight = "Normal:Normal,FloatBorder:FloatBorder,CursorLine:Visual,Search:None",
		}),
		documentation = cmp.config.window.bordered({
			winhighlight = "Normal:Normal,FloatBorder:FloatBorder,CursorLine:Visual,Search:None",
		}),
	},
	mapping = cmp.mapping.preset.insert({
		["<S-Tab>"] = cmp.mapping.select_prev_item(),
		["<Tab>"] = cmp.mapping.select_next_item(),
		["<C-d>"] = cmp.mapping.scroll_docs(-4),
		["<C-f>"] = cmp.mapping.scroll_docs(4),
		["<CR>"] = cmp.mapping.confirm({ select = false }),
		["<C-space>"] = cmp.mapping.complete(),
	}),
	sources = cmp.config.sources({
		{ name = "nvim_lsp" },
		{ name = "luasnip" },
		{ name = "buffer" },
		{ name = "path" },
	}),
	formatting = {
		fields = { "kind", "abbr", "menu" },
		format = function(entry, vim_item)
			local kind = lspkind.cmp_format({
				mode = "symbol_text",
				maxwidth = 50,
			})(entry, vim_item)
			local strings = vim.split(kind.kind, "%s", { trimempty = true })
			kind.kind = " " .. (strings[1] or "") .. " "
			kind.menu = "    (" .. (strings[2] or "") .. ")"
			return kind
		end,
	},
})
