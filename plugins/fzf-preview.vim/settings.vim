" vim: set ts=2 sts=2 sw=2 expandtab tw=0 foldmethod=indent :

" Theme
let $FZF_PREVIEW_PREVIEW_BAT_THEME = 'Solarized (light)'

" If bat-theme with spaces:
" https://github.com/yuki-yano/fzf-preview.vim/issues/321
let g:bat_theme_option = '--theme=' . "'" . $FZF_PREVIEW_PREVIEW_BAT_THEME . "'"
let g:fzf_preview_lines_command='bat ' . g:bat_theme_option . ' --color=always --plain --number'
let g:fzf_preview_command = 'bat ' . g:bat_theme_option . ' --color=always --plain --number {-1}'
