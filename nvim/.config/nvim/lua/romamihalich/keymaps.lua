local M = {}

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

keymap("n", "s", ":%s/", opts)
keymap("v", "s", ":s/", opts)

keymap("v", "t", ":Tabularize /", opts)

keymap("n", "Y", "y$", opts)
keymap("n", "<C-h>", "<c-w>h", opts)
keymap("n", "<C-l>", "<c-w>l", opts)
keymap("n", "<C-j>", "<c-w>j", opts)
keymap("n", "<C-k>", "<c-w>k", opts)
keymap("v", ">", ">gv", opts)
keymap("v", "<", "<gv", opts)
keymap("v", "p", "\"_dP", opts)

keymap("t", "<Esc>", "<C-\\><C-n>", opts)
keymap("t", "<C-h>", "<C-\\><C-n><c-w>h", opts)
-- keymap("t", "<C-l>", "<C-\\><C-n><c-w>l", opts)
keymap("t", "<C-j>", "<C-\\><C-n><c-w>j", opts)
keymap("t", "<C-k>", "<C-\\><C-n><c-w>k", opts)

-- dap
keymap("n", "<F5>", ":lua require'dap'.continue()<CR>", opts)
keymap("n", "<F9>", ":lua require'dap'.toggle_breakpoint()<CR>", opts)
keymap("n", "<F10>", ":lua require'dap'.step_over()<CR>", opts)
keymap("n", "<F11>", ":lua require'dap'.step_into()<CR>", opts)
keymap("n", "<F12>", ":lua require'dap'.step_out()<CR>", opts)
-- nnoremap <silent> <leader>B :lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>
-- nnoremap <silent> <leader>lp :lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<CR>

local last_command = " "
M.run_shell_command = function()
    vim.ui.input({ prompt = "command:", default = last_command }, function(inp)
        if inp then
            last_command = inp
            vim.cmd('sp +term\\ ' .. last_command:gsub(" ", "\\ "))
        end
    end)
end

M.dap_close = function()
    require'dap'.close()
    require'dapui'.close()
end

M.which_key_visual = {
    ["<leader>"] = {
      c = {
        name = "+code",
        a = { "<cmd>lua vim.lsp.buf.range_code_action()<CR>", "Code actions"}
      }
    }
}

M.which_key_normal = {
  ["<leader>"] = {
    e = { "<cmd>NvimTreeToggle<CR>", "Explorer toggle" },
    q = { "<cmd>bd!<CR>", "Close current buffer" },
    r = { "<cmd>lua require'romamihalich.keymaps'.run_shell_command()<CR>", "Run a shell command" },
    H = { "<cmd>cd %:p:h | pwd<CR>", "Cd here" },
    f = {
      name = "+find",
      f = { "<cmd>Telescope find_files<CR>", "Files" },
      r = { "<cmd>Telescope oldfiles<CR>", "Recent files" },
      g = { "<cmd>Telescope git_files<CR>", "Git files" },
      l = { "<cmd>Telescope live_grep<CR>", "Live grep" },
      d = { "<cmd>Telescope diagnostics<CR>", "Diagnostics" },
      s = { "<cmd>Telescope lsp_workspace_symbols<CR>", "Symbols" },
      -- cwd_to_path=true
      -- grouped=true
      -- default_selection_index=2
      -- files=bool
      o = { "<cmd>Telescope file_browser cwd_to_path=true grouped=true<CR>", "File browser" }
    },
    c = {
      name = "+code",
      a = { "<cmd>lua vim.lsp.buf.code_action()<CR>", "Actions" },
      f = { "<cmd>lua vim.lsp.buf.formatting()<CR>", "Formatting" },
      r = { "<cmd>lua vim.lsp.buf.rename()<CR>", "Rename" },
      l = { "<cmd>lua vim.diagnostic.open_float()<CR>", "Line diagnostics" },
      j = { "<cmd>lua vim.diagnostic.goto_next()<CR>", "Next diagnostic" },
      k = { "<cmd>lua vim.diagnostic.goto_prev()<CR>", "Prev diagnostic" },
    },
    g = {
      name = "+GTD",
      n = {"<cmd>GtdNew<CR>", "New" },
      r = {"<cmd>GtdReview<CR>", "Review" }
    },
    o = {
      name = "+open",
      t = { "<cmd>!$TERMINAL --working-directory \"$PWD\"&<CR><CR>", "Terminal" },
      c = { "<cmd>term cht.sh<CR>", "Cheet sheet" }
    },
    h = {
      name = "+harpoon",
      a = { "<cmd> lua require'harpoon.mark'.add_file()<CR>", "Add file" },
      t = { "<cmd> lua require'harpoon.ui'.toggle_quick_menu()<CR>", "Toggle menu" },
      h = { "<cmd> lua require'harpoon.ui'.nav_file(1)<CR>", "Nav file 1" },
      j = { "<cmd> lua require'harpoon.ui'.nav_file(2)<CR>", "Nav file 2" },
      k = { "<cmd> lua require'harpoon.ui'.nav_file(3)<CR>", "Nav file 3" },
    },
    d = {
      name = "+debug",
      p = { "<cmd> lua require'dap'.pause()<CR>", "Pause" },
      q = { "<cmd> lua require'romamihalich.keymaps'.dap_close()<CR>", "Close" },
      h = { "<cmd> lua require'dap.ui.widgets'.hover()<CR>", "Hover" },
      e = { "<cmd> lua require'dapui'.toggle()<CR>", "Toggle sidebar" },
    },
  },
  g = {
    d = { "<cmd>Telescope lsp_definitions<CR>", "Go to definition" },
    r = { "<cmd>Telescope lsp_references<CR>", "Go to references" },
    s = { "<cmd>lua vim.lsp.buf.signature_help()<CR>", "Signature help" }
  }
}

return M
