local status_ok, which_key = pcall(require, "which-key")
if not status_ok then
  return
end

local last_command = " "
function run_shell_command()
    vim.ui.input({ prompt = "command:", default = last_command }, function(inp)
        if inp then
            last_command = inp
            vim.cmd('sp +term\\ ' .. last_command:gsub(" ", "\\ "))
        end
    end)
end

function dap_close()
    require'dap'.close()
    require'dapui'.close()
end

which_key.setup {
  plugins = {
    marks = true, -- shows a list of your marks on ' and `
    registers = true, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
    spelling = {
      enabled = false, -- enabling this will show WhichKey when pressing z= to select spelling suggestions
      suggestions = 20, -- how many suggestions should be shown in the list?
    },
    -- the presets plugin, adds help for a bunch of default keybindings in Neovim
    -- No actual key bindings are created
    presets = {
      operators = false, -- adds help for operators like d, y, ... and registers them for motion / text object completion
      motions = true, -- adds help for motions
      text_objects = true, -- help for text objects triggered after entering an operator
      windows = true, -- default bindings on <c-w>
      nav = true, -- misc bindings to work with windows
      z = true, -- bindings for folds, spelling and others prefixed with z
      g = true, -- bindings for prefixed with g
    },
  },
  -- add operators that will trigger motion and text object completion
  -- to enable all native operators, set the preset / operators plugin above
  operators = { gc = "Comments" },
  key_labels = {
    -- override the label used to display some keys. It doesn't effect WK in any other way.
    -- For example:
    -- ["<space>"] = "SPC",
    -- ["<cr>"] = "RET",
    -- ["<tab>"] = "TAB",
  },
  icons = {
    breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
    separator = "➜", -- symbol used between a key and it's label
    group = "+", -- symbol prepended to a group
  },
  window = {
    border = "single", -- none, single, double, shadow
    position = "bottom", -- bottom, top
    margin = { 1, 2, 1, 2 }, -- extra window margin [top, right, bottom, left]
    padding = { 2, 2, 2, 2 }, -- extra window padding [top, right, bottom, left]
  },
  layout = {
    height = { min = 4, max = 25 }, -- min and max height of the columns
    width = { min = 20, max = 50 }, -- min and max width of the columns
    spacing = 3, -- spacing between columns
    align = "left", -- align columns left, center or right
  },
  ignore_missing = true, -- enable this to hide mappings for which you didn't specify a label
  hidden = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "call", "lua", "^:", "^ "}, -- hide mapping boilerplate
  show_help = true, -- show help message on the command line when the popup is visible
  --triggers = "auto", -- automatically setup triggers
  triggers = {"<leader>", "g", "\'", "\"", "<c-w>"},-- or specify a list manually
  triggers_blacklist = {
    -- list of mode / prefixes that should never be hooked by WhichKey
    -- this is mostly relevant for key maps that start with a native binding
    -- most people should not need to change this
    i = { "j", "k" },
    v = { "j", "k" },
  },
}

-- visual mode
which_key.register({
    ["<leader>"] = {
      c = {
        name = "+code",
        a = { ":Telescope lsp_range_code_actions theme=cursor<CR>", "Code actions"}
      }
    }
}, { mode = "v" })

--normal mode
which_key.register({
  ["<leader>"] = {
    e = { "<cmd>NvimTreeToggle<CR>", "Explorer toggle" },
    q = { "<cmd>bd!<CR>", "Close current buffer" },
    r = { "<cmd>lua run_shell_command()<CR>", "Run a shell command" },
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
      a = { "<cmd>Telescope lsp_code_actions theme=cursor<CR>", "Actions" },
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
      q = { "<cmd> lua dap_close()<CR>", "Close" },
      h = { "<cmd> lua require'dap.ui.widgets'.hover()<CR>", "Hover" },
      e = { "<cmd> lua require'dapui'.toggle()<CR>", "Toggle sidebar" },
    },
  },
  g = {
    d = { "<cmd>Telescope lsp_definitions<CR>", "Go to definition" },
    r = { "<cmd>Telescope lsp_references<CR>", "Go to references" },
    s = { "<cmd>lua vim.lsp.buf.signature_help()<CR>", "Signature help" }
  }
})

