local M = {}

M.setup = function()
    local signs = {
        { name = "DiagnosticSignError", text = Signs.error },
        { name = "DiagnosticSignWarn", text = Signs.warn },
        { name = "DiagnosticSignHint", text = Signs.hint },
        { name = "DiagnosticSignInfo", text = Signs.info },
    }

    for _, sign in ipairs(signs) do
        vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
    end

    local config = {
        virtual_text = true,
        -- show signs
        signs = {
            active = signs,
        },
        update_in_insert = false,
        underline = true,
        severity_sort = true,
        float = {
          focusable = false,
          style = "minimal",
          border = "rounded",
          source = "if_many",
          header = "",
          prefix = "",
        },
    }

    vim.diagnostic.config(config)

    vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
        border = 'rounded',
    })

    vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
        border = 'rounded',
    })
end

M.on_attach = function(client, bufnr)
    Keymap("n",  "<leader>la",  vim.lsp.buf.code_action,        "Actions")
    -- keymap("n",  "<leader>lf",  vim.lsp.buf.formatting,         "Formatting")
    Keymap("n",  "<leader>lr",  vim.lsp.buf.rename,             "Rename")
    Keymap("n",  "<leader>ll",  vim.diagnostic.open_float,      "Line diagnostics")
    Keymap("n",  "<leader>lj",  vim.diagnostic.goto_next,       "Next diagnostic")
    Keymap("n",  "<leader>lk",  vim.diagnostic.goto_prev,       "Prev diagnostic")
    -- keymap("v",  "<leader>la",  vim.lsp.buf.range_code_action,  "Code actions")
    Keymap("n",  "gs",          vim.lsp.buf.signature_help,     "Signature help")
    Keymap("n", "gd", function() require("telescope.builtin").lsp_definitions() end, "Go to definition")
    Keymap("n", "gr", function() require("telescope.builtin").lsp_references() end, "Go to references")
end

local cmp_nvim_lsp = require("cmp_nvim_lsp")
local capabilities = vim.lsp.protocol.make_client_capabilities()
M.capabilities = cmp_nvim_lsp.default_capabilities(capabilities)

return M
