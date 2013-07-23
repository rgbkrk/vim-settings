" Vim Journal
" By Danny Cook
" To the extent possible under law, I have waived all copyright and related or neighboring rights to Vim Journal. See http://creativecommons.org/publicdomain/zero/1.0/ for details.

if exists("g:loaded_journal")
    finish
endif
let g:loaded_journal = 1

if !exists("g:JOURNAL_DIR")
    let g:JOURNAL_DIR = "~/.vim-journal"
endif

function! Journal()
    let l:year = strftime("%Y")
    let l:month = strftime("%m")
    let l:day = strftime("%d")

    let l:dir = expand(g:JOURNAL_DIR)."/".l:year."/".l:month
    let l:diresc = escape(l:dir, " ")

    if !isdirectory(l:dir)
        exe "silent !mkdir -p ".l:diresc
    endif

    redraw!
    exe "lcd ".l:diresc
    exe "e ".l:day.".md"
endfunction

command! Journal call Journal()

