return {
    'ThePrimeagen/harpoon',
    config = function()
        local keymap = require "romamihalich.keymaps".keymap;

        keymap("n", "<leader>ha", "<cmd> lua require'harpoon.mark'.add_file()<CR>", "Add file")
        keymap("n", "<leader>ht", "<cmd> lua require'harpoon.ui'.toggle_quick_menu()<CR>", "Toggle menu")
        keymap("n", "<leader>hh", "<cmd> lua require'harpoon.ui'.nav_file(1)<CR>", "Nav file 1")
        keymap("n", "<leader>hj", "<cmd> lua require'harpoon.ui'.nav_file(2)<CR>", "Nav file 2")
        keymap("n", "<leader>hk", "<cmd> lua require'harpoon.ui'.nav_file(3)<CR>", "Nav file 3")
    end
}

