return {
    'mfussenegger/nvim-dap',
    config = function() require'romamihalich.plugins.dap.nvim-dap' end,
    dependencies = {
        {
            'rcarriga/nvim-dap-ui',
            config = function() require'romamihalich.plugins.dap.nvim-dap-ui' end,
            dependencies = { "nvim-neotest/nvim-nio" },
        }
    }
}
