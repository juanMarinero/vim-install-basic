" vim: set ts=2 sts=2 sw=2 expandtab tw=0 foldmethod=indent :

" Toggle between extended and basic fixers
function! ToggleAleFixers()
  " Set fixers to extended
  let b:ale_fixers = g:ale_fixers_extended
  echo "Buffer ALE fixers set to extended"

  " Store original value with a default of 0 if it doesn't exist
  let l:ale_fix_on_save_tmp = get(b:, 'ale_fix_on_save', 0)

  " Set b:ale_fix_on_save
  let b:ale_fix_on_save = 1

  " Edit somehow the file to make fixers work on save
  " Add a space at the end of line
  execute "normal! A \<Esc>"

  " Save the file
  " To use ALE fixers since b:ale_fix_on_save = 1
  silent! write

  " Sleep for 3 seconds
  silent! execute 'sleep 3'

  " Reset b:ale_fix_on_save to original value
  let b:ale_fix_on_save = l:ale_fix_on_save_tmp

  " Reset fixers to basic
  let b:ale_fixers = g:ale_fixers_basic
  echo "Buffer ALE fixers reset to basic"
endfunction
