local status_ok, onedark = pcall(require, "onedark")
if not status_ok then
    vim.api.nvim_err_writeln("Can't load 'onedark'")
    return
end

onedark.setup {
    style = 'darker',
    colors = {
        search_blue   = "#5e81ac",
        search_orange = "#613214",
    },
    highlights = {
		Search     = {fg = "#ffffff", bg = "$search_blue", },
		IncSearch  = {fg = "#ffffff", bg = "$search_blue", },
		Substitute = {fg = "#ffffff", bg = "$search_orange", },
        TSPunctBracket = {fg = "#abb2bf"}
    }
}
onedark.load()
