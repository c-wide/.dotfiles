vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    -- Startup optimization
    use 'lewis6991/impatient.nvim'

    -- Misc packages
    use 'nvim-lua/plenary.nvim'
    use 'kyazdani42/nvim-web-devicons'

    -- Status line
    use 'feline-nvim/feline.nvim'

    -- LSP package manager
    use {
        'williamboman/mason.nvim',
        'williamboman/mason-lspconfig.nvim'
    }

    -- LSP config + cmp
    use 'neovim/nvim-lspconfig'
    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/cmp-cmdline'
    use 'hrsh7th/nvim-cmp'
    use 'L3MON4D3/LuaSnip'
    use 'saadparwaiz1/cmp_luasnip'
    use 'onsails/lspkind-nvim'

    -- Telescope and friends
    use { 'nvim-telescope/telescope.nvim', tag = '0.1.0' }
    use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }

    -- Treesitter and friends
    use {
        'nvim-treesitter/nvim-treesitter',
        run = function() require('nvim-treesitter.install').update({ with_sync = true }) end
    }

    use 'nvim-treesitter/nvim-treesitter-context'

    -- Additional auto completion
    use {
        'windwp/nvim-autopairs',
        config = function() require('nvim-autopairs').setup({}) end
    }

    use {
        'windwp/nvim-ts-autotag',
        config = function() require('nvim-ts-autotag').setup() end
    }

    -- Harpoon
    use 'ThePrimeagen/harpoon'

    -- Gitsigns
    use {
        'lewis6991/gitsigns.nvim',
        config = function()
            require('gitsigns').setup()
        end
    }

    -- Toggleterm
    use {'akinsho/toggleterm.nvim', tag = '*', config = function()
        require('toggleterm').setup()
    end}

    -- Comment toggle
    use {
        'numToStr/Comment.nvim',
        config = function()
            require('Comment').setup({
                mappings = false
            })
        end
    }

    -- null-ls formatting / linting
    use 'jose-elias-alvarez/null-ls.nvim'

    -- null-ls package manager
    use 'jayp0521/mason-null-ls.nvim'

    -- Color schemes
    use { 'catppuccin/nvim', as = 'catppuccin' }
end)
