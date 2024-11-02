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
    sidescrolloff = 8,
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
    wildignore = "node_modules/*,bin/*,obj/*,.git/*",
    cursorline = true,
    grepprg = "rg --vimgrep --no-heading",
    grepformat = "%f:%l:%c:%m,%f:%l:%m,%f",
}

for k, v in pairs(options) do
  vim.opt[k] = v
end

vim.opt.iskeyword:append('-')
vim.opt.diffopt:append('iwhite')
vim.opt.fillchars:append('diff: ')
