local options = {
    tabstop = 4,
    shiftwidth = 4,
    expandtab = true,
    smartindent = true,
    relativenumber = true,
    nu = true,
    hidden = true,
    --noerrorbells = true,
    --nowrap = true,
    smartcase = true,
    ignorecase = true,
    --nohlsearch = false,
    scrolloff = 8,
    -- noswapfile = true,
    --nobackup = true,
    signcolumn= "yes",
    mouse= "a",
    timeoutlen = 250,
}

for k, v in pairs(options) do
  vim.opt[k] = v
end
