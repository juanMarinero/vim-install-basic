" vim: set ts=2 sts=2 sw=2 expandtab tw=0 foldmethod=indent :

" Python3 feature
if has('nvim')
  " Default Python for Neovim (required for core functionality)
  let g:python3_host_prog = expand("$HOME/.nvim-python/bin/python3")
  " See install/NeoVim/make.sh
  " :checkhealth  " search for 'Python 3 provider'

  " Set on startup and when changing directories
  " autocmd VimEnter,DirChanged * call SetPythonHostProg()
endif
" Auto-detect and use virtualenv Python when present
function! SetPythonHostProg()
  " Check for activated virtualenv in shell
  if exists('$VIRTUAL_ENV') && executable($VIRTUAL_ENV . '/bin/python')
    let g:python3_host_prog = $VIRTUAL_ENV . '/bin/python'
  " Fallback to searching for venv in project
  else
    let l:venv_python = findfile('venv/bin/python', '.;')
    if !empty(l:venv_python)
      let g:python3_host_prog = fnamemodify(l:venv_python, ':p')
    else
      " Revert to default if no venv found
      let g:python3_host_prog = expand("$HOME/.nvim-python/bin/python3")
    endif
  endif
endfunction

" Ensure Vim runs in enhanced mode (not Vi-compatible)
set nocompatible

" Sets how many lines of history VIM has to remember
set history=10000

" Enable filetype plugins
filetype plugin on
filetype indent on

" Set to auto read when a file is changed from the outside
" set autoread

" With a map leader it's possible to do extra key combinations
let mapleader = ","

" Opening a new file when the current buffer has unsaved changes causes files
" to be hidden instead of closed
set hidden

" Show number line
" - Absolute
" set number
" - Relative to cursor position
set relativenumber

" Show results in context-sensitive command-line completion. "E.g. :e<Tab>
set wildmenu

" Highlight search matches
set hlsearch

" Enable mouse to click in desired window to go
set mouse=a

" Ignore compiled files
set wildignore=*.o,*~,*.pyc
if has("win16") || has("win32")
  set wildignore+=.git\*,.hg\*,.svn\*
else
  set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store
endif

" Always show current position
" set ruler

" Height of the command bar
" set cmdheight=2

" Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

" Show matching brackets when text indicator is over them
set showmatch
" How many tenths of a second to blink when matching brackets
set mat=2

" Show command-key pressed
" For example, if you start typing :wq, you will see :wq appear at the bottom
" right of the screen before you press Enter.
set showcmd

" When opening a buffer, jump to the last known position
autocmd BufReadPost *
      \ if line("'\"") > 1 && line("'\"") <= line("$") |
      \ exe "normal! g`\"" |
      \ endif

" Set block cursor in normal mode
if has('nvim')
  set guicursor=n-v-c-sm:block,i-ci-ve:ver25,r-cr-o:hor20
  " Disable cursor shape changes in terminal (handle in terminal config instead)
  let &t_SI = ""
  let &t_EI = ""
else
  let &t_SI = "\e[6 q"  " Set cursor to line (I-beam) in insert mode
  let &t_EI = "\e[2 q"  " Set cursor to block in normal mode
endif

if !has('nvim')
  " Reset the cursor on startup (optional)
  autocmd VimEnter * silent !echo -ne "\e[2 q"
endif

" Dont go back 1 character when leaving insert mode
au InsertLeave * call cursor([getpos('.')[1], getpos('.')[2]+1])

" When scrolling, keep cursor 3 lines away from screen border
set scrolloff=3

" Starts searching as soon as you type the first character of the string.
" Each additional character further refines the search
set incsearch

" New window default below (if vertical) or right (if horizontal)
set splitbelow
set splitright

" Always show the status line
set laststatus=2

" Format the status line
" Plugin vim-airline/vim-airline overwrites it
set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \
      \CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l\ \ Column:\ %c
" Returns true if paste mode is enabled
function! HasPaste()
  if &paste
    return 'PASTE MODE  '
  endif
  return ''
endfunction

" Defaults foldmethod
setlocal foldmethod=indent

" Customize foldtext
source ./plugins/miscellaneous/MyFoldText.vim
set foldtext=MyFoldText()

" Vim sessions
" set sessionoptions? "by default shows:
" blank,buffers,curdir,folds,help,options,tabpages,winsize
set sessionoptions=blank,buffers,folds,help,tabpages,winsize
" https://vi.stackexchange.com/a/5626/29452
" Removed 'options' to not autosave mappings, so they depend on $MYVIMRC
" Removed 'curdir' to not autosave CWD. To move project dir.

" Enable modeline
setglobal modeline
set modelines=5

" If set Vim uses the '"*' register (primary selection, mouse middle) for all
" yank, delete, change and put operations which would normally go to the
" unnamed register '""'
" :h 'clipboard'
set clipboard=unnamed
if has('nvim')
  " set clipboard+=unnamedplus
endif

" Cursor shape
if has("autocmd")
  au VimEnter,InsertLeave * silent execute '!echo -ne "\e[2 q"' | redraw!
  au InsertEnter,InsertChange *
        \ if v:insertmode == 'i' |
        \   silent execute '!echo -ne "\e[6 q"' | redraw! |
        \ elseif v:insertmode == 'r' |
        \   silent execute '!echo -ne "\e[4 q"' | redraw! |
        \ endif
  au VimLeave * silent execute '!echo -ne "\e[ q"' | redraw!
endif
