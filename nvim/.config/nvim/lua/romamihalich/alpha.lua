local status_ok, alpha = pcall(require, "alpha")
if not status_ok then
    vim.api.nvim_err_writeln("Can't load 'alpha'")
    return
end

alpha.setup(require'alpha.themes.startify'.config)
