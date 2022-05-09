local M = {}

M.setup = function()
    local signs = {
        { name = "DiagnosticSignError", text = "" },
        { name = "DiagnosticSignWarn", text = "" },
        { name = "DiagnosticSignHint", text = "" },
        { name = "DiagnosticSignInfo", text = "" },
    }

    for _, sign in ipairs(signs) do
        vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
    end

    local config = {
        -- disable virtual text
        virtual_text = true,
        -- show signs
        signs = {
            active = signs,
        },
        update_in_insert = false,
        underline = false,
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

local on_attaches = {
    omnisharp = function(client, bufnr)
        vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gd', "<cmd>lua require('omnisharp_extended').telescope_lsp_definitions()<CR>", { noremap=true, silent=true })
    end,
    tsserver = function(client, bufnr)
        client.resolved_capabilities.document_formatting = false
    end
}

M.get_on_attach = function(server_name)
    return on_attaches[server_name] or function(client, bufnr) end
end

local capabilities = vim.lsp.protocol.make_client_capabilities()

local status_ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not status_ok then
    vim.api.nvim_err_writeln("Can't load 'cmp_nvim_lsp'")
    return
end

M.capabilities = cmp_nvim_lsp.update_capabilities(capabilities)

return M

