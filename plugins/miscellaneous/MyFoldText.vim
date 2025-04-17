" vim: set ts=2 sts=2 sw=2 expandtab tw=0 foldmethod=indent :

" https://stackoverflow.com/questions/5316334
" https://www.reddit.com/r/vim/comments/1b6viw/vim_better_foldtext/
function! MyFoldText()
  let line = getline(v:foldstart)
  let sub = substitute(line, '/\*\|\*/\|{{{\d\=', '', 'g')
  let ind = indent(v:foldstart)
  let lines = v:foldend-v:foldstart + 1
  let spaces = ''
  let i = 0
  let offset = 20
  let repeatchar =' '
  while i < (ind - ind/4)
    let spaces .= ' '
    let i = i+1
  endwhile
  return spaces . sub .
        \ repeat(repeatchar, winwidth(0) - strdisplaywidth(spaces . sub) - offset) .
        \ ' ' . lines . ' lines '
endfunction
