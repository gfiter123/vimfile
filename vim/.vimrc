"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 通用设置
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let mapleader = " "      " 定义<leader>键
set nocompatible         " 设置不兼容原始vi模式
filetype on              " 设置开启文件类型侦测
filetype plugin on       " 设置加载对应文件类型的插件
set noeb                 " 关闭错误的提示
syntax enable            " 开启语法高亮功能
syntax on                " 自动语法高亮
set t_Co=256             " 开启256色支持
"set term=screen-256color
set term=xterm-256color
set cmdheight=1          " 设置命令行的高度
set showcmd              " select模式下显示选中的行数
set ruler                " 总是显示光标位置
set laststatus=2         " 总是显示状态栏
set number               " 开启行号显示
set relativenumber      " 显示光标所在的当前行的行号，其他行都为相对于该  行的相对行号
set wrap                "自动折行
set wrapmargin=2        "自动折行右边空格
"set linebreak           "遇到空格才折行
set cursorline           " 高亮显示当前行
set whichwrap+=<,>,h,l   " 设置光标键跨行
set ttimeoutlen=0        " 设置<ESC>键响应时间
set virtualedit=block,onemore   " 允许光标出现在最后一个字符的后面
set history=8192			      " 设置历史记录条数
"共享剪贴板使用vim --version |grep clipboard查看是否支持
"如果不支持,sudo apt install vim-gtk
set clipboard+=unnamed       
"set mouse=a               "使用鼠标

set report=0        " 带有如下符号的单词不要被换行分割
set fillchars=vert:\ ,stl:\ ,stlnc:\  " 在被分割的窗口间显示空白，便于阅读
set showmatch    "高亮括号对
set matchtime=1     "高亮显示时间

"let &t_ut=''		          " 解决终端颜色配置的一些问题
set list		            " 显示空格
set listchars=tab:▸\ ,trail:▫
set iskeyword+=_,$,@,%,#,-   " 带有如下符号的单词不要被换行分割
" save read-only files 以:Sudow保存只读文件 
command -nargs=0 Sudow w !sudo tee % >/dev/null
"make 运行
:set makeprg=g++\ -Wall\ \ %

" 是否显示状态栏。0 表示不显示，1 表示只在多窗口时显示，2 表示显示
set laststatus=2
set statusline=%F%m%r%h%w\ [POS=%l,%v][%p%%]\ %{strftime(\"%d/%m/%y\ -\ %H:%M\")}


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 代码缩进和排版
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set autoindent           " 设置自动缩进
set cindent              " 设置使用C/C++语言的自动缩进方式
set cinoptions=g0,:0,N-s,(0    " 设置C/C++语言的具体缩进方式
set smartindent          " 智能的选择对其方式
filetype indent on       " 自适应不同语言的智能缩进
filetype plugin on       " 载入文件类型插件
set expandtab            " 将制表符扩展为空格
set tabstop=2            " 设置编辑时制表符占用空格数
set shiftwidth=2         " 设置格式化时制表符占用空格数
set softtabstop=2        " 设置4个空格为制表符
set smarttab             " 在行和段开始处使用制表符
set backspace=2          " 使用回车键正常处理indent,eol,start等
set sidescroll=10        " 设置向右滚动字符数
set scrolloff=5
set tw=0
set indentexpr=
set backspace=indent,eol,start            "退格键 实现光标移动到行尾

"以下三行可以使vim的光标在普通模式和写入模式下有不同的光标样式
let &t_SI.="\e[5 q" "SI = INSERT mode
let &t_SR.="\e[4 q" "SR = REPLACE mode
let &t_EI.="\e[1 q" "EI = NORMAL mode (ELSE)
"Cursor settings:
"  1 -> blinking block
"  2 -> solid block
"  3 -> blinking underscore
"  4 -> solid underscore
"  5 -> blinking vertical bar
"  6 -> solid vertical bar
"let &t_SI = "\<Esc>]50;CursorShape=1\x7"
"let &t_SR = "\<Esc>]50;CursorShape=2\x7"
"let &t_EI = "\<Esc>]50;CursorShape=0\x7"



set laststatus=2
set nobackup
set cmdheight=2
" 自动切换工作目录。这主要用在一个 Vim 会话之中打开多个文件的情况，默认的工作目录是打开的第一个文件的目录。
" 该配置可以将工作目录自动切换到，正在编辑的文件的目录
"set autochdir
"第二次打开文件时，光标回到上次编辑位置
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 快速移动
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" better up/down
noremap <silent> <expr> j (v:count == 0 ? 'gj' : 'j')
noremap <silent> <expr> k (v:count == 0 ? 'gk' : 'k')

"-- quick movement
noremap J 5j
nnoremap K 5k
nnoremap H 0
nnoremap L $

nnoremap dL d$
nnoremap dH d0

nnoremap Q :q!<enter>
nnoremap < <<
nnoremap > >>

map s <nop>
map <c-s> :w<CR>
nmap <leader>w :w!<cr>
nmap <leader>f :find<cr>
map R :source $MYVIMRC<CR>
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 搜索+为下一个,-为上一个
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
noremap = nzz
noremap - Nzz
noremap <LEADER><CR> :nohlsearch<CR> "取消高亮
nmap Q :qa<CR>

" 映射全选+复制 ctrl+a
map <C-A> ggVG
map! <C-A> <Esc>ggVG
map <F12> gg=G

" 选中状态下 Ctrl+c 复制
vmap <C-c> "+y
vmap Y "+y
noremap Y "+yy
vmap p "_dP
"去空行
"nnoremap <F2> :%s/\s\+$//g<CR>
"nnoremap <F2> :g/^\s*$/d<CR>
"去M结尾
nnoremap <F2> :%s/\r//g<CR>

"比较文件
nnoremap <F3> :vert diffsplit
nnoremap <F4> :vert terminal<CR>
nnoremap <F6> :terminal<CR>
" 取消警告音
set noerrorbells visualbell t_vb=

"新建标签
map <M-F2> :tabnew<CR>



"C，C++ 按F5编译运行

map <F5> :call CompileRunGcc()<CR>
func! CompileRunGcc()
    exec "w"
    if &filetype == 'c'
        exec "!g++ % -o %<"
        exec "! ./%<"
    elseif &filetype == 'cpp'
        exec "!g++ % -o %<"
        exec "! ./%<"
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


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""实用设置
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" quickfix模式
autocmd FileType c, map <buffer> <leader><space> :w<cr>:make<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 设置分屏
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map sl :set splitright<CR>:vsplit<CR>
map sh :set nosplitright<CR>:vsplit<CR>
map sk :set nosplitbelow<CR>:split<CR>
map sj :set splitbelow<CR>:split<CR>
map <C-l> <C-w>l
map <C-k> <C-w>k
map <C-h> <C-w>h
map <C-j> <C-w>j
tnoremap <ESC> <c-\><c-n>
tnoremap <c-q> <c-w>:hide<cr>
tnoremap <C-l> <C-w>l
tnoremap <C-k> <C-w>k
tnoremap <C-h> <C-w>h
tnoremap <C-j> <C-w>j
map <up> :res +5<CR>
map <down> :res -5<CR>
map <left> :vertical resize-5<CR>
map <right> :vertical resize+5<CR>
map sv <C-w>t<C-w>H         "切换分屏为上下
map sh <C-w>t<C-w>K         "切换分屏为左右

" toggle relative numbering
nnoremap <LEADER><F1> :set rnu!<CR>
" open new split panes to right and bottom, which feels more natural
set splitbelow
set splitright

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 代码补全
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set wildmode=longest,list
set wildmenu             " vim自身命名行模式智能补全
"set completeopt-=preview " 补全时不显示窗口，只显示补全列表
set completeopt=preview,menu " 补全时不显示窗口，只显示补全列表
if &term =~ '^screen'
  " tmux knows the extended mouse mode
  set ttymouse=xterm2
endif
"折叠代码
set nofoldenable         " 禁用折叠代码
set foldmethod=indent                     "收代码
set foldlevel=99


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 搜索设置
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set hlsearch            " 高亮显示搜索结果
set incsearch           " 开启实时搜索功能
"set noignorecase        " 搜索时大小写不敏感
set ignorecase        " 搜索时大小写不敏感
set smartcase

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 缓存设置
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set nobackup            " 设置不备份
set noswapfile          " 禁止生成临时文件
set autoread            " 文件在vim之外修改过，自动重新读入
set autowrite           " 设置自动保存
set confirm             " 在处理未保存或只读文件的时候，弹出确认

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 编码设置
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set termencoding=utf-8
set fileencodings=utf8,ucs-bom,gbk,cp936,gb2312,gb18030


"关闭新行自动注释
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ssh复制模式
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function Copy()
  let c = join(v:event.regcontents,"\n")
  let c64 = system("base64", c)
  let s = "\e]52;c;" . trim(c64) . "\x07"
  call s:raw_echo(s)
endfunction

function! s:raw_echo(str)
  if has('win32') && has('nvim')
    call chansend(v:stderr, a:str)
  else
    if filewritable('/dev/fd/2')
      call writefile([a:str], '/dev/fd/2', 'b')
    else
      exec("silent! !echo " . shellescape(a:str))
      redraw!
    endif
  endif
endfunction

autocmd TextYankPost * call Copy()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 插件
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call plug#begin('~/.vim/plugged')

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'jlanzarotta/bufexplorer'
Plug 'connorholyday/vim-snazzy'
Plug 'rhysd/vim-clang-format'


" File navigation
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }	       " 在vim窗口的左边显示文件树
Plug 'Xuyuanp/nerdtree-git-plugin'

" Taglist
Plug 'majutsushi/tagbar', { 'on': 'TagbarOpenAutoClose' }

" 错误检查
Plug 'w0rp/ale'
"cpp 成员函数生成 <leader>PP 生成
Plug 'derekwyatt/vim-protodef'
Plug 'derekwyatt/vim-fswitch'
" Auto Complete
Plug 'ycm-core/YouCompleteMe'		       " 代码补全
Plug 'jiangmiao/auto-pairs'
Plug 'ludovicchabant/vim-gutentags'        "异步自动生成tags
Plug 'skywind3000/gutentags_plus'
Plug 'skywind3000/vim-preview'



"''
"还需要手动安装一下 才可以使用
"cd ~/.vim/plugged/YoucompleteMe/
"sudo python3 install.py
"./install.py --clang-completer
"或./install.py --cs-completer
"cp third/ycmd/examples/.ycm_extra_conf.py ~/.vim
"sudo apt install ctags cscope
"make tags cscope TAGS
"
"installing.....

Plug 'Lokaltog/vim-easymotion'

" Undo Tree
Plug 'mbbill/undotree'		" 以树形的方式浏览文件的修改历史

" Other visual enhancement
Plug 'nathanaelkane/vim-indent-guides' "显示缩进线
Plug 'itchyny/vim-cursorword'      "在当前光标的单词加下划线
Plug 'machakann/vim-highlightedyank' "高亮复制
Plug 'christoomey/vim-tmux-navigator'

" Git
""Plug 'rhysd/conflict-marker.vim'
""Plug 'tpope/vim-fugitive'
""Plug 'mhinz/vim-signify'
""Plug 'gisphm/vim-gitignore', { 'for': ['gitignore', 'vim-plug'] }


" Markdown在wsl中使用/etc/wsl.conf 
" [interop]
"enabled = true
"appendWindowsPath = true
"Plug 'iamcco/mathjax-support-for-mkdp'
"Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
""Plug 'dhruvasagar/vim-table-mode', { 'on': 'TableModeToggle' }

" Bookmark 此插件增强 Vim 的书签功能
" m/ 打开列表 :SignatureToggle 显示书签 :SignatureRefresh 刷新
Plug 'kshenoy/vim-signature'

" Other useful utilities
""Plug 'mg979/vim-visual-multi',{ 'branch':'master' } "多行编辑<C-n>选择单词，C-up,C-down上下，
Plug 'tpope/vim-surround' "文本添加ysiw( 括号,引号
Plug 'tpope/vim-repeat' "文本添加ysiw( 括号,引号
"Plug 'godlygeek/tabular' " :Tab/= 以=等号对对齐
"Plug 'gcmt/wildfire.vim' " 快速选择文本，在V模式下, 按i'选择''包含的文本,  i) i] i} ip
Plug 'tpope/vim-commentary' "gcc注释

" Dependencies
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'kana/vim-textobj-user'
Plug 'fadein/vim-FIGlet'
Plug 'Yggdroot/LeaderF', { 'do': ':LeaderfInstallCExtension' }
if !empty(glob("/mnt/c")) ||!empty(glob("/mnt/public")) 
Plug 'brglng/vim-im-select'
endif
Plug 'tmux-plugins/vim-tmux-focus-events'
Plug 'roxma/vim-tmux-clipboard'
Plug 'AndrewRadev/switch.vim'
call plug#end()


let g:SnazzyTransparent = 1
color snazzy

" ===
" === airline
" ===

let g:airline_theme="dark"
let ambiwidth=2                 "全角符号
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#tab_nr_type = 1 " tab number
let g:airline#extensions#tabline#show_tab_nr = 1
let g:airline#extensions#tabline#formatter = 'default'
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline#extensions#tabline#fnametruncate = 16
let g:airline#extensions#tabline#fnamecollapse = 2
let g:airline#extensions#tabline#buffer_idx_mode = 1
let g:airline#extensions#whitespace#enabled = 0
let g:airline#extensions#whitespace#symbol = '!'
nnoremap  <leader>0 :bl<cr>
nmap <leader>1 <Plug>AirlineSelectTab1
nmap <leader>2 <Plug>AirlineSelectTab2
nmap <leader>3 <Plug>AirlineSelectTab3
nmap <leader>4 <Plug>AirlineSelectTab4
nmap <leader>5 <Plug>AirlineSelectTab5
nmap <leader>6 <Plug>AirlineSelectTab6
nmap <leader>7 <Plug>AirlineSelectTab7
nmap <leader>8 <Plug>AirlineSelectTab8
nmap <leader>9 <Plug>AirlineSelectTab9
" 下一个buffer(循环)
nmap <C-n> :bn<CR>
imap <C-n> <Esc>:bn<CR>i
" 上一个buffer(循环)
nmap <C-p> :bp<CR>
imap <C-p> <Esc>:bp<CR>i
" 关闭当前buffer, 但是需要先将文件树关闭,否则会退出vim
nmap <Leader>bd :bd<CR>

""""""""""""""""""""""""""""""
" BufExplorer <leader>bs水平方面打开，<leader>bv左边，be,bt
""""""""""""""""""""""""""""""
let g:bufExplorerDefaultHelp=0       " Do not show default help.
let g:bufExplorerShowRelativePath=1  " Show relative paths.
let g:bufExplorerSortBy='mru'        " Sort by most recently used.
let g:bufExplorerSplitRight=0        " Split left.
let g:bufExplorerSplitVertical=1     " Split vertically.
let g:bufExplorerSplitVertSize = 30  " Split width
let g:bufExplorerUseCurrentWindow=1  " Open in new window.
let g:bufExplorerDisableDefaultKeyMapping =0 " Do not disable default key mappings.
nnoremap <silent> <Tab> :BufExplorer<CR>

" === NERDTree
" ===
map tt :NERDTreeToggle<CR>
map <leader>e :NERDTreeToggle<CR>
nnoremap <Leader>ee :NERDTreeFind<CR>
" Start NERDTree. If a file is specified, move the cursor to its window.
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * NERDTree | if argc() > 0 || exists("s:std_in") | wincmd p | endif
" Exit Vim if NERDTree is the only window remaining in the only tab.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
" Close the tab if NERDTree is the only window remaining in it.
autocmd BufEnter * if winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
" If another buffer tries to replace NERDTree, put it in the other window, and bring back NERDTree.
autocmd BufEnter * if bufname('#') =~ 'NERD_tree_\d\+' && bufname('%') !~ 'NERD_tree_\d\+' && winnr('$') > 1 |
      \ let buf=bufnr() | buffer# | execute "normal! \<C-W>w" | execute 'buffer'.buf | endif 
" Mirror the NERDTree before showing it. This makes it the same on all tabs.
nnoremap <leader>m :NERDTreeMirror<CR>:NERDTreeFocus<CR>
" Start NERDTree when Vim starts with a directory argument.
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists('s:std_in') |
    \ execute 'NERDTree' argv()[0] | wincmd p | enew | execute 'cd '.argv()[0] | endif 
" Start NERDTree, unless a file or session is specified, eg. vim -S session_file.vim.
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists('s:std_in') && v:this_session == '' | NERDTree | endif

let NERDTreeMapOpenExpl = ""
let NERDTreeMapUpdirKeepOpen = "l"
let NERDTreeMapOpenVSplit = "v"
let NERDTreeMapCloseDir = "n"
let NERDTreeMapChangeRoot = "y"
let NERDTreeCustomOpenArgs = {'file': {'reuse':'currenttab', 'where':'p', 'keepopen':1, 'stay':0}}




" ==
" == clang-format
" ==
let g:clang_format#command = 'clang-format'
nmap <F1> :ClangFormat<cr>
autocmd FileType c,cpp ClangFormatAutoEnable
let g:clang_format#detect_style_file = 1



" ==
" == NERDTree-git
" ==
let g:NERDTreeGitSatusIndicatorMapCustom = {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ "Unknown"   : "?"
    \ }



" ==
" == gutentags
" ==
"
" gutentags搜索工程目录的标志，碰到这些文件/目录名就停止向上一级目录递归 "
let g:gutentags_project_root = ['.root', '.svn', '.git', '.project']
" 所生成的数据文件的名称 "
let g:gutentags_ctags_tagfile = '.tags'
" enable gtags module
let g:gutentags_modules = ['ctags', 'gtags_cscope']
" 将自动生成的 tags 文件全部放入 ~/.cache/tags 目录中，避免污染工程目录 "
let s:vim_tags = expand('~/.cache/tags')
let g:gutentags_cache_dir = s:vim_tags
" 检测 ~/.cache/tags 不存在就新建 "
if !isdirectory(s:vim_tags)
   silent! call mkdir(s:vim_tags, 'p')
endif

let g:gutentags_plus_switch = 1
let g:gutentags_define_advanced_commands = 1

" 配置 ctags 的参数 "
let g:gutentags_ctags_extra_args = ['--fields=+niazS', '--extra=+q']
let g:gutentags_ctags_extra_args += ['--c++-kinds=+pxI']
let g:gutentags_ctags_extra_args += ['--c-kinds=+px']
let g:gutentags_ctags_extra_args += ['--output-format=e-ctags']
noremap <m-u> :PreviewScroll -1<cr>
noremap <m-d> :PreviewScroll +1<cr>
inoremap <m-u> <c-\><c-o>:PreviewScroll -1<cr>
inoremap <m-d> <c-\><c-o>:PreviewScroll +1<cr>
autocmd FileType qf nnoremap <silent><buffer> p :PreviewQuickfix<cr>
autocmd FileType qf nnoremap <silent><buffer> P :PreviewClose<cr>
"
" 'derekwyatt/vim-protodef' 先复到剪切板再用<leader>PP生成定义
" 'derekwyatt/vim-fswitch'<leader>of 
nmap <silent> <Leader>of :FSHere<cr>
nmap <silent> <A-o> :FSHere<cr>
:let b:fswitchdst = 'cpp,cxx,C,cc'
":let b:fswitchlocs = '../src,../source'
" 设置 pullproto.pl 脚本路径
let g:protodefprotogetter='~/.vim/plugged/vim-protodef/pullproto.pl'
" 成员函数的实现顺序与声明顺序一致
let g:disable_protodef_sorting=1

" ===
" === You Complete ME
" ===
nnoremap gd :YcmCompleter GoToDefinitionElseDeclaration<CR>
"nnoremap gd :YcmCompleter GoToImplementationElseDeclaration<CR>
nnoremap gD :YcmCompleter GoToDeclaration<CR>
nnoremap gh :YcmCompleter GetDoc<CR>
nnoremap gt :YcmCompleter GetType<CR>
nnoremap gr :YcmCompleter GoToReferences<CR>
nnoremap gs :YcmCompleter GoToSymbol<CR>
let g:ycm_server_python_interpreter='/usr/bin/python3'
let g:ycm_add_preview_to_completeopt = 0
let g:ycm_server_log_level = 'info'
let g:ycm_min_num_identifier_candidate_chars = 2
let g:ycm_collect_identifiers_from_comments_and_strings = 0
let g:ycm_complete_in_strings=1
highlight PMenu ctermfg=0 ctermbg=242 guifg=black guibg=darkgrey
let g:ycm_semantic_triggers =  {
                        \ 'c,cpp,python,java,go,erlang,perl': ['re!\w{2}'],
                        \ 'cs,lua,javascript': ['re!\w{2}'],
                        \ }
let g:ycm_global_ycm_extra_conf= "~/.vim/.ycm_extra_conf.py"
let g:ycm_collect_identifiers_from_tags_files=1
""2个字符后罗列匹配
let g:ycm_min_num_of_chars_for_completion=2
""启用ultisnips补全，1代表允许
let g:ycm_use_ultisnips_completer = 1
""设置使用goto跳转快捷键时，新窗口的打开方式可以设置为’same-buffer’,
""‘horizontal-split’, ‘vertical-split’, 'new-tab’或 ‘new-or-existing-tab’
let g:ycm_goto_buffer_command = 'same-buffer'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"其他东东
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" minibufexpl插件的一般设置
let g:miniBufExplMapWindowNavVim = 1
let g:miniBufExplMapWindowNavArrows = 1
let g:miniBufExplMapCTabSwitchBufs = 1
let g:miniBufExplModSelTarget = 1

" ===
" === ale
" ===
"使用clang对c和c++进行语法检查，对python使用pylint进行语法检查
let g:ale_linters = {
\   'c++': ['clang'],
\   'c': ['clang'],
\   'python': ['pylint'],
\}
"let b:ale_fixers = ['autopep8', 'yapf']
"始终开启标志列
let g:ale_sign_column_always = 1
let g:ale_set_highlights = 0
"自定义error和warning图标
let g:ale_sign_error = '✗'
let g:ale_sign_warning = '⚡'
"在vim自带的状态栏中整合ale
let g:ale_statusline_format = ['✗ %d', '⚡ %d', '✔ OK']
"显示Linter名称,出错或警告等相关信息
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
"普通模式下，sp前往上一个错误或警告，sn前往下一个错误或警告
nmap sp <Plug>(ale_previous_wrap)
nmap sn <Plug>(ale_next_wrap)
"<Leader>s触发/关闭语法检查
nmap <Leader>s :ALEToggle<CR>
"<Leader>d查看错误或警告的详细信息
nmap <Leader>d :ALEDetail<CR>

" ===
" === Taglist
" ===
map <silent> T :TagbarOpenAutoClose<CR>


" ===
" === MarkdownPreview
" ===
"let g:mkdp_auto_start = 0
"let g:mkdp_auto_close = 1
"let g:mkdp_refresh_slow = 0
"let g:mkdp_command_for_global = 0
"let g:mkdp_open_to_the_world = 1
"let g:mkdp_open_ip = ''
"let g:mkdp_browser = 'msedge'
"let g:mkdp_echo_preview_url = 1
"let g:mkdp_browserfunc = ''
"let g:mkdp_preview_options = {
    "\ 'mkit': {},
    "\ 'katex': {},
    "\ 'uml': {},
    "\ 'maid': {},
    "\ 'disable_sync_scroll': 0,
    "\ 'sync_scroll_type': 'middle',
    "\ 'hide_yaml_meta': 1
    "\ }
"let g:mkdp_markdown_css = ''
"let g:mkdp_highlight_css = ''
"let g:mkdp_port = '9438'
"let g:mkdp_page_title = '「${name}」'
"nmap <silent> <F8> <Plug>MarkdownPreview        " 普通模式
"imap <silent> <F8> <Plug>MarkdownPreview        " 插入模式
"nmap <silent> <F9> <Plug>StopMarkdownPreview    " 普通模式
"imap <silent> <F9> <Plug>StopMarkdownPreview    " 插入模式

" ===
" === vim-table-mode
" ===
map <LEADER>tm :TableModeToggle<CR>

" ===
" === Python-syntax
" ===
"let g:python_highlight_all = 1
" let g:python_slow_sync = 0


" ===
" === vim-indent-guide 显示缩进线
 " ===
let g:indent_guides_guide_size = 1
let g:indent_guides_start_level = 2
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_color_change_percent = 1
silent! unmap <LEADER>ig
autocmd WinEnter * silent! unmap <LEADER>ig


" ===
" === vim-signiture
" ===
let g:SignatureMap = {
        \ 'Leader'             :  "m",
        \ 'PlaceNextMark'      :  "m,",
        \ 'ToggleMarkAtLine'   :  "m.",
        \ 'PurgeMarksAtLine'   :  "dm-",
        \ 'DeleteMark'         :  "dm",
        \ 'PurgeMarks'         :  "dm/",
        \ 'PurgeMarkers'       :  "dm?",
        \ 'GotoNextLineAlpha'  :  "m<LEADER>",
        \ 'GotoPrevLineAlpha'  :  "",
        \ 'GotoNextSpotAlpha'  :  "m<LEADER>",
        \ 'GotoPrevSpotAlpha'  :  "",
        \ 'GotoNextLineByPos'  :  "",
        \ 'GotoPrevLineByPos'  :  "",
        \ 'GotoNextSpotByPos'  :  "mn",
        \ 'GotoPrevSpotByPos'  :  "mp",
        \ 'GotoNextMarker'     :  "",
        \ 'GotoPrevMarker'     :  "",
        \ 'GotoNextMarkerAny'  :  "",
        \ 'GotoPrevMarkerAny'  :  "",
        \ 'ListLocalMarks'     :  "m/",
        \ 'ListLocalMarkers'   :  "m?"
        \ }

" ===
" === Undotree 撤消
" ===
"let g:undotree_DiffAutoOpen = 0
map U :UndotreeToggle<CR>
set undodir=~/.undodir/vim
set undofile




"""""""""""""""""""""""""""""LeaderF settings"""""""""""""""""""""{{
" 工作项目比较大，在查找文件名时开启缓存，用F5刷新
let g:Lf_UseCache = 1

" 禁止缓存索引
let g:Lf_UseMemoryCache = 0

" 这行配置让Leaderf跳转时在当前tabpage中开启新窗口而非复用已有窗口，由于我使用bufferline插件，因此不需要此配置
" let g:Lf_JumpToExistingWindow = 0

" 查找时忽略以下目录和文件
let g:Lf_WildIgnore = {
  \ 'dir': ['.git', '.svn','.cache','__pycache__', '.DS_Store'],
  \ 'file': ['*.exe', '*.dll', '*.so', '*.o', '*.pyc', '*.jpg', '*.png',
  \ '*.gif', '*.svg', '*.ico', '*.db', '*.tgz', '*.tar.gz', '*.gz',
  \ '*.zip', '*.bin', '*.pptx', '*.xlsx', '*.docx', '*.pdf', '*.tmp',
  \ '*.wmv', '*.mkv', '*.mp4', '*.rmvb', '*.ttf', '*.ttc', '*.otf',
  \ '*.mp3', '*.aac', '*.orig', '*.min.*']
  \}

" 默认rg参数
let g:Lf_RgConfig = [
      \"--glob=!tags",
      \"--glob=!tags.*"
      \]

" 将最后一次查找的正则表达式保持到r寄存器中
let g:Lf_RgStorePattern = "r"

" 默认使用正则模式
let g:Lf_DefaultMode = 'Regex'

" 增加【最近使用】文件列表（Most Recent Used）的容量 
let g:Lf_MruMaxFiles = 9999

" Do not use version control tool to list files under a directory since
" submodules are not searched by default.
let g:Lf_UseVersionControlTool = 0

" 使用rg作为默认外部搜索工具
let g:Lf_DefaultExternalTool = "rg"

" 显示隐藏文件
let g:Lf_ShowHidden = 1

" 在弹出窗口中预览
let g:Lf_PreviewInPopup = 1

" 禁用默认搜索快捷键
"let g:Lf_ShortcutF = ''
"let g:Lf_ShortcutB = ''

" 使用当前工作目录（pwd）作为搜索根目录，以便我能掌控搜索范围
let g:Lf_WorkingDirectoryMode = 'c'

" 快捷键映射

" 搜索项目文件名
nnoremap <leader>ff :LeaderfFile<CR>

" 在项目中搜索光标所在单词
nnoremap <leader>fg :<c-u><c-r>=printf("Leaderf! rg --regexMode -F -e %s", expand("<cword>"))<cr><cr>
" 在项目中搜索光标所在单词
xnoremap <leader>fg :<c-u><c-r>=printf("Leaderf! rg --regexMode -F -e %s", leaderf#Rg#visual())<cr><cr>
" 使用光标所在单词生成搜索命令（但不执行，可先修改再执行）
"nnoremap <leader>fg :<c-u><c-r>=printf("Leaderf! rg --regexMode -e \"%s\"", expand("<cword>"))<cr><left><c-f>0f"l
"xnoremap <leader>fg :<c-u><c-r>=printf("Leaderf! rg --regexMode -e %s", leaderf#Rg#visual())<cr><left><c-f>0f"l

" 生成空的项目内搜索命令（自行输入关键字执行）
nnoremap <leader>fs :<c-u><c-r>=printf("Leaderf rg --regexMode --stayOpen -e \"\"")<cr><left>
xnoremap <leader>fs :<c-u><c-r>=printf("Leaderf! rg --regexMode -e %s", leaderf#Rg#visual())<cr><left><c-f>0f"l

" 重新唤出搜索结果窗口
nnoremap <leader>fjk :<c-u>Leaderf! rg --recall<cr>
nmap <leader>fkj <leader>fjk

" 搜索buffer名称
nnoremap <leader>fbn :<c-u>Leaderf! buffer<cr>:setl nowrap<cr>

" 在当前buffer中搜索光标所在单词（显示匹配结果列表）
nnoremap <leader>fb :<c-u><c-r>=printf("Leaderf line --stayOpen --regexMode --input %s", expand("<cword>"))<cr><cr>
" 在当前buffer中搜索选中内容（显示匹配结果列表）
xnoremap <leader>fb :<c-u><c-r>=printf("Leaderf line --stayOpen --regexMode --input %s", leaderf#Rg#visual())<cr><cr>
" 生成空的buffer内搜索命令（自行输入关键字执行）
nnoremap <leader>fbe :<c-u>Leaderf line --regexMode --input<space>''<left>
xnoremap <leader>fbe  :<c-u><c-r>=printf("Leaderf line --stayOpen --regexMode --input \"%s\" ", leaderf#Rg#visual())<cr>
" 重新唤出buffer内搜索结果窗口
nnoremap <leader>fbb :<c-u>Leaderf! line --recall<cr>

" 搜索vim命令历史
nnoremap <leader>fh :<c-u>Leaderf cmdHistory --fuzzy<cr>
" 搜索vim内部搜索关键字历史
nnoremap <leader>fh/ :<c-u>Leaderf searchHistory --fuzzy<cr>

"【最近使用】文件列表
nnoremap <leader>fr  :<c-u>Leaderf! mru<cr>:setl nowrap<cr>
"}}


"=====
"im-select   WSL
"im-select.exe 下载地址：https://github.com/daipeihust/im-select/raw/master/win/out/x86/im-select.exe
"mac端下载地址 brew install im-select或curl -Ls https://raw.githubusercontent.com/daipeihust/im-select/master/install_mac.sh | sh

"====
"WSL
if !empty(glob("/mnt/c"))
let g:im_select_command = "/mnt/e/Software/im-select/im-select.exe"
let g:im_select_default = "1033"
let g:im_select_enable_focus_events = 0
"退出插入模式时自动切换英文输入法
autocmd InsertLeave * :silent !/mnt/e/Software/im-select/im-select.exe 1033
elseif !empty(glob("/mnt/public"))
"ibus
autocmd InsertLeave * :silent !/usr/bin/ibus engine xkb:us::eng 
autocmd BufCreate * :silent !/usr/bin/ibus engine xkb:us::eng 
autocmd BufEnter * :silent !/usr/bin/ibus engine xkb:us::eng 
autocmd BufLeave * :silent !/usr/bin/ibus engine xkb:us::eng 
endif

nnoremap ;s :Switch<CR>
let g:switch_custom_definitions =
\[
\	switch#NormalizedCase([ 'true', 'false']),
\		switch#NormalizedCase([ 'on', 'off' ]),
\		switch#NormalizedCase([ 'yes', 'no' ]),
\		switch#NormalizedCase([ 'disable', 'enable' ]),
\		switch#NormalizedCase([ 'up', 'down' ]),
\		switch#NormalizedCase([ 'top', 'bottom' ]),
\		switch#NormalizedCase([ 'left', 'right' ]),
\		switch#NormalizedCase([ '+', '-' ]),
\		switch#NormalizedCase([ '>', '<' ]),
\		switch#NormalizedCase([ '>=', '<=' ]),
\		switch#NormalizedCase([ '==', '!=' ]),
\		switch#NormalizedCase([ '&&', '||' ]),
\		switch#NormalizedCase([ 'push', 'pop' ]),
\	]
"驼峰和下划线切换
let b:switch_custom_definitions = [
      \   {
      \     '\<[a-z0-9]\+_\k\+\>': {
      \       '_\(.\)': '\U\1'
      \     },
      \     '\<[a-z0-9]\+[A-Z]\k\+\>': {
      \       '\([A-Z]\)': '_\l\1'
      \     },
      \   }
      \ ]
" Add header comment for bash shell and python file automatically.
autocmd BufNewFile *.sh,*.py,*.h,*.c,*.cpp exec ":call SetTitle()"
func SetTitle()
if expand("%:e") == 'sh'
 call setline(1,"#!/bin/bash")
 call setline(2,"#")
 call setline(3,"#**************************************************")
 call setline(4,"# Author:         xuhong                          *")
 call setline(5,"# E-mail:         zaitianya999@163.com            *")
 call setline(6,"# Date:           ".strftime("%Y-%m-%d"). "                      *")
 call setline(7,"# Description:                              *")
 call setline(8,"# Copyright ".strftime("%Y"). " by Vedkang.com Rights Reserved  *")
 call setline(9,"#**************************************************")
 call setline(10,"")
 call setline(11,"")
endif
if expand("%:e") == 'py'
    " call setline(1, "\#!/usr/bin/env python")
    " call append(1, "\# encoding: utf-8")
    call setline(1, "\# -*- coding: utf-8 -*-")
    normal G
    normal o
    normal o
endif

if expand("%:e") == 'h'
 call setline(1,"")
 call setline(2,"")
 call setline(3,"/*#**************************************************")
 call setline(4,"** Author:         xuhong                          *")
 call setline(5,"** E-mail:         zaitianya999@163.com            *")
 call setline(6,"** Date:           ".strftime("%Y-%m-%d"). "                      *")
 call setline(7,"** Description:                              *")
 call setline(8,"** Copyright ".strftime("%Y"). " by Vedkang.com Rights Reserved  *")
 call setline(9,"****************************************************/")
 call setline(10,"")
 call setline(11,"")
 call setline(12,"#program once")
endif

if expand("%:e") == 'c'
 call setline(1,"")
 call setline(2,"")
 call setline(3,"/*#**************************************************")
 call setline(4,"** Author:         xuhong                          *")
 call setline(5,"** E-mail:         zaitianya999@163.com            *")
 call setline(6,"** Date:           ".strftime("%Y-%m-%d"). "                      *")
 call setline(7,"** Description:                              *")
 call setline(8,"** Copyright ".strftime("%Y"). " by Vedkang.com Rights Reserved  *")
 call setline(9,"****************************************************/")
 call setline(10,"")
 call setline(11,"")
endif

if expand("%:e") == 'cpp'
 call setline(1,"")
 call setline(2,"")
 call setline(3,"/*#**************************************************")
 call setline(4,"** Author:         xuhong                          *")
 call setline(5,"** E-mail:         zaitianya999@163.com            *")
 call setline(6,"** Date:           ".strftime("%Y-%m-%d"). "                      *")
 call setline(7,"** Description:                              *")
 call setline(8,"** Copyright ".strftime("%Y"). " by Vedkang.com Rights Reserved  *")
 call setline(9,"****************************************************/")
 call setline(10,"")
 call setline(11,"")
endif

endfunc
autocmd BufNewFile * normal G
