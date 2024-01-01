return {
    'windwp/nvim-autopairs',
    config = function()
        -- local disable_in_visualblock = false -- disable when insert after visual block mode
        -- local enable_afterquote = true  -- add bracket pairs after quote
        require'nvim-autopairs'.setup{
            enable_moveright = false,
            disable_in_macro = true,
        }

        -- local cmp_autopairs = require "nvim-autopairs.completion.cmp"
        -- local cmp_status_ok, cmp = pcall(require, "cmp")
        -- if not cmp_status_ok then
        -- vim.api.nvim_err_writeln("Can't load 'cmp'")
        --   return
        -- end
        -- cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done { map_char = { tex = "" } })
    end
}
