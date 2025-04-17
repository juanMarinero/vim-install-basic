" vim: set ts=2 sts=2 sw=2 expandtab tw=0 :

" Find and cd into vim-install-basic* directory
let s:found_dir = ''
for s:dir in split(globpath($HOME, '**/vim-install-basic*/'), "\n")
    if isdirectory(s:dir)
        let s:found_dir = s:dir
        let g:vim_install_basic_dir = s:dir
        break
    endif
endfor
if !empty(s:found_dir)
    execute 'cd ' . fnameescape(s:found_dir)
    call system('echo "Changed Vim directory to: ' . s:found_dir . '"')
else
    echoerr 'Could not find vim-install-basic directory under $HOME!'
endif


source ./general/settings.vim
source ./general/mappings.vim


" 🔌 'vim-plug' a Vim plugin manager

let s:is_nvim = has('nvim')

" For Neovim: stdpath('data') is ~/.local/share/nvim
" For Vim: use ~/.vim_plugins
"   Not in ~/.vim but in ~/.vim_plugins. To later stow ~/.vim into a dotfiles repo
let s:plugin_home = s:is_nvim ? stdpath('data') : expand('~/.vim_plugins')
let s:plugged_dir = s:plugin_home . '/plugged'

" Ensure directories exist
let s:autoload_dir = s:plugin_home . '/autoload'
silent call mkdir(s:autoload_dir, 'p')
silent call mkdir(s:plugged_dir, 'p')

" Install vim-plug if not found
let s:plug_path = s:autoload_dir . '/plug.vim'
if empty(glob(s:plug_path))
  echo 'Installing vim-plug...'
  silent execute '!curl -fLo ' . s:plug_path . ' --create-dirs '
    \ . 'https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Load vim-plug
execute 'source ' . s:plug_path

" Initialize plugins
call plug#begin(s:plugged_dir)

Plug 'dense-analysis/ale'
source ./plugins/ale/settings.vim
source ./plugins/ale/mappings.vim

Plug 'neoclide/coc.nvim', { 'branch': 'master', 'do': 'npm ci' }
source ./plugins/coc.nvim/settings.vim
source ./plugins/coc.nvim/mappings.vim

Plug 'puremourning/vimspector'
source ./plugins/vimspector/settings.vim
source ./plugins/vimspector/mappings.vim

Plug 'sheerun/vim-polyglot'
source ./plugins/vim-polyglot/settings.vim

" Check if +termguicolors is supported
if has("termguicolors")
  Plug 'lifepillar/vim-solarized8'
  source ./plugins/vim-solarized8/settings.vim
  source ./plugins/vim-solarized8/mappings.vim
else
  Plug 'altercation/vim-colors-solarized'
  source ./plugins/vim-colors-solarized/settings.vim
  source ./plugins/vim-colors-solarized/mappings.vim
endif

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
source ./plugins/fzf.vim/settings.vim
source ./plugins/fzf.vim/mappings.vim

if has('nvim')
  Plug 'yuki-yano/fzf-preview.vim', { 'branch': 'release/remote', 'do': ':UpdateRemotePlugins' }
  " If error
  "  1. Run in terminal:     NVIM_PYTHON_LOG_FILE=/tmp/nvim_python.log nvim
  "  2. In NeoVim run:       :FzfPreviewProjectFiles
  "  3. In new terminal run: cat /tmp/nvim_python.log # check errors
else
  Plug 'yuki-yano/fzf-preview.vim', { 'branch': 'release/rpc' }
endif
source ./plugins/fzf-preview.vim/settings.vim
source ./plugins/fzf-preview.vim/mappings.vim

Plug 'ryanoasis/vim-devicons'
source ./plugins/vim-devicons/settings.vim

call plug#end()


" Set filetype for files with next specific extensions
autocmd BufEnter *.tsx,*.jsx,*.ts :setlocal filetype=javascript

" Set filetype for files containing a specific shebang
autocmd BufReadPost,BufNewFile * if getline(1) =~# '^#!.*/bin/env\s\+zsh\>' | setlocal filetype=sh  | endif
autocmd BufReadPost,BufNewFile * if getline(1) =~# '^#!.*/bin/env\s\+node\>' | setlocal filetype=js | endif

cd -
