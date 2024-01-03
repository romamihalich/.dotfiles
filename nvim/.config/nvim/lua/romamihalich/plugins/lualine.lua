return {
    'hoob3rt/lualine.nvim',
    dependencies = {
        {
            'SmiteshP/nvim-navic',
            dependencies = { "neovim/nvim-lspconfig" },
            config = function()
                require "nvim-navic".setup {
                    lsp = {
                        auto_attach = true,
                    },
                    highlight = true,
                    click = true,
                }
            end
        }
    },
    config = function()
        local lualine = require'lualine'

        local diagnostics = function()
            local msg = 'No Active Lsp'
            local buf_ft = vim.api.nvim_buf_get_option(0, 'filetype')
            local clients = vim.lsp.get_active_clients()
            if next(clients) == nil then return msg end
            for _, client in ipairs(clients) do
                local filetypes = client.config.filetypes
                if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
                    return client.name
                end
            end
            return msg
        end

        local encoding = function ()
            local enc = vim.opt.fileencoding:get()
            if enc == "utf-8" then
                return ""
            end
            return enc
        end

        lualine.setup {
            options = {
                icons_enabled = true,
                theme = 'auto',
                component_separators = {'', ''},
                section_separators = {'', ''},
                disabled_filetypes = {'NvimTree'}
            },
            sections = {
                lualine_a = {'mode'},
                lualine_b = {'branch'},
                lualine_c = {
                    'filename',
                    { "navic", color_correction = "static", }
                },
                lualine_x = {
                    {
                        'diagnostics',
                        sources = { 'nvim_diagnostic' },
                        sections = { "error", "warn", "hint" },
                        symbols = { error = " ", warn = " ", hint = " " },
                        colored = true,
                        update_in_insert = false,
                        always_visible = false,
                    },
                    {diagnostics, icon = ' LSP:'},
                    {encoding},
                    {
                        'fileformat',
                        symbols = {
                            -- unix = '', -- e712
                            unix = '',
                            dos = '',  -- e70f
                            mac = '',  -- e711
                        }
                    },
                    'filetype',
                    'location',
                },
                lualine_y = {'progress'},
                lualine_z = {}
            },
            inactive_sections = {
                lualine_a = {},
                lualine_b = {},
                lualine_c = {'filename'},
                lualine_x = {'location'},
                lualine_y = {},
                lualine_z = {}
            },
            tabline = {},
            extensions = {}
        }
    end
}
