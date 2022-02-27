require('onedark').setup {
    style = 'darker',
    colors = {
        search_blue   = "#5e81ac",
        search_orange = "#613214",
    },
    highlights = {
		Search     = {fg = "#ffffff", bg = "$search_blue", },
		IncSearch  = {fg = "#ffffff", bg = "$search_blue", },
		Substitute = {fg = "#ffffff", bg = "$search_orange", },
    }
}
require('onedark').load()
