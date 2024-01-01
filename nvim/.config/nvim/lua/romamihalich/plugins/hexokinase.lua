return {
    'rrethy/vim-hexokinase',
    build = 'make hexokinase',
    init = function()
        vim.cmd [[
        " Colorizer
        let g:Hexokinase_optInPatterns = [
        \     'full_hex',
        \     'triple_hex',
        \     'rgb',
        \     'rgba',
        \     'hsl',
        \     'hsla',
        \ ]
        ]]
    end
}
