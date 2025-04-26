--Remap space as leader key
Keymap("", "<Space>", "<Nop>")
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

Keymap("n", "K", function() vim.lsp.buf.hover({border='rounded'}) end)

Keymap("n", "Y", "y$")
Keymap("n", "<C-h>", "<c-w>h")
Keymap("n", "<C-l>", "<c-w>l")
Keymap("n", "<C-j>", "<c-w>j")
Keymap("n", "<C-k>", "<c-w>k")
Keymap("v", ">", ">gv")
Keymap("v", "<", "<gv")
Keymap("v", "p", "\"_dP")
-- keymap("v", "*", 'y/"<CR>')

Keymap("n", "<X1Mouse>", "<C-O>")
Keymap("n", "<X2Mouse>", "<C-I>")

Keymap("t", "<Esc>", "<C-\\><C-n>")
Keymap("t", "<C-h>", "<C-\\><C-n><c-w>h")
-- keymap("t", "<C-l>", "<C-\\><C-n><c-w>l")
Keymap("t", "<C-j>", "<C-\\><C-n><c-w>j")
Keymap("t", "<C-k>", "<C-\\><C-n><c-w>k")

Keymap("n", "<leader>r", (function()
    local last_command = " "
    return function()
        vim.ui.input({ prompt = "command:", default = last_command }, function(inp)
            if inp then
                last_command = inp
                vim.cmd('sp +term\\ ' .. last_command:gsub(" ", "\\ "))
            end
        end)
    end
end)(), "Run a shell command")

Keymap("n", "<leader>q", "<cmd>bd!<CR>", "Close current buffer")
Keymap("n", "<leader>H", "<cmd>cd %:p:h | pwd<CR>", "Cd here")

Keymap("n", "<leader>ot", "<cmd>!$TERMINAL --working-directory \"$PWD\"&<CR><CR>", "Terminal")
Keymap("n", "<leader>oc", "<cmd>term cht.sh<CR>", "Cheet sheet")

Keymap("n", "<C-n>", vim.cmd.cnext);
Keymap("n", "<C-p>", vim.cmd.cprev);

Keymap("n", "<leader>cl", function()
    local filePath = vim.fn.expand("%")
    local lineNbr = vim.fn.line(".")
    local location = filePath .. ":" .. lineNbr
    vim.fn.setreg("+", location)
end, "Copy location")
