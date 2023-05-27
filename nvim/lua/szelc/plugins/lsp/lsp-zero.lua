local mason_status, mason = pcall(require, "mason")
if not mason_status then
	return
end

local mason_lspconfg_status, mason_lspconfig = pcall(require, "mason-lspconfig")
if not mason_lspconfg_status then
	return
end

local mason_null_ls_status, mason_null_ls = pcall(require, "mason-null-ls")
if not mason_null_ls_status then
	return
end

mason.setup()

mason_lspconfig.setup({
	ensure_instaled = {
		"tsserver",
		"sumneko_lua",
		"tailwindcss",
		"pyright",
	},
})

mason_null_ls.setup({
	ensure_instaled = {
		"prettier",
		"stylua",
		"eslind_d",
		"pyright",
	},
})

local lsp = require("lsp-zero").preset({})

lsp.on_attach(function(client, bufnr)
	lsp.default_keymaps({ buffer = bufnr })

	client.server_capabilities.semanticTokensProvider = nil
	if client.name == "tsserver" then
		client.server_capabilities.documentFormattingProvider = false
	end
end)

lsp.setup()

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
		-- completion = cmp.config.window.bordered({
		--   col_offset = -3,
		--   side_padding = 0,
		--   winhighlight = "Normal:Normal,FloatBorder:Pmenu,CursorLine:Visual,Search:None",
		-- }),
		-- documentation = cmp.config.window.bordered({
		--   winhighlight = "Normal:Normal,FloatBorder:FloatBorder,CursorLine:Visual,Search:None",
		-- }),
	},
	mapping = cmp.mapping.preset.insert({
		["<S-Tab>"] = cmp.mapping.select_prev_item(),
		["<Tab>"] = cmp.mapping.select_next_item(),
		["<C-d>"] = cmp.mapping.scroll_docs(-4),
		["<C-f>"] = cmp.mapping.scroll_docs(4),
		["<CR>"] = cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = true }),
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
		-- diagnostics.eslint_d.with({
		--   -- js/ts linter
		--   -- only enable eslint if root has .eslintrc.js (not in youtube nvim video)
		--   condition = function(utils)
		--     return utils.root_has_file(".eslintrc.js") -- change file extension if you use something else
		--   end,
		-- }),
		-- diagnostics.flake8
	},
})
