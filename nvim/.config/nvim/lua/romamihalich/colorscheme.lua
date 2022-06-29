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
        -- my_blue = "#61AFEF",
        my_blue = "#264F78",
        dark_gray = "#2a2f3e",
    },
    highlights = {
		Search     = {fg = "#ffffff", bg = "$my_blue", },
		IncSearch  = {fg = "#ffffff", bg = "$search_blue", },
		Substitute = {fg = "#ffffff", bg = "$search_orange", },
        TSPunctBracket = {fg = "#abb2bf"},
        QuickFixLine = { bg = "$dark_gray", fmt = "bold", fg = "none" },
    }
}
onedark.load()
