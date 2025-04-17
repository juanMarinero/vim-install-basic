" vim: set ts=2 sts=2 sw=2 expandtab tw=0 foldmethod=indent :

" Show linters/fixers enabled/suggested in buffer/globally
nnoremap <leader>alei  :ALEInfo<CR>
nnoremap <leader>aleif :ALEFixSuggest<CR>

" Toggle ALE in current buffer (to yes/not show errors)
nnoremap <leader>ert :ALEToggleBuffer<CR>

" Fix all fixable errors
nmap <leader>erf! <Plug>(ale_fix)

" ALE fix-on-save Toggle
nnoremap <leader>alet :call ToggleAleFixOnSave()<CR>
function! ToggleAleFixOnSave()
  if !exists('b:ale_fix_on_save')
    let b:ale_fix_on_save = 0
  endif

  let b:ale_fix_on_save = !b:ale_fix_on_save
  echo "b:ale_fix_on save is now: " . (b:ale_fix_on_save ? "enabled" : "disabled")
endfunction

" Go to next/previous error
nnoremap <silent> <leader>ern <Plug>(ale_next_wrap)
nnoremap <silent> <leader>erp <Plug>(ale_previous_wrap)

" Error quickList window
nnoremap <leader>erw :ALEPopulateQuickfix<CR>:wincmd j<CR>
