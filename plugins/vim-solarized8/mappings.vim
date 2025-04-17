" vim: set ts=2 sts=2 sw=2 expandtab tw=0 foldmethod=indent :

nnoremap <leader>shbt :call SyntaxColorBackgroundToggle()<cr>
fun! SyntaxColorBackgroundToggle()
    " explanation of ":hi Folded", etc. after the function
    if &background == 'light'
        set background=dark
        hi Constant ctermfg=23
        hi Folded term=bold cterm=NONE ctermbg=16
        hi Folded guibg=#ADD8E6
    else
        set background=light
        " hi Constant ctermfg=62
        hi Folded term=bold cterm=NONE ctermbg=186
        hi Folded guibg=#FAFAD2

        " Custome highlight color of searchs
        hi Search term=reverse cterm=reverse ctermfg=136 gui=reverse guifg=#FFA500
    endif
endfun


" Toogle dark to set default light theme and other functions settings
set background=dark
autocmd VimEnter * call SyntaxColorBackgroundToggle()
