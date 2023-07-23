
"C，C++ 按F5编译运行

map <F7> :call CompileRunGcc()<CR>
func! CompileRunGcc()
    exec "w"
    if &filetype == 'c'
        exec "!g++ % -o %<"
        exec "! ./%<"
    elseif &filetype == 'cpp'
        set makeprg=./build/buildarm.sh
        exec "make"
        " exec "copen"
        " exec "!g++ % -o %<"
        " exec "! ./%<"
    elseif &filetype == 'java'
        exec "!c %"
        exec "! %<"
    elseif &filetype == 'sh'
        :!./%
    endif
endfunc

"C,C++的调试
map <F8> :call Rungdb()<CR>
func! Rungdb()
    exec "w"
    exec "!g++ % -g -o %<"
    exec "!gdb ./%<"
endfunc


