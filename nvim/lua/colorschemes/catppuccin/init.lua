vim.g.catppuccin_flavour = "mocha"

require("catppuccin").setup({
    transparent_background = false,
    integrations = {
        telescope = true,
        treesitter = true,
        treesitter_context = true,
        gitsigns = true,
        native_lsp = {
            enabled = true
        }
    }
})

vim.cmd [[colorscheme catppuccin]]
