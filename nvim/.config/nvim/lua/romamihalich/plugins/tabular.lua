return {
    'godlygeek/tabular',
    config = function()
        vim.keymap.set("v", "<leader>=", ":Tabularize /", {
            noremap = true,
            silent = false,
            desc = "Tabularize (\\zs)"
        })
    end
}
