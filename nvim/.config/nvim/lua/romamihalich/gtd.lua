vim.cmd [[
    " GTD
    let g:gtd#dir = '~/gtd'
    let g:gtd#default_action = 'inbox'
    let g:gtd#map_refresh = 'r'
    let g:gtd#review = [
        \ '!inbox',
        \ '!next',
        \ '!projects',
        \ '!calendar',
        \ '!waiting',
        \ '!later',
        \ '!done',
        \ '!notes',
        \ '!trash',
        \ ]
]]
