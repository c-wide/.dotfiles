require("mason").setup()
require("mason-lspconfig").setup({
	ensure_installed = { "sumneko_lua", "tsserver", "gopls", "rust_analyzer", "jedi_language_server" },
})
