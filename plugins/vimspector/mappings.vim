" vim: set ts=2 sts=2 sw=2 expandtab tw=0 foldmethod=indent :

" Check errors
nnoremap <leader>dlog :VimspectorToggleLog<CR>
" Debugger info
nnoremap <leader>dinfo :VimspectorDebugInfo<CR>

" JS, ts, NodeJS,... as server
au FileType javascript,html nnoremap <silent> <leader>server :!python3 -m http.server 8000

nnoremap <leader>dl!    :call vimspector#Launch()<CR>
nnoremap <leader>dR!    :call vimspector#Reset()<CR>

" 💾 Save/Load  ession
" https://github.com/puremourning/vimspector#save-and-restore
nnoremap <leader>dSl :let input = input("Load a vimspector session.  By default it loads the .vimspector.session file. Or set another file: ") \| execute 'VimspectorLoadSession' input<CR>
nnoremap <leader>dSw :let input = input("Write a vimspector session. By default it writes to .vimspector.session file. Or set another file: ") \| execute 'VimspectorMkSession' input<CR>

" 👀 Watcher
nnoremap <leader>dw :VimspectorWatch
vnoremap <leader>dw "*y<Esc>:VimspectorWatch <C-R>*<CR>

" ▷ CONTINUE when alreading debugging started. Otherwise START DEBUGGing
nnoremap <leader>dc :call vimspector#Continue()<CR>

" ⏹️ Stop debugging
nnoremap <leader>ds! :call vimspector#Stop()<CR>

" 🔄 Restart debugging with the same configuration
nnoremap <leader>dr :call vimspector#Restart()<CR>

" ⏸️ Pause debugee
nnoremap <leader>dP :call vimspector#Pause()<CR>

" 🛑 Toggle line breakpoint on the current line
nnoremap <leader>db :call vimspector#ToggleBreakpoint()<CR>

" 🛑 Toggle conditional line breakpoint on the current line
nnoremap <leader>dbc :call vimspector#ToggleConditionalBreakpoint()<CR>

" 🛑 Add a function breakpoint for the expression under cursor
nnoremap <leader>dbf :call vimspector#AddFunctionBreakpoint()<CR>

" 🛑🪟 Toogle vimspector.Breakpoints window
nnoremap <leader>dbw :VimspectorBreakpoints<CR>:call VimspectorWindowBreakpointsTips()<CR>

" Stepping
" ⏩ Step Over
nnoremap <leader>dso :call vimspector#StepOver()<CR>
" 🔽 Step Into
nnoremap <leader>ds :call vimspector#StepInto()<CR>
" 🔼 Step out of current function scope
nnoremap <leader>dsO :call vimspector#StepOut()<CR>

" 🏃💨📍 Run to Cursor
nnoremap <leader>drc :call vimspector#RunToCursor()<CR>

" 🤸📍 Jump to Current Line
nnoremap <leader>djc :call vimspector#GoToCurrentLine()<CR>
