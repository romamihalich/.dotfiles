vim.cmd [[
    " Dashboard
    let g:dashboard_default_executive ='telescope'
    let g:dashboard_custom_header = [
    \ ' ███╗   ██╗ ███████╗ ██████╗  ██╗   ██╗ ██╗ ███╗   ███╗',
    \ ' ████╗  ██║ ██╔════╝██╔═══██╗ ██║   ██║ ██║ ████╗ ████║',
    \ ' ██╔██╗ ██║ █████╗  ██║   ██║ ██║   ██║ ██║ ██╔████╔██║',
    \ ' ██║╚██╗██║ ██╔══╝  ██║   ██║ ╚██╗ ██╔╝ ██║ ██║╚██╔╝██║',
    \ ' ██║ ╚████║ ███████╗╚██████╔╝  ╚████╔╝  ██║ ██║ ╚═╝ ██║',
    \ ' ╚═╝  ╚═══╝ ╚══════╝ ╚═════╝    ╚═══╝   ╚═╝ ╚═╝     ╚═╝',
    \]
    let g:dashboard_custom_section={
      \ 'a': {
          \ 'description': [' Projects'],
          \ 'command': 'Telescope projects' },
      \ 'b': {
          \ 'description': [' Dotfiles'],
          \ 'command': "lua require'telescope.builtin'.find_files{cwd = '/home/romamihalich/.config', hidden = true}" },
      \ 'c': {
          \ 'description': [' Buffers'],
          \ 'command': "Telescope buffers" },
      \ }
]]
