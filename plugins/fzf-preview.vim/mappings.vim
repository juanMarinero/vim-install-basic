" vim: set ts=2 sts=2 sw=2 expandtab tw=0 foldmethod=indent :

" FZF find in current file
if has('nvim')
  nnoremap <leader>f :FzfPreviewLines<CR>
  vnoremap <leader>f "+y<Esc>:FzfPreviewLines --add-fzf-arg=--query="<C-R>+"<CR>
else
  nnoremap <leader>f :FzfPreviewLinesRpc<CR>
  vnoremap <leader>f "+y<Esc>:FzfPreviewLinesRpc --add-fzf-arg=--query="<C-R>+"<CR>
endif


" FZF find in buffers
if has('nvim')
  nnoremap <leader>fb :FzfPreviewBufferLines<CR>
  nnoremap <C-f><C-f> :FzfPreviewBufferLines<CR>
  vnoremap <leader>fb "+y<Esc>:FzfPreviewBufferLines --add-fzf-arg=--query="<C-R>+"<CR>
  vnoremap <C-f><C-f> "+y<Esc>:FzfPreviewBufferLines --add-fzf-arg=--query="<C-R>+"<CR>
else
  nnoremap <leader>fb :FzfPreviewBufferLinesRpc<CR>
  nnoremap <C-f><C-f> :FzfPreviewBufferLinesRpc<CR>
  vnoremap <leader>fb "+y<Esc>:FzfPreviewBufferLinesRpc --add-fzf-arg=--query="<C-R>+"<CR>
  vnoremap <C-f><C-f> "+y<Esc>:FzfPreviewBufferLinesRpc --add-fzf-arg=--query="<C-R>+"<CR>
endif
