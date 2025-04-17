" vim: set ts=2 sts=2 sw=2 expandtab tw=0 foldmethod=indent :

" Highlight miss-spell
let g:spellHiToogleBool = 0
function! SpellHighlightToggle()
  echo "spellHiToogleBool: "g:spellHiToogleBool
  if g:spellHiToogleBool
    " toggle value
    let g:spellHiToogleBool = 0
    " Highlights none
    hi SpellBad cterm=None ctermfg=None
    hi SpellCap cterm=None ctermfg=None
    hi SpellLocal cterm=None ctermfg=None
    hi SpellRare cterm=None ctermfg=None
  else
    " toggle value
    let g:spellHiToogleBool = 1
    " Highlights underlined
    hi SpellBad cterm=underline ctermfg=red
    hi SpellCap cterm=underline ctermfg=DarkRed
    hi SpellLocal cterm=underline ctermfg=DarkMagenta
    hi SpellRare cterm=bold ctermfg=blue
  endif
endfunc
