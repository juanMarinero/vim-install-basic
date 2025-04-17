" vim: set ts=2 sts=2 sw=2 expandtab tw=0 foldmethod=indent :

syntax enable

set termguicolors

" Colorscheme
autocmd vimenter * ++nested colorscheme solarized8_low
let g:solarized_visibility="low"

" Transparency for the terminal background (1 ON, 0 OFF)
let g:solarized_termtrans=0
