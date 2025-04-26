return {
    {
        'neovim/nvim-lspconfig',
        config = function() require'romamihalich.plugins.lsp.handlers'.setup() end,
        dependencies = {
            'Hoffs/omnisharp-extended-lsp.nvim',
            {
                'williamboman/mason.nvim',
                config = function() require'romamihalich.plugins.lsp.mason' end,
                dependencies = { 'williamboman/mason-lspconfig.nvim' }
            },
        }
    },
}
