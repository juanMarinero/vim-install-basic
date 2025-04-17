" vim: set ts=2 sts=2 sw=2 expandtab tw=0 foldmethod=indent :

" Column sign style
let g:ale_set_signs = 1
let g:ale_sign_error = '✘'
let g:ale_sign_warning = '⚠'

" Set to enable linting when opening a new file
let g:ale_lint_on_enter = 1
" Set to show Vim windows for the loclist or quickfix items when a file contains
" warnings or errors (opening the file)
let g:ale_open_list = 0
" Set to not auto dissapear window of errors when there are no more errors
let g:ale_keep_list_window_open = 0

" Quicklist of error
let g:ale_set_loclist = 0
let g:ale_set_quickfix = 1

" Errors fixed when file saved
" Opt. A: Globally unset (default)
let g:ale_fix_on_save = 0
" Opt. B: for each filetype
autocmd FileType python,json,css,scss :let b:ale_fix_on_save = 1

" Set trailing whitespaces to warn
let g:ale_warn_about_trailing_whitespace = 0

" Linters
let g:ale_linters = {
      \'python': ['flake8','black','autoflake','mypy'],
      \'html': ['tidy','htmlhint'],
      \'css': ['stylelint'],
      \'javascript': ['standard'],
      \'json': ['jsonlint'],
      \'sql': ['sqlfluff'],
      \'sh': ['shellcheck'],
      \'c':   ['cc','clangd','clangcheck','clangtidy','ccls','cppcheck','cpplint','flawfinder'],
      \'cpp': ['cc','clangd','clangcheck','clangtidy','ccls','cppcheck','cpplint','flawfinder'],
      \'tex': ['chktex','lacheck'],
      \'java': ['pmd'],
      \'vim': ['vimls'],
      \}

" Only run linters named in ale_linters settings
let g:ale_linters_explicit = 1

" Fixers
let g:ale_fixers_basic = {
      \'*': ['remove_trailing_lines', 'trim_whitespace'],
      \'python': ['black'],
      \'html': ['tidy','rustywind','prettier'],
      \'css': ['stylelint','prettier'],
      \'scss': ['prettier'],
      \'javascript': ['prettier','standard'],
      \'json': ['jq','fixjson'],
      \'sql': ['sqlfluff'],
      \'sh': ['shfmt'],
      \'c':   ['clang-format','clangtidy'],
      \'cpp': ['clang-format','clangtidy'],
      \'java':['clang-format'],
      \'tex': ['latexindent'],
      \}
let g:ale_fixers_extended = deepcopy(g:ale_fixers_basic)
let g:ale_fixers_extended['python'] += ['autoimport','isort']
" Default fixers
let g:ale_fixers = g:ale_fixers_basic
" Toggle between extended and basic fixers
source ./plugins/ale/ToggleAleFixers.vim
nnoremap <leader>aletf :call ./ToggleAleFixers()<CR>
