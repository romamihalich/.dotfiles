local status_ok, configs = pcall(require, "nvim-treesitter.configs")
if not status_ok then
    vim.api.nvim_err_writeln("Can't load 'nvim-treesitter.configs'")
    return
end

configs.setup {
  ensure_installed = "all", -- one of "all"
  sync_install = false, -- install languages synchronously (only applied to `ensure_installed`)
  ignore_install = { "" }, -- List of parsers to ignore installing
  autopairs = {
    enable = true,
  },
  highlight = {
    enable = true, -- false will disable the whole extension
    disable = { "" }, -- list of language that will be disabled
    additional_vim_regex_highlighting = false, -- no bold return, def, etc...
  },
  indent = { enable = true, disable = { "yaml" } },
  context_commentstring = {
    enable = true,
    enable_autocmd = false,
  },
  autotag = {
      enable = true,
  },
}
