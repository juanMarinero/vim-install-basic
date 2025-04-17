" vim: set ts=2 sts=2 sw=2 expandtab tw=0 foldmethod=indent :

syntax enable

" termcolors
let g:solarized_termcolors=256
set t_Co=256

" Contrast
let g:solarized_contrast = "low"

" Transparency for the terminal background (1 ON, 0 OFF)
let g:solarized_termtrans=0

" Colorscheme
colorscheme solarized
if !filereadable(expand('~/.vim/colors/solarized.vim'))
  silent !mkdir -p ~/.vim/colors
  silent !cp ~/.vim/plugged/vim-colors-solarized/colors/solarized.vim ~/.vim/colors/
endif

" Custome highlight color of searchs
hi Search ctermfg=DarkYellow ctermbg=Gray
