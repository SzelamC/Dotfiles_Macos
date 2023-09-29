local mason_status, mason = pcall(require, "mason")
if not mason_status then
	return
end

local mason_null_ls_status, mason_null_ls = pcall(require, "mason-null-ls")
if not mason_null_ls_status then
	return
end

local mason_lspconfig_status, mason_lspconfig = pcall(require, "mason-lspconfig")
if not mason_lspconfig_status then
	return
end

local lsp_zero = require("lsp-zero")

lsp_zero.on_attach(function(client, bufnr)
	lsp_zero.default_keymaps({ buffer = bufnr, omit = { "<F4>" } })
	vim.keymap.set("n", "<leader>la", "<cmd>lua vim.lsp.buf.code_action()<cr>", { buffer = true })
end)

lsp_zero.set_server_config({
	on_init = function(client)
		if client.name == "tsserver" then
			client.server_capabilities.documentFormattingRangeProvider = false
			client.server_capabilities.documentFormattingProvider = false
		end
	end,
})

mason.setup()
mason_null_ls.setup()
mason_lspconfig.setup({
	ensure_installed = {},
	handlers = {
		lsp_zero.default_setup,
		rust_analyzer = lsp_zero.noop,
	},
})

local rust_tools = require("rust-tools")

rust_tools.setup({
	inlay_hints = {
		auto = false,
	},
})

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

local cmp_style = "default"

local function border(hl_name)
	return {
		{ "╭", hl_name },
		{ "─", hl_name },
		{ "╮", hl_name },
		{ "│", hl_name },
		{ "╯", hl_name },
		{ "─", hl_name },
		{ "╰", hl_name },
		{ "│", hl_name },
	}
end

cmp.setup({
	snippet = {
		expand = function(args)
			luasnip.lsp_expand(args.body)
		end,
	},
	completion = {
		completeopt = "menu,menuone",
	},
	window = {
		completion = {
			side_padding = (cmp_style ~= "atom" and cmp_style ~= "atom_colored") and 1 or 0,
			winhighlight = "Normal:CmpPmenu,CursorLine:Visual,Search:PmenuSel",
			scrollbar = true,
			border = border("CmpBorder"),
		},
		documentation = {
			border = border("CmpDocBorder"),
			winhighlight = "Normal:CmpDoc",
		},
	},
	mapping = cmp.mapping.preset.insert({
		["<S-Tab>"] = cmp.mapping.select_prev_item(),
		["<Tab>"] = cmp.mapping.select_next_item(),
		["<C-d>"] = cmp.mapping.scroll_docs(-4),
		["<C-f>"] = cmp.mapping.scroll_docs(4),
		["<CR>"] = cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Insert, select = true }),
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

local setup, null_ls = pcall(require, "null-ls")
if not setup then
	return
end

-- for conciseness
local formatting = null_ls.builtins.formatting -- to setup formatters
local diagnostics = null_ls.builtins.diagnostics -- to setup linters
-- to setup format on save
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

-- configure null_ls
null_ls.setup({
	-- setup formatters & linters
	sources = {
		--  to disable file types use
		--  "formatting.prettier.with({disabled_filetypes: {}})" (see null-ls docs)
		formatting.prettierd, -- js/ts formatter
		formatting.autopep8,
		formatting.rustfmt,
		formatting.stylua, -- lua formatter
		formatting.yamlfmt,
		diagnostics.yamllint,
	},
})
