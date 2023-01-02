local M = {}

-- Shorten function name
local keymap = function(mode, lhs, rhs, desc)
    vim.keymap.set(mode, lhs, rhs, {
        noremap = true,
        silent  = true,
        desc    = desc,
    })
end

--Remap space as leader key
keymap("", "<Space>", "<Nop>")
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

keymap("n", "K", vim.lsp.buf.hover)

keymap("n", "Y", "y$")
keymap("n", "<C-h>", "<c-w>h")
keymap("n", "<C-l>", "<c-w>l")
keymap("n", "<C-j>", "<c-w>j")
keymap("n", "<C-k>", "<c-w>k")
keymap("v", ">", ">gv")
keymap("v", "<", "<gv")
keymap("v", "p", "\"_dP")
-- keymap("v", "*", 'y/"<CR>')

keymap("t", "<Esc>", "<C-\\><C-n>")
keymap("t", "<C-h>", "<C-\\><C-n><c-w>h")
-- keymap("t", "<C-l>", "<C-\\><C-n><c-w>l")
keymap("t", "<C-j>", "<C-\\><C-n><c-w>j")
keymap("t", "<C-k>", "<C-\\><C-n><c-w>k")

local last_command = " "
local run_shell_command = function()
    vim.ui.input({ prompt = "command:", default = last_command }, function(inp)
        if inp then
            last_command = inp
            vim.cmd('sp +term\\ ' .. last_command:gsub(" ", "\\ "))
        end
    end)
end

vim.keymap.set("v", "<leader>=", ":Tabularize /", {
    noremap = true,
    silent = false,
    desc = "Tabularize"
})

keymap("n", "<leader>q", "<cmd>bd!<CR>", "Close current buffer")
keymap("n", "<leader>r", run_shell_command, "Run a shell command")
keymap("n", "<leader>H", "<cmd>cd %:p:h | pwd<CR>", "Cd here")

keymap("n", "<leader>ot", "<cmd>!$TERMINAL --working-directory \"$PWD\"&<CR><CR>", "Terminal")
keymap("n", "<leader>oc", "<cmd>term cht.sh<CR>", "Cheet sheet")

keymap("n", "<leader>ha", "<cmd> lua require'harpoon.mark'.add_file()<CR>", "Add file")
keymap("n", "<leader>ht", "<cmd> lua require'harpoon.ui'.toggle_quick_menu()<CR>", "Toggle menu")
keymap("n", "<leader>hh", "<cmd> lua require'harpoon.ui'.nav_file(1)<CR>", "Nav file 1")
keymap("n", "<leader>hj", "<cmd> lua require'harpoon.ui'.nav_file(2)<CR>", "Nav file 2")
keymap("n", "<leader>hk", "<cmd> lua require'harpoon.ui'.nav_file(3)<CR>", "Nav file 3")

M.keymap = keymap
return M
