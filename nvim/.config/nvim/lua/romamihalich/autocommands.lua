vim.cmd [[
    augroup kek
        autocmd!
           autocmd TermOpen * startinsert
           autocmd VimEnter * :silent exec "!kill -s SIGWINCH $PPID"
           autocmd BufWritePost *Xresources,*Xdefaults !xrdb %
           autocmd BufWritePost *sxhkdrc !pkill -USR1 -x sxhkd
           autocmd BufWritePost *.tex silent! execute "!latexmk -pdf '%' >/dev/null 2>&1 &" | redraw!
    augroup END

    augroup yank_highlight
      autocmd!
      if exists('##TextYankPost')
        autocmd TextYankPost * silent! lua require'vim.highlight'.on_yank()
      endif
    augroup END
]]
