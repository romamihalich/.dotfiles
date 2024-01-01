local keymap = require "romamihalich.keymaps".keymap
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
            keymap("n", "<leader>gg", vim.cmd.DiffviewOpen, "Diffview")
        end
    },
    {
        'lewis6991/gitsigns.nvim',
        config = function()
            require('gitsigns').setup()
            keymap("n", "<leader>gs", function() vim.cmd.Gitsigns("stage_hunk") end, "Stage hunk")
            keymap("n", "<leader>gl", function() vim.cmd.Gitsigns("blame_line") end, "Blame line")
            keymap("n", "]h", function() vim.cmd.Gitsigns("next_hunk") end, "Next hunk")
            keymap("n", "[h", function() vim.cmd.Gitsigns("prev_hunk") end, "Prev hunk")
        end
    }
}
