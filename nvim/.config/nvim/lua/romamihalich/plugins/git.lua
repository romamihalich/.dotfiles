return {
    {
        'tpope/vim-fugitive',
        config = function()
            Keymap("n", "<leader>gq", function() vim.cmd.G("difftool") end, "Set quickfix list with hunks")
        end
    },
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
            Keymap("n", "<leader>gg", vim.cmd.DiffviewOpen, "Diffview")
            Keymap("v", "<leader>gh", vim.cmd.DiffviewFileHistory, "File history")
        end
    },
    {
        'lewis6991/gitsigns.nvim',
        config = function()
            require('gitsigns').setup({
                numhl = true,
            })
            Keymap("n", "<leader>gs", function() vim.cmd.Gitsigns("stage_hunk") end, "Stage hunk")
            Keymap("n", "<leader>gl", function() vim.cmd.Gitsigns("blame_line") end, "Blame line")
            Keymap("n", "<leader>gp", function() vim.cmd.Gitsigns("preview_hunk") end, "Preview hunk")
            Keymap("n", "<leader>gr", function() vim.cmd.Gitsigns("reset_hunk") end, "Reset hunk")

            Keymap("n", "]h", function() vim.cmd.Gitsigns("next_hunk") end, "Next hunk")
            Keymap("n", "[h", function() vim.cmd.Gitsigns("prev_hunk") end, "Prev hunk")
        end
    }
}
