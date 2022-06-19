local options = {
    clipboard = "unnamedplus",
    tabstop = 4,
    shiftwidth = 4,
    expandtab = true,
    smartindent = true,
    relativenumber = true,
    nu = true,
    hidden = true,
    errorbells = false,
    wrap = false,
    smartcase = true,
    ignorecase = true,
    hlsearch = true,
    scrolloff = 8,
    swapfile = false,
    backup = false,
    signcolumn= "yes",
    mouse= "a",
    timeoutlen = 250,
    splitright = true,
    splitbelow = true,
    termguicolors = true,
    undofile = true,
    langmap = "ФИСВУАПРШОЛДЬТЩЗЙКЫЕГМЦЧНЯ;ABCDEFGHIJKLMNOPQRSTUVWXYZ,фисвуапршолдьтщзйкыегмцчня;abcdefghijklmnopqrstuvwxyz",
    keymap = "russian-jcukenwin",
    iminsert = 0,
    imsearch = 0,
}

for k, v in pairs(options) do
  vim.opt[k] = v
end

vim.cmd [[ set iskeyword+=- ]]
