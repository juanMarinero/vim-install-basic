" vim: set ts=2 sts=2 sw=2 expandtab tw=0 foldmethod=indent :

" fzf+maps
nnoremap <leader>m :Maps<CR>

" fzf+commands
nnoremap <leader>Rcmd :Command<CR>

" fzf+buffers
nnoremap <leader>b :Buffers<CR>

" fzf+buffers-maps
nnoremap <leader>M :FzfPreviewMarksRpc<CR>

" fzf+changes
nnoremap <leader>RC :Changes<CR>

" fzf+jumps
nnoremap <leader>j :Jumps<CR>

" fzf find string i CWD or deeper
" to make :Ag not match file names, only the file content:  https://github.com/junegunn/fzf.vim/issues/346
command! -bang -nargs=* Rg call fzf#vim#ag(<q-args>, fzf#vim#with_preview({'options': '--delimiter : --nth 4..'}), <bang>0)
nnoremap <leader>fa :RG<CR>
vnoremap <leader>fa "+y<Esc>:RG<space><C-R>+<CR>

" Command history
nnoremap <C-h>      :History:<CR>
" Search history
nnoremap <C-h><C-h> :History/<CR>
" Search files
nnoremap <leader>F :Files<CR>
" Search git files
nnoremap <Leader>gf :GF?<CR>
