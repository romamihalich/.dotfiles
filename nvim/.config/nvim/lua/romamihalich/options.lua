local options = {
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
}

for k, v in pairs(options) do
  vim.opt[k] = v
end
