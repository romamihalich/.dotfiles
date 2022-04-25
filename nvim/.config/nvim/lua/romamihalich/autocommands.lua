local group = vim.api.nvim_create_augroup("kek", { clear = true })
vim.api.nvim_clear_autocmds({ group = group })
local autocmd = function(event, opts)
    opts.group = group
    vim.api.nvim_create_autocmd(event, opts)
end

autocmd("TermOpen", { command = "startinsert" })

autocmd("VimEnter", { command = ':silent exec "!kill -s SIGWINCH $PPID"'})

autocmd("BufWritePost", {
    pattern = { "*Xresources", "*Xdefaults" },
    command = "!xrdb %"
})

autocmd("BufWritePost", {
    pattern = "*sxhkdrc",
    command = "!pkill -USR1 -x sxhkd"
})

autocmd("BufWritePost", {
    pattern = "*.tex",
    command = 'silent! execute "!latexmk -pdf \'%\' >/dev/null 2>&1 &" | redraw!'
})

autocmd("FileType", {
    pattern = "http",
    callback = function ()
        vim.keymap.set('n', '<CR>', require'rest-nvim'.run, { silent = true, buffer = true })
    end,
})

vim.cmd [[
    augroup yank_highlight
      autocmd!
        if exists('##TextYankPost')
          autocmd TextYankPost * silent! lua require'vim.highlight'.on_yank()
        endif
    augroup END
]]
