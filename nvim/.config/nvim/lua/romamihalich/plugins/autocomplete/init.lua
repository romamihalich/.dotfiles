return {
    'hrsh7th/nvim-cmp', config = function() require'romamihalich.plugins.autocomplete.cmp' end,
    dependencies = {
        'hrsh7th/cmp-nvim-lsp',
        'hrsh7th/cmp-buffer',
        'hrsh7th/cmp-path',
        'hrsh7th/cmp-cmdline',
        'onsails/lspkind-nvim',
        -- Snippets
        { 'L3MON4D3/LuaSnip', config = function () require'romamihalich.plugins.autocomplete.luasnip' end },
        'saadparwaiz1/cmp_luasnip',
        'rafamadriz/friendly-snippets',
    }
}
