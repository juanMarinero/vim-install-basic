" vim: set ts=2 sts=2 sw=2 expandtab tw=0 foldmethod=indent :

" Go to previous tab
nnoremap gr gT
" next tab default: gt

" Select current word
nnoremap <leader>w viw

" C by default change to EOL, but D deletes already to EOL (i.e C = D + i)
" remap C to change current word
nnoremap C ciw

" Move cursor in visual/block selection
" http://vimcasts.org/episodes/selecting-columns-with-visual-block-mode/
" https://vi.stackexchange.com/questions/24862/how-to-go-back-to-the-start-of-a-visual-selection/28526#28526
" normalmode |  def
" `< 	       |  To beginning of last visual selection
" `> 	       |  To end       of last visual selection
" visualmode | def
" o          | Toggle to oppositive cornel
" o          | ""
nnoremap gv0 `<
nnoremap gv$ `>
vnoremap gv0 o
vnoremap gv$ o

" Backspace
nnoremap <BS> h"_x
vnoremap <BS> "_x

" Spanish keyboard
map ç <CR>

" Column Number Toggle
nnoremap <leader>cnt :set<Space>relativenumber!<CR>

" Column Fold
nnoremap <leader>cff :let &foldcolumn=&foldlevel+1<cr>:echo "Deepest foldLevel"<cr>
nnoremap <leader>cf  :let &foldcolumn = &foldcolumn + 1<cr>:set foldcolumn?<cr>
nnoremap <leader>cF  :let &foldcolumn = &foldcolumn - 1<cr>:set foldcolumn?<cr>

" toggle (un/show) search highlights
nnoremap <silent> <leader>h :set hls!<CR>

" Set working directory to the current file
nnoremap <leader>cd :cd %:p:h<CR>:pwd<CR>

" Windows resize
nnoremap <leader>+ :vertical resize +5<CR>
nnoremap <leader>- :vertical resize -5<CR>
nnoremap <leader>++ :resize +5<CR>
nnoremap <leader>-- :resize -5<CR>

" Maps loaded in current buffer and not globaly:
nnoremap <leader>mb :map <buffer><CR>

" Show buffers and args
" To run for example :bd <index_buffer>
nnoremap <leader>bb :buffers<CR>:b<space>
" See http://vimcasts.org/episodes/populating-the-arglist/
nnoremap <leader>a :args<CR>

" Show registers
nnoremap <leader>R :registers<CR>

" Show marks
nnoremap <leader>M :marks<CR>

" Delete marks of current buffer
" https://stackoverflow.com/questions/11450817/vim-how-do-i-clear-all-marks
nnoremap <leader>Mrm! :delmarks!<CR>

" Show changes
" Example to jump to the 4th change_index (1st column) press 4g;
" Press g, for opposite direction
nnoremap <leader>RC :changes<CR>

" Show jumps
" Example to jump to the 4th jump_index (1st column) press 4Ctrl-O
" Ctrl-I for opposite direction
nnoremap <leader>j :jumps<CR>

" To hold in same cursor position after saving
nnoremap <leader>s :silent update<CR>
vnoremap <leader>s <C-C>:update<CR>gv

" Quit. To Exit the current window. To close the buffer run :bd
noremap <C-E> :q<CR>
vnoremap <C-E> :q<CR>

" Whole buffer
" ... copy to system clipboard
nnoremap <leader>all :%y+<CR>
" ... delete all
nnoremap <leader>alld ggdG
" ... replace all with system clipboard
nnoremap <leader>allr :0norm!VG"+p<CR>

" Ctrl-A official use {{{3
" https://vim.fandom.com/wiki/Increasing_or_decreasing_numbers
" Ctrl-A once to increase 1 unit. See :help CTRL-a
" Ctrl-A twice to decrease 1 unit. Default :help Ctrl-x. C-S-x for system-clipboard
xnoremap <C-a><C-a> <C-x>
nnoremap <C-a><C-a> <C-x>

" Copy to system-clipboard register only
vnoremap <C-x>  :call CopyToSystemClipboardVisualSelection()<CR>
nmap <C-x> :<C-u>call CopyToSystemClipboardCountLines()<CR>
" Yank is short for write on primary clipboard (middle-click)
" Copy is short for write on system clipboard (Ctrl+C)
" Yank/copy till end of line
nnoremap Y  vg_"*y<Esc>
nnoremap Yc vg_<Esc>:call CopyToSystemClipboardVisualSelection()<CR>
" Yank/copy + delete till end of line. Default nmap D already achieves it
nnoremap D  vg_d<Esc>
nnoremap Dc vg_<Esc>:call CopyToSystemClipboardVisualSelection()<CR>gv"_d
" Yank/copy + delete till start of line. Default nmap R is replace mode, which I avoid
nnoremap R  v^d<Esc>
nnoremap Rc v^<Esc>:call CopyToSystemClipboardVisualSelection()<CR>

function! CopyToSystemClipboardVisualSelection()
  if has('nvim')
    normal! gv"+y
  else
    " Save the content of register 'x' into a variable
    let l:old_x = @x
    " Yank the visual selected text into register 'x'
    normal! gv"xy
    " Assign the content of register 'x' to the system-clipboard register ("+)
    execute "let @+=@x"
    " Reset the value of register 'x' to its original content
    let @x = l:old_x
  endif
endfunction
func! CopyToSystemClipboardCountLines()
  " Save the content of register 'x' into a variable
  let l:old_x = @x
  if v:count is 0
    " to copy till last char of line, excluding any whitespace and EOL char (^M)
    echo "Current whole-line copied. Paste with C-S-v."
    " Yank the line (yy) into register 'x'
    normal 0vg_"xy
    " Assign the content of register 'x' to the system-clipboard register ("+)
    let @+=@x
  else
    " Yank the lines (yy) into register 'x'
    silent! exec 'normal ' . v:count . '"xyy'
    " Assign the content of register 'x' to the system-clipboard register ("+)
    let @+=@x
    echo v:count . ' whole-lines copied. Paste with C-S-v.'
  endif
  " Reset the value of register 'x' to its original content
  let @x = l:old_x
endfunc

" Paste AFTER current line, useful when you're pasting several lines
" Yanked. Default map 'p'
" Copied
nnoremap <leader>p :pu +<cr>

" Current line just to 'black hole register'. Replace with yanked line
nnoremap <leader>P "_ddP

" Copy and paste current line but without modifying the '*' register
nnoremap <leader>yyp "9yy"9p

" To select the just pasted text
nnoremap gvp `[v`]

" Visual Block mode to yank/copy/paste
source ./plugins/miscellaneous/VisualBlockYankCopyPaste.vim

" Move selected lines vertically
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

" Toggle spelling checking
" ']s' or '[s' to next/prev. missspell
" 'z=' list of suggested corrections"
source ./plugins/miscellaneous/SpellHiToogleBool.vim
nnoremap <silent> <leader>spell :call SpellHighlightToggle()<CR>:set spell!<CR>
nnoremap <silent> <leader>spellen :set spelllang=en<CR>:NormLead spell<CR>
nnoremap <silent> <leader>spellde :set spelllang=en,de<CR>:NormLead spell<CR>
nnoremap <silent> <leader>spelles :set spelllang=en,es<CR>:NormLead spell<CR>

" To enable search visual-mode highlighted text
source ./plugins/miscellaneous/VisualSelection.vim
vnoremap <silent> n :<C-u>call VisualSelection('', '')<CR>/<C-R>=@/<CR><CR>
vnoremap <silent> <leader>* :<C-u>call VisualSelection('', '')<CR>/<C-R>=@/<CR><CR>
vnoremap <silent> <leader># :<C-u>call VisualSelection('', '')<CR>?<C-R>=@/<CR><CR>
nnoremap <silent> <leader>* viw:<C-u>call VisualSelection('', '')<CR>/<C-R>=@/<CR><CR>:noh<CR>zz

" Search
source ./plugins/miscellaneous/Search.vim

" Search content of register
source ./plugins/miscellaneous/RegisterSearchContent.vim

" Edit content of register
source ./plugins/miscellaneous/RegisterEdit.vim

" Copy inbetween registers
source ./plugins/miscellaneous/RegisterDuplicate.vim

" Replace current word with content yanked/copied/deleted
nnoremap <leader>r  "_ciw<c-r>*<Esc>
nnoremap <leader>rc "_ciw<c-r>+<Esc>
nnoremap <leader>rd "_ciw""P<Esc>
" Replace visual selection with content yanked/copied/deleted
vnoremap <leader>r  "_c<c-r>*<Esc>
vnoremap <leader>rc "_c<c-r>+<Esc>
vnoremap <leader>rd "_c<c-r>"<Esc>
" Replace all matches in current buffer
nnoremap <leader>rf  yiw<Esc>:%s/<C-r>*/<C-r>*/g<Left><Left>

" Swap whole words, not chars, simultaneously
" Current buffer
nnoremap <leader>rmf :Refactor {'':'', '':''}<Left><Left><Left><Left><Left>
      \<Left><Left><Left><Left><Left><Left><Left>
" Visual selection only
vnoremap <leader>rmv <Esc>:'<,'>Refactor {'':'', '':''}<Left><Left><Left>
      \<Left><Left><Left><Left><Left><Left><Left><Left><Left>
" Swap text yanked to registers 'a' and 'b'
nnoremap <leader>rmf2 :Refactor {'<C-R>a':'<C-R>b', '<C-R>b':'<C-R>a'}
" Swap text yanked to registers {'a', 'b', 'c'}
nnoremap <leader>rmf3 :Refactor {'<C-R>a':'<C-R>b', '<C-R>b':'<C-R>c', '<C-R>c':'<C-R>a'}
function! Refactor(dict) range
  execute a:firstline . ',' . a:lastline . 's/\C\%(' .
        \join(keys(a:dict),'\|'). '\)/\='.string(a:dict).'[submatch(0)]/ge'
endfunction
command! -range=% -nargs=1 Refactor :<line1>,<line2>call Refactor(<args>)

" Show Sign Column
set signcolumn=yes
function! ColumnSignToggle()
  if &signcolumn=="yes"
    set signcolumn=no
  else
    set signcolumn=yes
  endif
endfunction
nnoremap <leader>cst :call ColumnSignToggle()<CR>
