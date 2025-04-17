" vim: set ts=2 sts=2 sw=2 expandtab tw=0 foldmethod=indent :

" Popup window
let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.7 } }

" fzf colorscheme preview
let $BAT_THEME='Solarized (dark)'

" FZF preview shortcuts
let g:fzf_action = {
  \ 'return': 'tab split',
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }
