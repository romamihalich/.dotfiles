local status_ok, nvim_autopairs = pcall(require, "nvim-autopairs")
if not status_ok then
    vim.api.nvim_err_writeln("Can't load 'nvim-autopairs'")
    return
end

nvim_autopairs.setup{
    enable_moveright = false
}

-- local cmp_autopairs = require "nvim-autopairs.completion.cmp"
-- local cmp_status_ok, cmp = pcall(require, "cmp")
-- if not cmp_status_ok then
-- vim.api.nvim_err_writeln("Can't load 'cmp'")
--   return
-- end
-- cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done { map_char = { tex = "" } })
