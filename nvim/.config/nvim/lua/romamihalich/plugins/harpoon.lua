return {
    'ThePrimeagen/harpoon',
    config = function()
        Keymap("n", "<leader>ha", "<cmd> lua require'harpoon.mark'.add_file()<CR>", "Add file")
        Keymap("n", "<leader>ht", "<cmd> lua require'harpoon.ui'.toggle_quick_menu()<CR>", "Toggle menu")
        Keymap("n", "<leader>hh", "<cmd> lua require'harpoon.ui'.nav_file(1)<CR>", "Nav file 1")
        Keymap("n", "<leader>hj", "<cmd> lua require'harpoon.ui'.nav_file(2)<CR>", "Nav file 2")
        Keymap("n", "<leader>hk", "<cmd> lua require'harpoon.ui'.nav_file(3)<CR>", "Nav file 3")
    end
}

