" vim: set ts=2 sts=2 sw=2 expandtab tw=0 foldmethod=indent :

" The map that loads content of search register is very usefull...
" to replace what searching patterns matchs you desired find (dealing with hard RegExpr).
" Note actually, if searching is blank, then it autoload the search register
"  i.e. these 2 cmds are equivalents:
"   :%s//replStr/g       " note blank search RegExpr
"   :%s/<C-r>//replStr/g " Remember <C-r> is for mappings, in ex mode should be @/ (or @a for register a)

" yanked/copied
nnoremap @@<leader>r+ <Esc>:%s/<C-r>+/<C-r>+/g<Left><Left>
nnoremap @@<leader>r* <Esc>:%s/<C-r>*/<C-r>*/g<Left><Left>
" last searched
nnoremap @@<leader>r/ <Esc>:%s/<C-r>//<C-r>//g<Left><Left>
" last yanked text
nnoremap @@<leader>r0 <Esc>:%s/<C-r>0/<C-r>0/g<Left><Left>
" last text deleted (in order)
nnoremap @@<leader>r1 <Esc>:%s/<C-r>1/<C-r>1/g<Left><Left>
nnoremap @@<leader>r2 <Esc>:%s/<C-r>2/<C-r>2/g<Left><Left>
nnoremap @@<leader>r3 <Esc>:%s/<C-r>3/<C-r>3/g<Left><Left>
nnoremap @@<leader>r4 <Esc>:%s/<C-r>4/<C-r>4/g<Left><Left>
nnoremap @@<leader>r5 <Esc>:%s/<C-r>5/<C-r>5/g<Left><Left>
nnoremap @@<leader>r6 <Esc>:%s/<C-r>6/<C-r>6/g<Left><Left>
nnoremap @@<leader>r7 <Esc>:%s/<C-r>7/<C-r>7/g<Left><Left>
nnoremap @@<leader>r8 <Esc>:%s/<C-r>8/<C-r>8/g<Left><Left>
nnoremap @@<leader>r9 <Esc>:%s/<C-r>9/<C-r>9/g<Left><Left>
" last inserted text
nnoremap @@<leader>r. <Esc>:%s/<C-r>./<C-r>./g<Left><Left>
" [a-z] registers
nnoremap @@<leader>ra <Esc>:%s/<C-r>a/<C-r>a/g<Left><Left>
nnoremap @@<leader>rb <Esc>:%s/<C-r>b/<C-r>b/g<Left><Left>
nnoremap @@<leader>rc <Esc>:%s/<C-r>c/<C-r>c/g<Left><Left>
nnoremap @@<leader>rd <Esc>:%s/<C-r>d/<C-r>d/g<Left><Left>
nnoremap @@<leader>re <Esc>:%s/<C-r>e/<C-r>e/g<Left><Left>
nnoremap @@<leader>rf <Esc>:%s/<C-r>f/<C-r>f/g<Left><Left>
nnoremap @@<leader>rg <Esc>:%s/<C-r>g/<C-r>g/g<Left><Left>
nnoremap @@<leader>rh <Esc>:%s/<C-r>h/<C-r>h/g<Left><Left>
nnoremap @@<leader>ri <Esc>:%s/<C-r>i/<C-r>i/g<Left><Left>
nnoremap @@<leader>rj <Esc>:%s/<C-r>j/<C-r>j/g<Left><Left>
nnoremap @@<leader>rk <Esc>:%s/<C-r>k/<C-r>k/g<Left><Left>
nnoremap @@<leader>rl <Esc>:%s/<C-r>l/<C-r>l/g<Left><Left>
nnoremap @@<leader>rm <Esc>:%s/<C-r>m/<C-r>m/g<Left><Left>
nnoremap @@<leader>rn <Esc>:%s/<C-r>n/<C-r>n/g<Left><Left>
nnoremap @@<leader>ro <Esc>:%s/<C-r>o/<C-r>o/g<Left><Left>
nnoremap @@<leader>rp <Esc>:%s/<C-r>p/<C-r>p/g<Left><Left>
nnoremap @@<leader>rq <Esc>:%s/<C-r>q/<C-r>q/g<Left><Left>
nnoremap @@<leader>rr <Esc>:%s/<C-r>r/<C-r>r/g<Left><Left>
nnoremap @@<leader>rs <Esc>:%s/<C-r>s/<C-r>s/g<Left><Left>
nnoremap @@<leader>rt <Esc>:%s/<C-r>t/<C-r>t/g<Left><Left>
nnoremap @@<leader>ru <Esc>:%s/<C-r>u/<C-r>u/g<Left><Left>
nnoremap @@<leader>rv <Esc>:%s/<C-r>v/<C-r>v/g<Left><Left>
nnoremap @@<leader>rw <Esc>:%s/<C-r>w/<C-r>w/g<Left><Left>
nnoremap @@<leader>rx <Esc>:%s/<C-r>x/<C-r>x/g<Left><Left>
nnoremap @@<leader>ry <Esc>:%s/<C-r>y/<C-r>y/g<Left><Left>
nnoremap @@<leader>rz <Esc>:%s/<C-r>z/<C-r>z/g<Left><Left>
