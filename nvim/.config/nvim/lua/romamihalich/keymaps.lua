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

-- dap
keymap("n", "<F5>", function () require'dap'.continue() end)
keymap("n", "<F9>", function () require'dap'.toggle_breakpoint() end)
keymap("n", "<F10>", function () require'dap'.step_over() end)
keymap("n", "<F11>", function () require'dap'.step_into() end)
keymap("n", "<F12>", function () require'dap'.step_out() end)
-- nnoremap <silent> <leader>B :lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>
-- nnoremap <silent> <leader>lp :lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<CR>

local last_command = " "
local run_shell_command = function()
    vim.ui.input({ prompt = "command:", default = last_command }, function(inp)
        if inp then
            last_command = inp
            vim.cmd('sp +term\\ ' .. last_command:gsub(" ", "\\ "))
        end
    end)
end

local dap_close = function()
    require'dap'.close()
    require'dapui'.close()
end


vim.keymap.set("v", "<leader>=", ":Tabularize /", {
    noremap = true,
    silent = false,
    desc = "Tabularize"
})

keymap("v", "<leader>ca", vim.lsp.buf.range_code_action, "Code actions")

keymap("n", "<leader>e", vim.cmd.NvimTreeToggle, "Explorer toggle")
keymap("n", "<leader>q", "<cmd>bd!<CR>", "Close current buffer")
keymap("n", "<leader>r", run_shell_command, "Run a shell command")
keymap("n", "<leader>H", "<cmd>cd %:p:h | pwd<CR>", "Cd here")

keymap("n", "<leader>ff", "<cmd>Telescope find_files<CR>", "Files")
keymap("n", "<leader>fr", "<cmd>Telescope oldfiles<CR>", "Recent files")
keymap("n", "<leader>fg", "<cmd>Telescope git_files<CR>", "Git files")
keymap("n", "<leader>fl", "<cmd>Telescope live_grep<CR>", "Live grep")
keymap("n", "<leader>fd", "<cmd>Telescope diagnostics<CR>", "Diagnostics")
keymap("n", "<leader>fs", "<cmd>Telescope lsp_workspace_symbols<CR>", "Symbols")
keymap("n", "<leader>fo", "<cmd>Telescope file_browser cwd_to_path=true grouped=true<CR>", "File browser")

keymap("n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", "Actions")
keymap("n", "<leader>cf", "<cmd>lua vim.lsp.buf.formatting()<CR>", "Formatting")
keymap("n", "<leader>cr", "<cmd>lua vim.lsp.buf.rename()<CR>", "Rename")
keymap("n", "<leader>cl", "<cmd>lua vim.diagnostic.open_float()<CR>", "Line diagnostics")
keymap("n", "<leader>cj", "<cmd>lua vim.diagnostic.goto_next()<CR>", "Next diagnostic")
keymap("n", "<leader>ck", "<cmd>lua vim.diagnostic.goto_prev()<CR>", "Prev diagnostic")

keymap("n", "<leader>ot", "<cmd>!$TERMINAL --working-directory \"$PWD\"&<CR><CR>", "Terminal")
keymap("n", "<leader>oc", "<cmd>term cht.sh<CR>", "Cheet sheet")

keymap("n", "<leader>ha", "<cmd> lua require'harpoon.mark'.add_file()<CR>", "Add file")
keymap("n", "<leader>ht", "<cmd> lua require'harpoon.ui'.toggle_quick_menu()<CR>", "Toggle menu")
keymap("n", "<leader>hh", "<cmd> lua require'harpoon.ui'.nav_file(1)<CR>", "Nav file 1")
keymap("n", "<leader>hj", "<cmd> lua require'harpoon.ui'.nav_file(2)<CR>", "Nav file 2")
keymap("n", "<leader>hk", "<cmd> lua require'harpoon.ui'.nav_file(3)<CR>", "Nav file 3")

keymap("n", "<leader>dp", "<cmd> lua require'dap'.pause()<CR>", "Pause")
keymap("n", "<leader>dq", dap_close, "Close")
keymap("n", "<leader>dh", "<cmd> lua require'dap.ui.widgets'.hover()<CR>", "Hover")
keymap("n", "<leader>de", "<cmd> lua require'dapui'.toggle()<CR>", "Toggle sidebar")

keymap("n", "gd", "<cmd>Telescope lsp_definitions<CR>", "Go to definition")
keymap("n", "gr", "<cmd>Telescope lsp_references<CR>", "Go to references")
keymap("n", "gs", "<cmd>lua vim.lsp.buf.signature_help()<CR>", "Signature help")

return M
