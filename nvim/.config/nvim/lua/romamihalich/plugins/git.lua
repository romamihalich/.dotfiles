return {
    'tpope/vim-fugitive',
    {
        'sindrets/diffview.nvim',
        config = function()
            local actions = require("diffview.actions")
            require("diffview").setup({
                keymaps = {
                    file_panel = {
                        { "n", "s",             actions.toggle_stage_entry,   { desc = "Stage / unstage the selected entry." } },
                    },
                },
            })
        end
    },
    {
        'lewis6991/gitsigns.nvim',
        config = function()
            require('gitsigns').setup()
        end
    }
}
