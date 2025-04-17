" vim: set ts=2 sts=2 sw=2 expandtab tw=0 foldmethod=indent :

" |-- original --|-- pasted after C   --|-- pasted before C  --|-- pasted replacing C --|
" |--------------|----------------------------------------------------------------------|
" |--          --|-- yank/copy '_s_'  --|-- yank/copy '_s_'  --|-- yank/copy '_s_'    --|
" |--          --|-- select C column  --|-- select B column  --|-- select C column    --|   --> step 0 (after copy/yank a string)
" |--          --|-- press <leader>py --|-- press <leader>py --|-- press p            --|   --> step 1 if yanked
" |--          --|-- press <leader>pc --|-- press <leader>pc --|-- press "+p          --|   --> step 1 if copied to clipboard
"       ABCD              ABC_s_D               AB_s_CD                 AB_s_D
"       ABCD              ABC_s_D               AB_s_CD                 AB_s_D
"       ABCD              ABC_s_D               AB_s_CD                 AB_s_D
xnoremap <leader>py A<C-r>*<Esc>
xnoremap <leader>pc A<C-r>+<Esc>
"
" Note
"   - we can also paste string after/before a column:   select the column/s, press 'I' or 'A' and the text to add (and <Esc>) (not 'i' nor 'a' !!!)
"   - we can also paste string replacing    a column/s: select the column/s, press 'c' or 's' and the text to add (and <Esc>)
"                                                                            press 'r' and the unique char to substitute all selected
"                                                                            press 'x' or 'd' to just delete all selected (later paste-able)
" To paste column/s:
" |-- original  --|-- columns   --|-- pasted after C   --|-- pasted before C  --|-- pasted replacing C --|
" |-- to modify --|-- to paste  --|--                  --|--                  --|--                    --|
" |---------------|---------------|----------------------------------------------------------------------|
" |--           --|--           --|-- in block mode:   --|-- in block mode:   --|-- in block mode:     --|
" |--           --|--           --|-- yank/copy COLUMN --|-- yank/copy COLUMN --|-- yank/copy COLUMN   --|
" |--           --|--           --|-- cursos over 1st C--|-- cursos over 1st C--|-- select C column    --|   --> step 0 (after copy/yank in x-mode a column)
" |--           --|--           --|-- press p          --|-- press P          --|-- press p   (or P)   --|   --> step 1 if yanked
" |--           --|--           --|-- press "+p        --|-- press "+P        --|-- press "+p (or "+P) --|   --> step 1 if copied to clipboard
"       ABCD             _0_               ABC_0_D                  AB_0_CD                 AB_0_D
"       ABCD             _1_               ABC_1_D                  AB_1_CD                 AB_1_D
"       ABCD             _2_               ABC_2_D                  AB_2_CD                 AB_2_D
