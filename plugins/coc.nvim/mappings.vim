" vim: set ts=2 sts=2 sw=2 expandtab tw=0 foldmethod=indent :

" Find/replace plain text (not regexp)
nnoremap <leader>cocf         :CocSearch<space>
vnoremap <leader>cocf "+y<Esc>:CocSearch<space><C-R>+<CR>

" Regexp
nnoremap <leader>cocfr         :CocSearch --regexp<space>
vnoremap <leader>cocfr "+y<Esc>:CocSearch --regexp<space><C-R>+
nnoremap <leader>cocfre :call CocSearchRegexpExamples()<CR>

" Search hidden files and dirs
nnoremap <leader>cocfh         :CocSearch --hidden<space>
vnoremap <leader>cocfh "+y<Esc>:CocSearch --hidden<space><C-R>+<CR>

" Follow symlinks
nnoremap <leader>cocfl         :CocSearch --follow<space>
vnoremap <leader>cocfl "+y<Esc>:CocSearch --follow<space><C-R>+<CR>

" Combined hidden-files and follow symlinks
nnoremap <leader>cocflh         :CocSearch --hidden --follow<space>
vnoremap <leader>cocflh "+y<Esc>:CocSearch --hidden --follow<space><C-R>+<CR>


" Use <tab> for trigger completion and navigate to the next complete item
function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

inoremap <silent><expr> <Tab>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()

" Use <Tab> and <S-Tab> to navigate the completion list:
inoremap <expr> <Tab> coc#pum#visible() ? coc#pum#next(1) : "\<Tab>"
inoremap <expr> <S-Tab> coc#pum#visible() ? coc#pum#prev(1) : "\<S-Tab>"

" <c-n>  to trigger completion in insert mode
inoremap <silent><expr> <c-n> coc#refresh()

" go to, show usages,...
nmap <silent> <leader>cD <Plug>(coc-definition)<Plug>Pulse
nmap <silent> <leader>cy <Plug>(coc-type-definition)
nmap <silent> <leader>ci <Plug>(coc-implementation)
nmap <silent> <leader>cr <Plug>(coc-references)

" Symbol renaming
nmap <leader>rn <Plug>(coc-rename)

" Show documentation in preview window.
nnoremap <silent> <leader>d    :call <SID>show_documentation()<CR>
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction
