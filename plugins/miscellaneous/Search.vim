" vim: set ts=2 sts=2 sw=2 expandtab tw=0 foldmethod=indent :

" Search pattern in desired files
" See https://github.com/junegunn/fzf.vim/issues/1533#issuecomment-2773383166
command! -complete=file -bang -nargs=* RgFiles
            \ call fzf#vim#grep(
            \ "rg --with-filename --column --line-number --no-heading --color=always --colors \"path:fg:blue\" --colors \"line:fg:22\" --smart-case -- ".
            \<q-args>, fzf#vim#with_preview({'options': '--layout=reverse --delimiter : --nth 4..'}), <bang>0)
" Example call
" :RgFiles pattern A.py B.py C.py dirA dirB dirC

" Search pattern in Vim related files
nnoremap <leader>fVa         :execute 'RgFiles ""      ~/.vimrc ~/.vim/ftplugin ~/.vim_plugins ' . expand(g:vim_install_basic_dir)<CR>
vnoremap <leader>fVa "+y<Esc>:execute 'RgFiles <C-R>+  ~/.vimrc ~/.vim/ftplugin ~/.vim_plugins ' . expand(g:vim_install_basic_dir)<CR>

" Search pattern in Vim related files with .vim extension or .vimrc
command! -complete=file -bang -nargs=* RgFilesVim
            \ call fzf#vim#grep(
            \ "rg --with-filename --column --line-number --no-heading --color=always --colors \"path:fg:blue\" --colors \"line:fg:22\" --smart-case --type-add vim:*.vim --type-add vimrc:*.vimrc --type vim --type vimrc -- ".
            \<q-args>, fzf#vim#with_preview({'options': '--layout=reverse --delimiter : --nth 4..'}), <bang>0)
nnoremap <leader>fV         :execute 'RgFilesVim ""     ~/.vimrc ~/.vim/ftplugin ~/.vim_plugins ' . expand(g:vim_install_basic_dir)<CR>
vnoremap <leader>fV "+y<Esc>:execute 'RgFilesVim <C-R>+ ~/.vimrc ~/.vim/ftplugin ~/.vim_plugins ' . expand(g:vim_install_basic_dir)<CR>

" Search pattern in current buffer only
nnoremap <leader>f         :FzfPreviewLinesRpc<CR>
vnoremap <leader>f "+y<Esc>:FzfPreviewLinesRpc --add-fzf-arg=--query="<C-R>+"<CR>

" Search pattern in buffers
nnoremap <leader>fb         :FzfPreviewBufferLinesRpc<CR>
vnoremap <leader>fb "+y<Esc>:FzfPreviewBufferLinesRpc --add-fzf-arg=--query="<C-R>+"<CR>

" Search pattern in CWD
command! -bang -nargs=* RG
            \ call fzf#vim#grep(
            \ "rg --column --line-number --no-heading --color=always --colors \"path:fg:blue\" --colors \"line:fg:22\" --smart-case ".shellescape(<q-args>),
            \ 1, fzf#vim#with_preview({'options': '--delimiter : --nth 4..'}), <bang>0)
nnoremap <leader>fa         :cd %:p:h<CR>:RG<CR>
vnoremap <leader>fa "+y<Esc>:cd %:p:h<CR>:RG<space><C-R>+<CR>

" CocSearch
nnoremap <leader>coch :call CocSearchHelp()<CR>
function! CocSearchHelp()
  echo '<leader>cocf   Find in CWD with CocSearch. Display all matches in new interactive window.'
  echo '               Matches can be:'
  echo '                 - Removed from current tab (to prevent rewrite them). Goto mathc, press <Tab> and press 2'
  echo '                 - Open in new tab. Goto match, press <CR>'
  echo '                 - Edited. Edit any match (or text around shown), save it, and the respective buffer is updated.'
  echo '<leader>cocf_  "" with regex, symlinks, hiddenfiles,... '
endfunction
nnoremap <leader>cocf         :CocSearch<space>
vnoremap <leader>cocf "+y<Esc>:CocSearch<space><C-R>+<CR>

" Regexp
nnoremap <leader>cocfr         :CocSearch --regexp<space>
vnoremap <leader>cocfr "+y<Esc>:CocSearch --regexp<space><C-R>+
nnoremap <leader>cocfre :call CocSearchRegexpExamples()<CR>
function! CocSearchRegexpExamples()
  echo ':CocSearch -e arg.01       " matches arg_01, arg001, arg101, etc.'
  echo ':CocSearch -e arg.*01      " matches arg01, argument01, argument_01, etc.'
  echo ':CocSearch -e argument_\d+ " matches argument_01, argument_02, etc.'
endfunction

" search hidden files and dirs
nnoremap <leader>cocfh         :CocSearch --hidden<space>
vnoremap <leader>cocfh "+y<Esc>:CocSearch --hidden<space><C-R>+<CR>

" follow symlinks
nnoremap <leader>cocfl         :CocSearch --follow<space>
vnoremap <leader>cocfl "+y<Esc>:CocSearch --follow<space><C-R>+<CR>

" combined hidden-files and follow symlinks
nnoremap <leader>cocflh         :CocSearch --hidden --follow<space>
vnoremap <leader>cocflh "+y<Esc>:CocSearch --hidden --follow<space><C-R>+<CR>
