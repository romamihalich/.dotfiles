-- noremap, silent keymap
Keymap = function(mode, lhs, rhs, desc)
    vim.keymap.set(mode, lhs, rhs, {
        noremap = true,
        silent  = true,
        desc    = desc,
    })
end

-- signs used to display
Signs = {
    error = "",
    warn = "",
    hint = "",
    info = "",
}
