require("nvim-treesitter.configs").setup({
	ensure_installed = { "javascript", "typescript", "tsx", "go", "gomod", "rust", "python" },
	auto_install = true,
	highlight = {
		enable = true,
	},
})
