local opts = { noremap = true, silent = true }

local term_opts = { silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- TODO: mv move
keymap("n", "K", ":lua vim.lsp.buf.hover()<CR>", opts)

keymap("n", "Y", "y$", opts)
keymap("n", "<C-h>", "<c-w>h", opts)
keymap("n", "<C-l>", "<c-w>l", opts)
keymap("n", "<C-j>", "<c-w>j", opts)
keymap("n", "<C-k>", "<c-w>k", opts)
keymap("v", ">", ">gv", opts)
keymap("v", "<", "<gv", opts)
keymap("n", "<leader>n", ":nohlsearch<CR>", opts)
keymap("v", "p", "\"_dP", opts)

keymap("t", "<Esc>", "<C-\\><C-n>", opts)

-- TODO: move or delete
keymap("n", "f", "<Plug>Sneak_f", opts)
keymap("n", "F", "<Plug>Sneak_F", opts)
keymap("n", "t", "<Plug>Sneak_t", opts)
keymap("n", "T", "<Plug>Sneak_T", opts)
