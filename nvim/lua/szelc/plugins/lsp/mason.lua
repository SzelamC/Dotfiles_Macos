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
    "pyright"
  }
})

mason_null_ls.setup({
  ensure_instaled = {
    "prettier",
    "stylua",
    "eslind_d",
    "pyright"
  }
})
