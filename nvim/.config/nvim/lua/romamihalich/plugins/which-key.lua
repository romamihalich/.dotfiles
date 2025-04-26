return {
    "folke/which-key.nvim",
    event = "VeryLazy",
    config = function()
        local wk = require "which-key"
        wk.setup {
            win = {
                no_overlap = false,
                border = "single",
                padding = { 2, 2 }, -- extra window padding [top/bottom, right/left]
                title = true,
                title_pos = "center",
                -- Additional vim.wo and vim.bo options
                bo = {},
                wo = {
                    -- winblend = 10, -- value between 0-100 0 for fully opaque and 100 for fully transparent
                },
            },
            layout = {
                height = { min = 4, max = 25 }, -- min and max height of the columns
                width = { min = 20, max = 50 }, -- min and max width of the columns
                spacing = 3, -- spacing between columns
                align = "left", -- align columns left, center or right
            },
            icons = {
                mappings = false,
            },
            spec = {
                {"<leader>f", group = "find" },
                {"<leader>l", group = "LSP" },
                {"<leader>o", group = "open" },
                {"<leader>h", group = "harpoon" },
                {"<leader>d", group = "debug" },
                {"<leader>g", group = "git" },
                {
                    mode = {"v"},
                    {"<leader>f", group = "find" },
                    {"<leader>l", group = "LSP" },
                }
            }
        }
    end
}
