"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" https://github.com/iceking2001/MyConfig/blob/master/_vimrc#L1419
" Maintainer: 
"       Amir Salihefendic
"       http://amix.dk - amix@amix.dk
"
" Version: 
"       6.0 - 01/04/17 14:24:34 
"
" Blog_post: 
"       http://amix.dk/blog/post/19691#The-ultimate-Vim-configuration-on-Github
"
" Awesome_version:
"       Get this config, nice color schemes and lots of plugins!
"
"       Install the awesome version from:
"
"           https://github.com/amix/vimrc
"
" Syntax_highlighted:
"       http://amix.dk/vim/vimrc.html
"
" Raw_version: 
"       http://amix.dk/vim/vimrc.txt
"
" Sections:
"    -> General
"    -> VIM user interface
"    -> Colors and Fonts
"    -> Files and backups
"    -> Text, tab and indent related
"    -> Visual mode related
"    -> Moving around, tabs and buffers
"    -> Status line
"    -> Editing mappings
"    -> vimgrep searching and cope displaying
"    -> Spell checking
"    -> Misc
"    -> Helper functions
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let os=substitute(system('uname'), '\n', '', '')
"set runtimepath+=~/.vim_runtime
set runtimepath+=~/.vim
"let macvim_skip_colorscheme=1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Sets how many lines of history VIM has to remember
set history=500

" Enable filetype plugins
filetype plugin on
filetype indent on

" Set to auto read when a file is changed from the outside
set autoread

" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
let mapleader = ","
let g:mapleader = ","

" Fast saving
nmap <leader>w :w!<cr>

" :W sudo saves the file 
" (useful for handling the permission-denied error)
"command W w !sudo tee % > /dev/null


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => VIM user interface
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Set 7 lines to the cursor - when moving vertically using j/k
set so=18

" Avoid garbled characters in Chinese language windows OS
"let $LANG='en' 
"set langmenu=en
"source $VIMRUNTIME/delmenu.vim
"source $VIMRUNTIME/menu.vim

" Turn on the WiLd menu
set wildmenu

" Ignore compiled files
set wildignore=*.o,*~,*.pyc,*.obj
if has("win16") || has("win32")
    set wildignore+=.git\*,.hg\*,.svn\*
else
    set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store
endif

"Always show current position
set ruler

" Height of the command bar
set cmdheight=2

" A buffer becomes hidden when it is abandoned
set hid "让一个buffer退到后台（即隐藏）是有条件的，要么1：buffer没有修改或者修改已经被保存，2：vim设置了hidden


" Configure backspace so it acts as it should act  使backspace正常处理indent, eol, start等
set backspace=eol,start,indent "等价于set backspace=2
set whichwrap+=<,>,h,l

" Ignore case when searching
set ignorecase

" When searching try to be smart about cases 
set smartcase

" Highlight search results
set hlsearch

" Makes search act like search in modern browsers
set incsearch 

" Don't redraw while executing macros (good performance config)
set lazyredraw 

" For regular expressions turn magic on
set magic

" Show matching brackets when text indicator is over them
set showmatch 
" How many tenths of a second to blink when matching brackets
set mat=2

" 任何时候都显示隐藏字符
set cocu=niv
" 在n模式下隐藏字符
"set cocu=n 
" No annoying sound on errors

set noerrorbells
"set novisualbell      " 不要闪烁
set t_vb= 
set timeoutlen=500  " 键间超时时间,默认1000ms

" Properly disable sound on errors on MacVim
if has("gui_macvim")
    autocmd GUIEnter * set vb t_vb=
endif


" Add a bit extra margin to the left
set foldcolumn=1


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors and Fonts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Enable syntax highlighting
syntax enable 

" Enable 256 colors palette in Gnome Terminal
if $COLORTERM == 'gnome-terminal'
    set t_Co=256
endif

" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf8
set termencoding=utf-8
set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1
set fileencoding=utf-8
set ambiwidth=double
set fileformats=unix,dos,mac     " Use Unix as the standard file type
set helplang=cn

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => GUI related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Set font according to system
if has("Darwin") || has("macunix")
    set guifont=IBM\ Plex\ Mono:h15,Hack:h15,Source\ Code\ Pro:h15,Menlo:h15
elseif has("win16") || has("win32")
    set guifont=IBM\ Plex\ Mono:h14,Source\ Code\ Pro:h12,Bitstream\ Vera\ Sans\ Mono:h11
elseif has("gui_gtk2")
    set guifont=IBM\ Plex\ Mono:h14,:Hack\ 14,Source\ Code\ Pro\ 12,Bitstream\ Vera\ Sans\ Mono\ 11
elseif has("linux")
    set guifont=IBM\ Plex\ Mono:h14,:Hack\ 14,Source\ Code\ Pro\ 12,Bitstream\ Vera\ Sans\ Mono\ 11
elseif has("unix")
    set guifont=Monospace\ 11
endif

" Set extra options when running in GUI mode
if has("gui_running")
    set guioptions-=T  "隐藏工具栏
    set guioptions-=e
    set t_Co=256
    set guitablabel=%M\ %t
endif

" Disable scrollbars (real hackers don't use scrollbars for navigation!)
set guioptions-=r
set guioptions-=R
set guioptions-=l
set guioptions-=L 

"colorscheme peaksea
colorscheme solarized
"colorscheme darkblue
"colorscheme desert
"colorscheme molokai
"colorscheme monokai
"colorscheme Tomorrow
"colorscheme zenburn


" Colorscheme
"try
"    "colorscheme solarized
"    if os == 'Darwin' || os == 'Mac'
"    augroup mycolor
"        au!
"        autocmd BufReadPost * colorscheme evening
"        autocmd BufReadPost * hi VertSplit guibg=#31312D guifg=#526A83 ctermfg=White ctermbg=Black term=none cterm=none gui=none
"    augroup END
"    else
"        colorscheme evening
"        autocmd BufReadPost * hi VertSplit guibg=#31312D guifg=#526A83 ctermfg=White ctermbg=Black term=none cterm=none gui=none
"    endif
"catch
"endtry

set background=dark
highlight Cursor guifg=white guibg=red

	
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => vim-indent-guides 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"let g:indent_guides_enable_on_vim_startup = 1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Files, backups and undo
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Turn backup off, since most stuff is in SVN, git et.c anyway...
set nobackup
set nowritebackup
set noswapfile
set noundofile


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, tab and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Use spaces instead of tabs
"set expandtab

" Be smart when using tabs ;)
set smarttab

" 1 tab == 4 spaces
set shiftwidth=4
set tabstop=4

" Linebreak on 500 characters
set linebreak       " set line brake on 
set textwidth=500

set ai "Auto indent
set si "Smart indent
set wrap "Wrap lines
set nu

nmap<leader>d "_d
nmap<leader>p "_p

""""""""""""""""""""""""""""""
" => Visual mode related
""""""""""""""""""""""""""""""
" Visual mode pressing * or # searches for the current selection
" Super useful! From an idea by Michael Naumann
vnoremap <silent> * :<C-u>call VisualSelection('', '')<CR>/<C-R>=@/<CR><CR>
vnoremap <silent> # :<C-u>call VisualSelection('', '')<CR>?<C-R>=@/<CR><CR>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Moving around, tabs, windows and buffers
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Disable highlight when <leader><cr> is pressed
map <silent> <leader><space> :noh<cr>

" Smart way to move between windows
nmap <C-j> <C-W>j
nmap <C-k> <C-W>k
nmap <C-h> <C-W>h
nmap <C-l> <C-W>l
nmap <Leader>rs :res -10<CR>        " resize        
nmap <leader>ra :res +10<CR>
nmap <Leader>vrs :vert res -10aCR>        " resize        
nmap <leader>vra :vert res +10<CR>

" Close the current buffer
map <leader>bd :Bclose<ar>:tabclose<cr>sT

" Close all the buffers
map <leader>ba :bufdo bd<cr>

map <leader>l :bn<cr>
map <leader>h :bp<cr>

" Useful mappings for managing tabs
map <leader>tn :tabnew<cr>
map <leader>to :tabonly<cr>
map <leader>tc :tabclose<cr>
map <leader>th :-tabnext<cr>
map <leader>tl :+tabnext<cr>
map <leader>tm :tabmove 
" Opens a new tab with the current buffer's path  Super useful when editing files in the same directory
map <leader>te :tabedit <c-r>=expand("%:p:h")<cr>/
map <leader>t<leader> :tabnext 
let g:lasttab = 1
nmap <Leader>ts :exe "tabn ".g:lasttab<CR>  " Let 'tl' toggle between this and the last accessed tab 在当前tab和上次访问的tab之间切换
au TabLeave * let g:lasttab = tabpagenr()

" Switch CWD to the directory of the open buffer
map <leader>cd :cd %:p:h<cr>:pwd<cr>

" Specify the behavior when switching between buffers 
try
  "set switchbuf=useopen,usetab,newtab		"这个注释打开了在quickfix搜的结果会启用新的tab显示，好烦的
  set showtabline=2         "总是显示tab标签 1: 大于两个tab时才显示 0: 不显示 
catch
endtry

" Return to last edit position when opening files (You want this!)
autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif


""""""""""""""""""""""""""""""
" => vim-header
""""""""""""""""""""""""""""""
"let g:header_field_author = 'boooble'
"let g:header_auto_add_header = 1
"let g:header_field_filename = 1
"let g:header_field_timestamp = 1
"let g:header_field_timestamp_format = '%Y.%m.%d'
""let g:header_field_author_email = 'booobleliu@tencent.com'
"map <leader>ih :AddHeader<CR>

""""""""""""""""""""""""""""""
" => vim-template
""""""""""""""""""""""""""""""
"g:templates_no_autocmd = 0
"g:username = boooble
"map <leader>ih :Template *.c<CR>


""""""""""""""""""""""""""""""
" => Status line
""""""""""""""""""""""""""""""
" Always show the status line
set laststatus=2

" Format the status line
"set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l\ \ Column:\ %c


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Editing mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Remap VIM 0 to first non-blank character
map 0 ^

" Move a line of text using ALT+[jk] or Command+[jk] on mac    不知道怎么用
"nmap <M-j> mz:m+<cr>`z
"nmap <M-k> mz:m-2<cr>`z
"vmap <M-j> :m'>+<cr>`<my`>mzgv`yo`z
"vmap <M-k> :m'<-2<cr>`>my`<mzgv`yo`z
"if has("Darwin") || has("macunix")
"  nmap <D-j> <M-j>
"  nmap <D-k> <M-k>
"  vmap <D-j> <M-j>
"  vmap <D-k> <M-k>
"endif


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Spell checking
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Pressing ,ss will toggle and untoggle spell checking
map <leader>ss :setlocal spell!<cr>

" Shortcuts using <leader>
map <leader>sn ]s
map <leader>sp [s
map <leader>sa zg
map <leader>s? z=

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => vimdiff
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nmap <Leader>df :vertical diffsplit<space>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => vim-rooter
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:rooter_change_directory_for_non_project_files = 'current'
let g:rooter_patterns = ['.project/', '.git/','.svn/', 'scp/']


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Misc
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Remove the Windows ^M - when the encodings gets messed up
noremap <Leader>m mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm

" Quickly open a buffer for scribble
map <leader>ob :e ~/buffer<cr>

" Quickly open a markdown buffer for scribble
map <leader>x :e ~/buffer.md<cr>

" Toggle paste mode on and off
map <leader>pp :setlocal paste!<cr>

" Don't close window, when deleting a buffer
command! Bclose call <SID>BufcloseCloseIt()

if has("autocmd")
    autocmd BufWritePre *.txt,*.js,*.py,*.wiki,*.sh,*.coffee :call CleanExtraSpaces()
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Helper functions
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

:nn <M-1> 1gt
:nn <M-2> 2gt
:nn <M-3> 3gt
:nn <M-4> 4gt
:nn <M-5> 5gt
:nn <M-6> 6gt
:nn <M-7> 7gt
:nn <M-8> 8gt
:nn <M-9> 9gt
:nn <M-0> :tablast<CR>

" Delete trailing white space on save, useful for some filetypes ;)
fun! CleanExtraSpaces()
    let save_cursor = getpos(".")
    let old_query = getreg('/')
    silent! %s/\s\+$//e
    call setpos('.', save_cursor)
    call setreg('/', old_query)
endfun


" Returns true if paste mode is enabled
function! HasPaste()
    if &paste
        return 'PASTE MODE  '
    endif
    return ''
endfunction

function! <SID>BufcloseCloseIt()
   let l:currentBufNum = bufnr("%")
   let l:alternateBufNum = bufnr("#")

   if buflisted(l:alternateBufNum)
     buffer #
   else
     bnext
   endif

   if bufnr("%") == l:currentBufNum
     new
   endif

   if buflisted(l:currentBufNum)
     execute("bdelete! ".l:currentBufNum)
   endif
endfunction

function! CmdLine(str)
    exe "menu Foo.Bar :" . a:str
    emenu Foo.Bar
    unmenu Foo
endfunction 

function! VisualSelection(direction, extra_filter) range
    let l:saved_reg = @"
    execute "normal! vgvy"

    let l:pattern = escape(@", "\\/.*'$^~[]")
    let l:pattern = substitute(l:pattern, "\n$", "", "")

    if a:direction == 'gv'
        call CmdLine("Ack '" . l:pattern . "' " )
    elseif a:direction == 'replace'
        call CmdLine("%s" . '/'. l:pattern . '/')
    endif

    let @/ = l:pattern
    let @" = l:saved_reg
endfunction


function! UpdateTagsAndCscope()
    if filereadable("cscope.out")
        silent cscope kill cscope.out
    endif

    if has("win16") || has("win32") || has("win64")
        "以下注释是在不断尝试中的改进，对于路径中的空格，有了不错的解决
        exec "silent !dir /b /s *.c *.cc *.cpp *.h *.s *.asm *.py *.js > cscope.files & " . $VIMRUNTIME . "\\ctags.exe -R --fields=+ianS --excmd=p --extra=+q --c++-kinds=+p --c-kinds=+p -L cscope.files & " . $VIMRUNTIME . "\\cscope.exe -Rbk -i cscope.files"
    else
        "以下注释是在不断尝试中的改进，对于路径中的空格，有了不错的解决
        :silent !find . -regex '.*\.c|.*\.C|.*\.cc\|.*\.cpp\|.*\.h\|.*\.s\|.*\.asm\|.*\.py\|.*\.js' | ls |sed "s:^:`pwd`/:" >cscope.out & "ctags" -R --fields=+ianS --excmd=p --extra=+q --c++-kinds=+p --c-kinds=+p -L cscope.out & "cscope" -Rbk
    endif

    if filereadable("cscope.out")
        silent cscope add cscope.out
    else  
        let cscope_file=findfile("cscope.out", ".;")  
        let cscope_pre=matchstr(cscope_file, ".*/")  
        if !empty(cscope_file) && filereadable(cscope_file)  
            exe "cs add" cscope_file cscope_pre  
        endif        
    endif  

    exec "UpdateTypesFile"
endfunction

function! UpdateTagsAndCscope2()
    let proj_path = FindRootDirectory()
    if !empty(proj_path)
        let proj_path = proj_path."/.project/"
        if isdirectory(proj_path)
            exec "cd ".proj_path
        endif
    endif

    if filereadable("cscope.out")
        silent cscope kill cscope.out
    endif

    if has("win16") || has("win32") || has("win64")
        "以下注释是在不断尝试中的改进，对于路径中的空格，有了不错的解决
        exec "silent !dir .. /b /s *.c *.cc *.cpp *.h *.s *.asm *.py *.js > cscope.files & " . $VIMRUNTIME . "\\ctags.exe -R --fields=+ianS --excmd=p --extra=+q --c++-kinds=+p --c-kinds=+p -L cscope.files & " . $VIMRUNTIME . "\\cscope.exe -Rbk -i cscope.files"
    else
        "以下注释是在不断尝试中的改进，对于路径中的空格，有了不错的解决
        :silent !find . -regex '.*\.c|.*\.cc\|.*\.cpp\|.*\.C|.*\.h\|.*\.hpp|.*\.s\|.*\.asm\|.*\.py\|.*\.js' | ls |sed "s:^:`pwd`/:" >cscope.out & "ctags" -R --fields=+ianS --excmd=p --extra=+q --c++-kinds=+p --c-kinds=+p -L cscope.out & "cscope" -Rbk
        echom "hello upadte cscope files!"
    endif

    if filereadable("cscope.out")
        silent cscope add cscope.out
    else  
        let cscope_file=findfile("cscope.out", ".;")  
        let cscope_pre=matchstr(cscope_file, ".*/")  
        if !empty(cscope_file) && filereadable(cscope_file)  
            exe "cs add" cscope_file cscope_pre  
        endif        
    endif  

    exec "UpdateTypesFileOnly"
    exec "redraw!"
    exec "cd -"
endfunction

function! UpdateTagHighlight()
    if filereadable("tags")
        call TagHighlight#Generation#UpdateAndRead(1)
        echomsg 'UpdateTagHighlight read tags from current dir!'
        exec "UpdateTypesFileOnly"
        return
    endif

    let tags_file=findfile("tags", ",;")
    let tags_pre=matchstr(tags_file, ".*/")
    if !empty(tags_file) && filereadable(tags_file)  
        exec "cd " tags_pre
        call TagHighlight#Generation#UpdateAndRead(1)
        exec "UpdateTypesFileOnly"
        echomsg 'UpdateTagHighlight read tags from current sub dir!'
        exec "cd -"
        return
    endif        

    let proj_path=finddir(".project", ",;")
    if !empty(proj_path)
        exec "cd " proj_path
        let tags_file=getcwd()."/tags"
        if filereadable(tags_file)
            call TagHighlight#Generation#UpdateAndRead(1)
            echomsg 'UpdateTagHighlight read tags from current project dir!'
        endif
        exec "cd -"
        return 
    endif
endfunction

" 打开共享文件链接
function! VimwikiLinkHandler(link)
    " Use Vim to open external files with the 'vfile:' scheme.  E.g.:
    "   1) [[vfile:~/Code/PythonProject/abc123.py]]
    "   2) [[vfile:./|Wiki Home]]
    let link = a:link
    if link =~# '^vfile:'
        let link = link[1:]
    else
        return 0
    endif
    if link == ''
        echomsg 'Vimwiki Error: Unable to resolve link!'
        return 0
    else
        "exe 'tabnew ' . fnameescape(link_infos.filename)
        execute '!start explorer ' . link 
        return 1
    endif
endfunction

function MyCompile()
    silent exec "w"
    let v:statusmsg = ''
    silent exec "make"
    if empty(v:statusmsg)
        echo "Compliation successful"
    endif
    exec "botright cwindow"
endfunc

"定义Run函数
function MyRun()
    exec ":call MyCompile()"
    echo "Run ".expand('%:t:r')
    if &filetype == 'c' || &filetype == 'cpp'
        exec "!%<"
    elseif &filetype == 'java'
        exec "!java %<"
    endif
endfunc

"定义Debug函数，用来调试程序
function MyDebug()
    exec ":call MyCompile()"
    echo "Gdb ".expand('%:t:r')
    "C程序
    if &filetype == 'c'
        exec "!gdb %<"
    elseif &filetype == 'cpp'
        exec "!gdb %<"
        "Java程序
    elseif &filetype == 'java'
        exec "!jdb %<"
    endif
endfunc

function OpenBrowers(name)
    exec ":update"     
    let l:browers = { "cr" : "/Applications/Firefox.app/Contents/MacOS/firefox " } 
    silent exec "!start ". l:browers[a:name] . expand("%:p")
endfunction

""""""""""""""""""""""""""""""
" => Python section
""""""""""""""""""""""""""""""
let python_highlight_all = 1
au FileType python syn keyword pythonDecorator True None False self

au BufNewFile,BufRead *.jinja set syntax=htmljinja
au BufNewFile,BufRead *.mako set ft=mako

au FileType python map <buffer> F :set foldmethod=indent<cr>

au FileType python inoremap <buffer> $r return 
au FileType python inoremap <buffer> $i import 
au FileType python inoremap <buffer> $p print 
au FileType python inoremap <buffer> $f #--- <esc>a
au FileType python map <buffer> <leader>1 /class 
au FileType python map <buffer> <leader>2 /def 
au FileType python map <buffer> <leader>C ?class 
au FileType python map <buffer> <leader>D ?def 
au FileType python set cindent
au FileType python set cinkeys-=0#
au FileType python set indentkeys-=0#


""""""""""""""""""""""""""""""
" => JavaScript section
"""""""""""""""""""""""""""""""
au FileType javascript call JavaScriptFold()
au FileType javascript setl fen
au FileType javascript setl nocindent

au FileType javascript imap <c-t> $log();<esc>hi
au FileType javascript imap <c-a> alert();<esc>hi

au FileType javascript inoremap <buffer> $r return 
au FileType javascript inoremap <buffer> $f //--- PH<esc>FP2xi

function! JavaScriptFold() 
    setl foldmethod=syntax
    setl foldlevelstart=1
    syn region foldBraces start=/{/ end=/}/ transparent fold keepend extend

    function! FoldText()
        return substitute(getline(v:foldstart), '{.*', '{...}', '')
    endfunction
    setl foldtext=FoldText()
endfunction


""""""""""""""""""""""""""""""
" => CoffeeScript section
"""""""""""""""""""""""""""""""
function! CoffeeScriptFold()
    setl foldmethod=indent
    setl foldlevelstart=1
endfunction
au FileType coffee call CoffeeScriptFold()

au FileType gitcommit call setpos('.', [0, 1, 1, 0])


""""""""""""""""""""""""""""""
" => Shell section
""""""""""""""""""""""""""""""
if exists('$TMUX') 
    if has('nvim')
        set termguicolors
    else
        set term=screen-256color 
    endif
endif


""""""""""""""""""""""""""""""
" => Twig section
""""""""""""""""""""""""""""""
autocmd BufRead *.twig set syntax=html filetype=html
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Important:
"       This requries that you install https://github.com/amix/vimrc !
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => highlight c function, useage: copy the follows to syntax/c.vim
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"来自王垠的著名配置文件，对函数名进行高亮
" syn match cFunction "\<[a-zA-Z_][a-zA-Z_0-9]*\>[^()]*)("me=e-2
" syn match cFunction "\<[a-zA-Z_][a-zA-Z_0-9]*\>\s*("me=e-1
" hi cFunction gui=NONE guifg=#268bd2



""""""""""""""""""""""""""""""
"" => Load pathogen paths
"""""""""""""""""""""""""""""""
"let s:vim_runtime = expand('<sfile>:p:h')."/.."
"call pathogen#infect(s:vim_runtime.'/sources_forked/{}')
"call pathogen#infect(s:vim_runtime.'/sources_non_forked/{}')
"call pathogen#infect(s:vim_runtime.'/my_plugins/{}')
"call pathogen#helptags()

""""""""""""""""""""""""""""""
" => bufExplorer plugin
""""""""""""""""""""""""""""""
let g:bufExplorerDefaultHelp=0
let g:bufExplorerShowRelativePath=1
let g:bufExplorerFindActive=1
"let g:bufExplorerSortBy='name'
let g:bufExplorerSortBy='mru'        " Sort by most recently used.
map <leader>o :BufExplorer<cr>


""""""""""""""""""""""""""""""
" => ZenCoding
""""""""""""""""""""""""""""""
" Enable all functions in all modes
let g:user_zen_mode='a'


""""""""""""""""""""""""""""""
" => snipMate (beside <TAB> support <CTRL-j>)
""""""""""""""""""""""""""""""
"ino <c-j> <c-r>=snipMate#TriggerSnippet()<cr>
"snor <c-j> <esc>i<right><c-r>=snipMate#TriggerSnippet()<cr>



""""""""""""""""""""""""""""""
" => ultisnips
""""""""""""""""""""""""""""""
" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<leader><tab>"
let g:UltiSnipsJumpForwardTrigger="<leader><tab>"
let g:UltiSnipsJumpBackwardTrgger="<leader><tab>"
" If you want :UltiSnipsEdit to split your window.
"let g:UltiSnipsEditSplit="vertical"


""""""""""""""""""""""""""""""
" => Vim grep
""""""""""""""""""""""""""""""
let Grep_Skip_Dirs = 'RCS CVS SCCS .svn generated'
set grepprg=/bin/grep\ -nH


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => netrw
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"let g:netrw_banner = 0  "将默认的“横幅”显示，设置为不显示；
""是默认 “一个文件一行”显示的加强版，会有时间戳等详细信息 append 在文件后面； 在 2 模式下，一行会有多个文件显示； 3 代表树 tree 模式显示
"let g:netrw_liststyle = 1
""用来控制在哪个窗口及位置显示打开的文件，默认为 0 就是在当前窗口中显示（覆盖掉目录现实），这不是我们希望的； 1 代表水平分裂； 2 代表垂直分裂； 3 代表在新 tab 中打开； 4 表示新开窗口覆盖原先窗口
"let g:netrw_browse_split = 2
"let g:netrw_altv = 1
"let g:netrw_winsize = 24
"let g:netrw_chgwin = 2
"let g:netrw_list_hide = '.*\.swp$'
"let g:netrw_localrmdir = 'rm -rf'
"augroup ProjectDrawer
"  autocmd!
"  autocmd VimEnter * :Vexplore
"  autocmd VimEnter * :wincmd p
"augroup END


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Nerd Tree
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"let g:NERDTreeWinPos = "right"
"let NERDTreeShowHidden=0
"let NERDTreeIgnore = ['\.pyc$', '__pycache__']
"let g:NERDTreeWinSize=35
"let NERDTreeShowBookmarks=1
"map <F3> :NERDTreeToggle<cr>
"map <leader>nb :NERDTreeFromBookmark<Space>
"map <leader>nf :NERDTreeFind<cr>                " 在nerdtree中定位到当前所编辑的文件
"let NERDTreeHijackNetrw=1
"autocmd vimenter * NERDTree 
""autocmd StdinReadPre * let s:std_in=1
""autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
"autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => nerdcommenter
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:NERDSpaceDelims = 1
let g:NERDCompactSexyComs = 1
"    ,ca，在可选的注释方式之间切换，比如C/C++ 的块注释/* */和行注释//
"    ,cc，注释当前行
"    ,c，切换注释/非注释状态
"    ,cs，以”性感”的方式注释
"    ,cA，在当前行尾添加注释符，并进入Insert模式
"    ,cu，取消注释
"    Normal模式下，几乎所有命令前面都可以指定行数
"    Visual模式下执行命令，会对选中的特定区块进行注释/反注释

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Taglist
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"设定Linux系统中ctags程序的位置
"let Tlist_Ctags_Cmd = '/usr/bin/ctags'
" 不同时显示多个文件的tag，只显示当前文件的
"let Tlist_Show_One_File=1
"如果taglist窗口是最后一个窗口，则退出vim
"let Tlist_Exit_OnlyWindow=1
"在右侧窗口中显示taglist窗口
"let Tlist_Use_Right_Window = 1
" 缺省情况下，在双击一个tag时，才会跳到该tag定义的位置
"let Tlist_Use_SingleClick= 1
"在启动VIM后，自动打开taglist窗口
"let Tlist_Auto_Open=1
"taglist始终解析文件中的tag，不管taglist窗口有没有打开
"let Tlist_Process_File_Always=1
"同时显示多个文件中的tag时，可使taglist只显示当前文件tag，其它文件的tag都被折叠起来
"let Tlist_File_Fold_Auto_Close=1
" Vimwiki support
"let tlist_vimwiki_settings = 'wiki;h:Headers'
" Markdown support
"let tlist_markdown_settings = 'markdown;h:Headers'
"map <leader>tl :TlistToggle<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => TagBar
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if has("gui_running")
    let g:tagbar_expand = 1
endif
let tagbar_left=1
let g:tagbar_ctags_bin='/usr/local/bin/ctags'
let g:tagbar_autoshowtag = 1
let g:tagbar_sort=0
" Add support for markdown files in tagbar.
let g:tagbar_type_markdown = {
            \ 'ctagstype' : 'markdown',
            \ 'kinds'     : [
            \ 'h:header',
            \ ],
            \ 'sort'    : 0
            \ }

" vimwiki support
let g:tagbar_type_vimwiki = {
            \ 'ctagstype' : 'wiki',
            \ 'kinds'     : [
            \ 'h:header',
            \ ],
            \ 'sort'    : 0
            \ }

let g:tagbar_type_javascript = {
            \ 'ctagstype': 'javascript',
            \ 'kinds': [
            \ 'c:classes',
            \ 'n:modules',
            \ 'v:variables',
            \ 'm:members',
            \ 'i:interfaces',
            \ 'e:enums',
            \ 'f:functions',
            \ ],
            \ 'sort'    : 0
            \ }

autocmd FileType * nested :call tagbar#autoopen(0)

map <F2> :TagbarToggle<CR>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => vim-winmanager
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"let g:winManagerWindowLayout='Tagbar|NERDTree'
"let g:winManagerWidth=30
"let g:AutoOpenWinManager = 1 "这里要配合修改winmanager.vim文件
"let g:NERDTree_title = "[NERDTree]"
"function! NERDTree_Start()
"    exe 'q' "执行一个退出命令，关闭自动出现的窗口"
"    exe 'NERDTree'
"endfunction
"function! NERDTree_IsValid()
"  return 1
"endfunction
"noremap  :NERDTreeFind
"let g:Tagbar_title = "[Tagbar]"
"function! Tagbar_Start()
"    exe 'q' "执行一个退出命令，关闭自动出现的窗口"
"    exe 'TagbarOpen'
"endfunction
"function! Tagbar_IsValid()
"    return 1
"endfunction
"let g:tagbar_vertical = 30
"autocmd bufenter * if (winnr("$") == 2 && exists("b:NERDTreeType") &&b:NERDTreeType == "primary")  | qa | endif


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => vim-switch
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nmap <silent> <Leader>sv :FSHere<cr>



""""""""""""""""""""""""""""""
" => MRU plugin
""""""""""""""""""""""""""""""
let MRU_Max_Entries = 400
map <leader>f :MRU<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => CtrlP
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:ctrlp_map = '<leader>p'
let g:ctrlp_cmd = 'CtrlP'
map <Leader>ff :CtrlPMRU<CR>
"设置过滤不进行查找的后缀名
let g:ctrlp_custom_ignore = {       
            \ 'dir':  '\v[\/]\.(git|hg|svn|rvm|DS_Store)$',
            \ 'file': '\v\.(exe|so|dll|zip|tar|tar.gz|pyc)$',
            \ }
let g:ctrlp_working_path_mode=2  "2: 在nerdtree当前目录下搜索，0：在整个硬盘全局搜索
let g:ctrlp_match_window_bottom=1
let g:ctrlp_max_height=20
let g:ctrlp_match_window_reversed=0
let g:ctrlp_mruf_max=500
let g:ctrlp_follow_symlinks=1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => easymotion
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:EasyMotion_smartcase = 1
"let g:EasyMotion_startofline = 0 " keep cursor colum when JK motion
map <Leader><leader>h <Plug>(easymotion-linebackward)
map <Leader><Leader>j <Plug>(easymotion-j)
map <Leader><Leader>k <Plug>(easymotion-k)
map <Leader><leader>l <Plug>(easymotion-lineforward)
" 重复上一次操作, 类似repeat插件, 很强大
map <Leader><leader>. <Plug>(easymotion-repeat)

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => tabular 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"if exists(":Tabularize")
"    nmap <Leader>tg= :Tabularize /=<CR>
"    vmap <Leader>tg= :Tabularize /=<CR>
"    nmap <Leader>tg| :Tabularize /|<CR>
"    vmap <Leader>tg| :Tabularize /|<CR>
"    nmap <Leader>tg: :Tabularize /:\zs<CR>
"    vmap <Leader>tg: :Tabularize /:\zs<CR>
"endif


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" TagHighlight
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if ! exists('g:TagHighlightSettings')
    let g:TagHighlightSettings = {}
endif
let g:TagHighlightSettings['TagFileName'] = 'tags'
"if has("Darwin")
    let g:TagHighlightSettings['CtagsExecutable'] = 'ctags'
"else
"    let g:TagHighlightSettings['CtagsExecutable'] = 'ctags.exe'
"endif
let g:TagHighlightSettings['LanguageDetectionMethods'] = ['Extension', 'FileType']
let g:TagHighlightSettings['FileTypeLanguageOverrides'] =  {'tagbar': 'c'}
let g:TagHighlightSettings['EnableCscope'] = 'True'
let g:TagHighlightSettings['CscopeOnlyIfPresent'] = 'True'
let g:TagHighlightSettings['DoNotGenerateTags'] = 'True'
"autocmd User TagHighlightAfterRead call airline#load_theme()
"autocmd FileType c,cpp,C,hpp,h,java,py :call UpdateTagHighlight()


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim-cpp-enhanced-highlight
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"letg:cpp_class_scope_highlight=1
"letg:cpp_member_variable_highlight=1
"letg:cpp_class_decl_highlight=1
"letg:cpp_experimental_template_highlight=1
"letg:cpp_concepts_highlight=1



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => vim-codefmt
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"augroup autoformat_settings
"  autocmd FileType bzl AutoFormatBuffer buildifier
"  autocmd FileType c,cpp,proto,javascript AutoFormatBuffer clang-format
"  autocmd FileType dart AutoFormatBuffer dartfmt
"  autocmd FileType go AutoFormatBuffer gofmt
"  autocmd FileType gn AutoFormatBuffer gn
"  autocmd FileType html,css,json AutoFormatBuffer js-beautify
"  autocmd FileType java AutoFormatBuffer google-java-format
"  autocmd FileType python AutoFormatBuffer yapf
"  " Alternative: autocmd FileType python AutoFormatBuffer autopep8
"augroup END


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" =>  auto-format
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"F4自动格式化代码并保存
noremap <F4> :Autoformat<CR>:w<CR>
let g:autoformat_autoindent = 0
let g:autoformat_retab = 0
let g:autoformat_remove_trailing_spaces = 0
"let g:autoformat_verbosemode=1
"自动格式化代码，针对所有支持的文件
"au BufWrite * :Autoformat
"自动格式化python代码
"au BufWrite *.py :Autoformat
"let g:formatter_yapf_style = 'pep8'  "在安装了yapf以后，还可以自定义python格式化的风格， 默认情况下是pep8，还可以选择google,facebook和chromium
"还可以针对某种语言指定特定的格式化工具和相应的参数，比如设定以allman(ansi)的风格格式化C/C++代码同时在操作符两边加入空格(即--pad-oper参数)
let g:formatdef_allman = '"astyle --style=allman --pad-oper"'
let g:formatters_cpp = ['allman']
let g:formatters_c = ['allman']
" --style=ansi --add-brackets(-j) --pad-oper(-p)
" --align-reference=middle(-W2) --align-pointer=middle(-k2)
" --indent-namespaces(-N) --indent-preproc-define(-w)
" --indent-switches --indent-cases(-K) --indent-preproc-block(-xW)
"let g:formatdef_jian = '"astyle --style=ansi -j -p -W2 -k2 -N -w -K -xW"'
"let g:formatters_cpp = ['jian']
"let g:formatters_java = ['jian']
"let g:formatters_c = ['jian']


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Astyle Format Code
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" version 2.6+
"autocmd FileType c,cpp,C setlocal equalprg=astyle\ -A1\ -xk\ -Y\ -m0\ -M80\ -f\ -p\ -xg\ -H\ -k3\ -W3\ -y\ -J\ -xy\ --mode=c
" version 3.0+
"autocmd FileType c,cpp,C setlocal equalprg=astyle\ -A1\ -xV\ -xk\ -Y\ -m0\ -M80\ -f\ -p\ -xg\ -H\ -k3\ -W3\ -y\ -J\ -xy\ --mode=c




"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => compile
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
augroup makeCnf
    au!
    autocmd FileType c    setlocal makeprg=gcc\ -Wall\ %\ -g\ -o\ %<
    autocmd FileType cpp  setlocal makeprg=g++\ -Wall\ %\ -g\ -o\ %<
    autocmd FileType C    setlocal makeprg=g++\ -Wall\ %\ -g\ -o\ %<
    autocmd FileType java setlocal makeprg=javac\ %
    autocmd FileType c,cpp,C compiler gcc
augroup END


"结束定义Debug
"设置程序的运行和调试的快捷键F5和Ctrl-F5
map <F5>   :call MyCompile()<CR>
map <C-F5> :call MyDebug()<CR>
map <F6> :call MyRun()<CR>



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => surround.vim config
" Annotate strings with gettext 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
vmap Si S(i_<esc>f)
au FileType mako vmap Si S"i${ _(<esc>2f"a) }<esc>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => lightline
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"let g:lightline = {
"      \ 'colorscheme': 'wombat',
"      \ }
"
"let g:lightline = {
"      \ 'colorscheme': 'wombat',
"      \ 'active': {
"      \   'left': [ ['mode', 'paste'],
"      \             ['fugitive', 'readonly', 'filename', 'modified'] ],
"      \   'right': [ [ 'lineinfo' ], ['percent'] ]
"      \ },
"      \ 'component': {
"      \   'readonly': '%{&filetype=="help"?"":&readonly?"🔒":""}',
"      \   'modified': '%{&filetype=="help"?"":&modified?"+":&modifiable?"":"-"}',
"      \   'fugitive': '%{exists("*fugitive#head")?fugitive#head():""}'
"      \ },
"      \ 'component_visible_condition': {
"      \   'readonly': '(&filetype!="help"&& &readonly)',
"      \   'modified': '(&filetype!="help"&&(&modified||!&modifiable))',
"      \   'fugitive': '(exists("*fugitive#head") && ""!=fugitive#head())'
"      \ },
"      \ 'separator': { 'left': ' ', 'right': ' ' },
"      \ 'subseparator': { 'left': ' ', 'right': ' ' }
"      \ }

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Airline
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
let g:airline_powerline_fonts = 1  "使用powerline打过补丁的字体
let Powerline_symbols='fancy'  

if has("win16") || has("win32")
    let g:airline_left_sep = ''
    let g:airline_left_alt_sep = ''
    let g:airline_right_sep = ''
    let g:airline_right_alt_sep = ''
    let g:airline_symbols.branch = ''
    let g:airline_symbols.readonly = ''
    let g:airline_symbols.linenr = ''
elseif has("Darwin")
    "let g:airline_left_sep = '▶'
    "let g:airline_right_sep = '◀'
    let g:airline_symbols.linenr = '¶'
    let g:airline_symbols.maxlinenr = '☰'
    let g:airline_symbols.branch = '⎇'
    let g:airline_symbols.paste = '∥'
    let g:airline_symbols.notexists = '∄'
    let g:airline_symbols.whitespace = 'Ξ'
    let g:airline_powerline_fonts = 1 
endif

" themes are automatically selected based on the matching colorscheme. this
" can be overridden by defining a value. >
let g:airline_theme='dark'
" 是否打开tabline
let g:airline#extensions#tabline#enabled = 1        "Automatically displays all buffers when there's only one tab open.
let g:airline#extensions#tabline#formatter = 'unique_tail'  
let g:airline#extensions#tagbar#enabled = 1
let g:airline#extensions#quickfix#quickfix_text = 'Quickfix'
let g:airline#extensions#quickfix#location_text = 'Location'
let g:airline#extensions#syntastic#enabled = 1

let g:airline#extensions#tabline#tab_nr_type = 1 " tab number
let g:airline#extensions#tabline#show_tab_nr = 1     "enable/disable displaying tab number in tabs mode.
let g:airline#extensions#tabline#buffer_nr_show = 0  "configure whether buffer numbers should be shown
let g:airline#extensions#tabline#fnametruncate = 16  "configure truncating non-active buffer names to specified length
let g:airline#extensions#tabline#fnamecollapse = 1 
let g:airline#extensions#tabline#buffer_idx_mode = 1
nmap <D-1> <Plug>AirlineSelectTab1
nmap <D-2> <Plug>AirlineSelectTab2
nmap <D-3> <Plug>AirlineSelectTab3
nmap <D-4> <Plug>AirlineSelectTab4
nmap <D-5> <Plug>AirlineSelectTab5
nmap <D-6> <Plug>AirlineSelectTab6
nmap <D-7> <Plug>AirlineSelectTab7
nmap <D-8> <Plug>AirlineSelectTab8
nmap <D-9> <Plug>AirlineSelectTab9
nmap <D--> <Plug>AirlineSelectPrevTab
nmap <D-+> <Plug>AirlineSelectNextTab


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Quickfix
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <leader>qw :botright cwindow<cr>        "当有如果有错误列表时，则打开quickfix窗口,没有则关闭
map <leader>qcl :ccl<cr>                    "关闭 quickfix 窗口
map <leader>qc  :cc<CR>                     "显示详细错误信息
map <leader>qn  :cn<CR>                     "跳到下一个错误
map <leader>qp  :cp<CR>                     "跳到上一个错误
map <leader>ql  :cl<CR>                     "列出所有错误
map <leader>lw :botright lwindow<cr>
map <leader>lcl :lclose<cr>                 "关闭显示当前窗口的位置列表的窗口
map <leader>ln  :lnext<CR>                  "和 ":cnext" 类似，但使用当前窗口的位置列表而不是quickfix 列表。
map <leader>lp  :lpreviouse<CR>
"map <leader>co ggVGy:tabnew<cr>:set syntax=qf<cr>pgg

"Query :help cope if you are unsure what cope is. It's super useful!
"When you search with Ack.vim, display your results in cope by doing: <leader>cc
"To go to the next search result do: <leader>n
"To go to the previous search results do: <leader>p
"map <leader>n :cn<cr>
"map <leader>p :cp<cr>
"map <leader>cc :botright cope<cr>     "打开一个窗口显示当前的错误列表。    先看原始效果，以后有必要再打开注释 boooble
map <leader>co ggVGy:tabnew<cr>:set syntax=qf<cr>pgg


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Ack searching and cope displaying
"    requires ack.vim - it's much better than vimgrep/grep
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Use the the_silver_searcher if possible (much faster than Ack)
if executable('ag')
  let g:ackprg = 'ag --vimgrep --smart-case --ignore *.out'
endif

" When you press gv you Ack after the selected text
vnoremap <silent>gv :call VisualSelection('gv', '')<CR>

" Open Ack and put the cursor in the right position
"加上!表示禁止自动切换至第一个匹配结果
map <leader>g :Ack!<Space>
let g:ackhighlight = 1      "高亮搜索关键词

" When ,ou press <leader>r you can search and replace the selected text
vnoremap <silent> <leader>r :call VisualSelection('replace', '')<CR>






""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => OmniCppComplete
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"let OmniCpp_NamespaceSearch = 1
"let OmniCpp_GlobalScopeSearch = 1
"let OmniCpp_ShowAccess = 1
"let OmniCpp_ShowPrototypeInAbbr = 1 " show function parameters
"let OmniCpp_MayCompleteDot = 1 " autocomplete after .
"let OmniCpp_MayCompleteArrow = 1 " autocomplete after ->
"let OmniCpp_MayCompleteScope = 1 " autocomplete after ::
"let OmniCpp_DefaultNamespaces = ["std", "_GLIBCXX_STD"]
"
"" Enable omni completion.
"augroup omni
"    au!
"    autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
"    autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
"    autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
"    autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
"    autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
"    autocmd FileType c set omnifunc=ccomplete#Complete
"    autocmd FileType cpp set omnifunc=omni#cpp#complete#Main
"    autocmd FileType C set omnifunc=omni#cpp#complete#Main
"augroup END

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => OmniCppComplete
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set completeopt=longest,menu    "让Vim的补全菜单行为与一般IDE一致(参考VimTip1228)
autocmd InsertLeave * if pumvisible() == 0|pclose|endif    "离开插入模式后自动关闭预览窗口
"回车即选中当前项
inoremap <expr> <CR>       pumvisible() ? "\<C-y>" : "\<CR>"    
"上下左右键的行为 会显示其他信息
inoremap <expr> <Down>     pumvisible() ? "\<C-n>" : "\<Down>"
inoremap <expr> <Up>       pumvisible() ? "\<C-p>" : "\<Up>"
inoremap <expr> <PageDown> pumvisible() ? "\<PageDown>\<C-p>\<C-n>" : "\<PageDown>" 
inoremap <expr> <PageUp>   pumvisible() ? "\<PageUp>\<C-p>\<C-n>" : "\<PageUp>"
"youcompleteme 默认tab s-tab 和自动补全冲突 
"let g:ycm_key_list_select_completion=['<c-n>'] 
"let g:ycm_key_list_select_completion = ['<Down>'] 
"let g:ycm_key_list_previous_completion=['<c-p>'] 
"let g:ycm_key_list_previous_completion = ['<Up>'] 

let g:ycm_key_list_select_completion = ['<C-n>', '<TAB>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<S-TAB>', '<Up>']
let g:ycm_global_ycm_extra_conf = "~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py"
let g:ycm_confirm_extra_conf=0                    "关闭加载.ycm_extra_conf.py提示, 避免YCM每次加载都对用户提示是否加载 
let g:ycm_collect_identifiers_from_tags_files=1    " 开启 YCM 基于标签引擎
let g:ycm_min_num_of_chars_for_completion=2    " 从第2个键入字符就开始罗列匹配项
let g:ycm_cache_omnifunc=0    " 禁止缓存匹配项,每次都重新生成匹配项
let g:ycm_seed_identifiers_with_syntax=1    " 语法关键字补全
nnoremap <F11> :YcmForceCompileAndDiagnostics<CR>    "force recomile with syntastic
"nnoremap <leader>lo :lopen<CR>    "open locationlist
"nnoremap <leader>lc :lclose<CR>    "close locationlist
inoremap <leader><leader> <C-x><C-o>
let g:ycm_complete_in_comments = 1   "在注释输入中也能补全
let g:ycm_complete_in_strings = 1   "在字符串输入中也能补全
let g:ycm_complete_in_strings = 1   "注释和字符串中的文字也会被收入补全
let g:ycm_collect_identifiers_from_comments_and_strings = 0
let g:ycm_goto_buffer_command = 'horizontal-split'
"nmap <leader>jd :YcmDiags<CR>
nnoremap <leader>jl :YcmCompleter GoToDeclaration<CR>           " 跳转到申明处
"nnoremap <leader>gd :YcmCompleter GoToDefinition<CR>            " 跳转到定义处
nnoremap <leader>jd :YcmCompleter GoToDefinitionElseDeclaration<CR>
" 黑名单,不启用
let g:ycm_filetype_blacklist = {
        \ 'tagbar' : 1,
        \ 'nerdtree' : 1,
        \ 'gitcommit' : 1,
        \ 'markdown' : 1,
        \ 'vimwiki' : 1,
        \}



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Ctags
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set tags=.project/tags;./tags;,tags
" configure tags - add additional tags here or comment out not-used ones
" set tags+=~/.vim/tags/cpp_files

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => cscope setting
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if has("cscope")
    set csprg=/usr/local/bin/cscope
    set csto=1
    set cst
    "set nocsverb
    " display in quickfix,":bo cw" or "cw" to open quickfix.
    set cscopequickfix=s-,c-,d-,i-,t-,e-
    " add any database in current directory
    let cscope_pre = finddir(".", ".;")
    "let cscope_pre = FindRootDirectory();
    "echom "hello !"
    if isdirectory(cscope_pre)
        if filereadable("cscope.out")
            echom "cs add cscope.out"
            exec "cs add cscope.out" cscope_pre
        endif
    else
        if filereadable("cscope.out")
            cs add cscope.out
        endif
    endif
    set csverb
endif

"s: Find this C symbol
nmap <C-_>s :cs find s <C-R>=expand("<cword>")<CR><CR> 
"g: Find this definition
nmap <C-_>g :cs find g <C-R>=expand("<cword>")<CR><CR>
"d: Find functions called by this function
nmap <C-_>d :cs find d <C-R>=expand("<cword>")<CR><CR>      
"c: Find functions calling this function
nmap <C-_>c :cs find c <C-R>=expand("<cword>")<CR><CR>
"t: Find this text string
nmap <C-_>t :cs find t <C-R>=expand("<cword>")<CR><CR>
"e: Find this egrep pattern
nmap <C-_>e :cs find e <C-R>=expand("<cword>")<CR><CR>
"f: Find this file
nmap <C-_>f :cs find f <C-R>=expand("<cfile>")<CR><CR>
"i: Find files #including this file
nmap <C-_>i :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
"a: Find places where this symbol is assigned a value
nmap <C-_>a :cs find a <C-R>=expand("<cword>")<CR><CR>

"F12快捷键,更新当前目录下的ctags与cscope.out文件
"nmap <silent> <C-F12> :call UpdateTagsAndCscope2()<CR>
nmap <C-F12> :call UpdateTagsAndCscope2()<CR>

" 关闭数据库连接
    nmap <C-_>k :cs kill cscope.out <CR>
" 打开数据库连接
    nmap <C-_>o :cs add cscope.out <CR>
" 保存文件并且更新数据库
    nmap <C-_>w :w<CR>:UpdateTagsAndCscope2()<CR>
" 保存文件并且更新ctags
    nmap <C-_>u :w<CR>:!ctags -R<CR><CR>
" 保存文件更新全部
    nmap <C-_>a <C-@>w <C-@>u

"let g:Auto_update_cscope_ctags_timer_filter=10
"let g:Auto_update_cscope_ctags_debug_log=1

"nmap <F12> <Plug>CscopeDBInit
"let g:cscopedb_auto_init=1
"let g:cscopedb_big_file = FindRootDirectory()
"let g:cscopedb_small_file = FindRootDirectory()
"let g:cscopedb_big_file ="/Users/boooble/project/push/cscope.out"
"let g:cscopedb_small_file ="/Users/boooble/project/push/cscope.out.small"




"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Fencview
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"nmap <leader>fad :silent! FencAutoDetect<CR><CR>
nmap <C-F3> :silent! FencAutoDetect<CR><CR>

"let g:fencview_autodetect=1   " 打开文件时自动识别编码  
"let g:fencview_auto_patterns='*.md'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Vimwiki
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if has("win16") || has("win32")
    let g:vimwiki_list = [{'path': 'D:\Wiki', 'path_html': 'D:\Wiki\html', 'syntax': 'markdown', 'auto_tags': 1}]
else
    let g:vimwiki_list = [{'path': '~/Wiki', 'path_html': '~/Wiki/html', 'syntax': 'markdown', 'auto_tags': 1}]
endif

"let g:vimwiki_ext2syntax = {'.md': 'markdown', '.mkd': 'markdown' }
"let g:vimwiki_listsyms = '✗○◐●✓'
hi VimwikiHeader1 guifg=#FF0000
hi VimwikiHeader2 guifg=#00FF00
hi VimwikiHeader3 guifg=#FFFF00
hi VimwikiHeader4 guifg=#FF00FF
hi VimwikiHeader5 guifg=#00FFFF
hi VimwikiHeader6 guifg=#0000FF

let g:vimwiki_hl_cb_checked = 1
let g:vimwiki_CJK_length = 1
let g:vimwiki_use_mouse = 1
" disable table mappings for INSERT mode.
let g:vimwiki_table_mappings=0
" Toggle checkbox of a list item on/off.
map  <Leader>tt <Plug>VimwikiToggleListItem
" Remove checkbox from list item.
" map <Leader><Space> <Plug>VimwikiRemoveSingleCB
" Remove checkboxes from all sibling list items.
" map <Leader><Space> <Plug>VimwikiRemoveCBInList

augroup wiki
    au!
    autocmd BufRead,BufNewFile *.md,*mkd set filetype=markdown
    autocmd BufRead,BufNewFile *.wiki set filetype=wiki
    autocmd FileType wiki,md,mkd setlocal cocu=""
    autocmd FileType wiki,md,mkd setlocal shiftwidth=2
    autocmd FileType wiki,md,mkd setlocal tabstop=2
augroup END

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Vimroom
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:goyo_width=100
let g:goyo_margin_top = 2
let g:goyo_margin_bottom = 2
nnoremap <silent> <leader>z :Goyo<cr>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Vim-go
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:go_fmt_command = "goimports"


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Syntastic (syntax checker)
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Python
let g:syntastic_python_checkers=['pyflakes']

" Javascript
let g:syntastic_javascript_checkers = ['jshint']

" Go
let g:syntastic_auto_loc_list = 1
let g:syntastic_go_checkers = ['go', 'golint', 'errcheck']

"" Custom CoffeeScript SyntasticCheck
"func! SyntasticCheckCoffeescript()
"    let l:filename = substitute(expand("%:p"), '\(\w\+\)\.coffee', '.coffee.\1.js', '')
"    execute "tabedit " . l:filename
"    execute "SyntasticCheck"
"    execute "Errors"
"endfunc
"nnoremap <silent> <leader>c :call SyntasticCheckCoffeescript()<cr>

" For cppSyntaxCheck
let g:include_path=":."
"            \:/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.13.sdk/usr/include/c++/4.2.1"
let g:compile_flag="-D_LINUX_"
let g:cpp_compiler="/usr/bin/g++"
let g:enable_warning=1
let g:cpp_compiler="LANG=C g++ -Wall"
let g:longest_text=120

" For syntastic settings 这个是我的syntastic的配置
let g:syntastic_enable_highlighting = 1 " 错误单词高亮
let g:syntastic_aggregate_errors = 1 "第一时间检查发现任何错误
let g:syntastic_enable_signs = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_stl_format = "[%E{Err: %fe #%e}%B{, }%W{Warn: %fw #%w}]"
let g:syntastic_debug_file = "~/syntastic.log"
" let g:syntastic_cpp_check_header = 1
let g:syntastic_cpp_checkers = ['gcc']

let g:syntastic_auto_jump = 1
let g:syntastic_enable_balloons = 1

let g:syntastic_cpp_compiler = 'g++'
let g:syntastic_cpp_compiler_options = '-Wall -Wno-format -g -O2 -D_FILE_OFFSET_BITS=64 -fPIC'

let g:syntastic_cpp_check_header = 1
let g:syntastic_cpp_auto_refresh_includes = 1

"let g:syntastic_c_config_file = ['/home/howard/qt/qt-embedded-4.8.5/include/QtGui']
"let g:syntastic_cpp_include_dirs = [
"            \ '/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.13.sdk/usr/include/c++/4.2.1']

let g:syntastic_ignore_files=[".*\.py$", ".*\.S$"] "让 syntastic忽略 python 文件,和汇编文件
let g:syntastic_html_tidy_ignore_errors=[" proprietary attribute \"ng-"]
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

nmap <leader>ln :lnext<CR>
nmap <leader>lp :lprevious<CR>


"map <F2> :silent call OpenBrowers("cr")<CR><CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Git gutter (Git diff)
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:gitgutter_enabled=0
nnoremap <silent> <leader>d :GitGutterToggle<cr>
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Important: 
"       This requries that you install https://github.com/amix/vimrc !
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Fast editing and reloading of vimrc configs
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if has("win16") || has("win32") || has("win64")
    map <leader>e :e! $vim/_vimrc<cr>
else
    map <leader>e :e! ~/.vimrc
endif
"autocmd! bufwritepost ~/.vim_runtime/my_configs.vim source ~/.vim_runtime/my_configs.vim


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Turn persistent undo on 
"    means that you can undo even when you close a buffer/VIM
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"try
"    set undodir=~/.vim_runtime/temp_dirs/undodir
"    set undofile
"catch
"endtry


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Command mode related 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Smart mappings on the command line
cnoremap $h e ~/
cnoremap $d e ~/Desktop/
cnoremap $j e ./
cnoremap $c e <C-\>eCurrentFileDir("e")<cr>

" $q is super useful when browsing on the command line
" it deletes everything until the last slash 
cnoremap $q <C-\>eDeleteTillSlash()<cr>

" Bash like keys for the command line
cnoremap <C-A>		<Home>
cnoremap <C-E>		<End>
cnoremap <C-K>		<C-U>

cnoremap <C-P> <Up>
cnoremap <C-N> <Down>

" Map ½ to something useful
map ½ $
cmap ½ $
imap ½ $


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Parenthesis/bracket
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Surround the visual selection in parenthesis/brackets/etc.:
vnoremap $1 <esc>`>a)<esc>`<i(<esc>
vnoremap $2 <esc>`>a]<esc>`<i[<esc>
vnoremap $3 <esc>`>a}<esc>`<i{<esc>
vnoremap $$ <esc>`>a"<esc>`<i"<esc>
vnoremap $q <esc>`>a'<esc>`<i'<esc>
vnoremap $e <esc>`>a"<esc>`<i"<esc>

" Map auto complete of (, ", ', [
inoremap $1 ()<esc>i
inoremap $2 []<esc>i
inoremap $3 {}<esc>i
inoremap $4 {<esc>o}<esc>O
inoremap $q ''<esc>i
inoremap $e ""<esc>i
inoremap $t <><esc>i



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General abbreviations
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
iab xdate <c-r>=strftime("%d/%m/%y %H:%M:%S")<cr>  "在插入模式下写xdate就得到当前时间

"let s:use_config=1          "------------>>>>> 以下配置的开关
"if s:use_config

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" FILE: 
"       vundle.vim
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"{{{

set nocompatible              " be iMproved, required
"filetype off                  " required
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo


"if has("lua")                              " 都用youcompleteme替代
"    Plugin 'Shougo/neocomplete.vim'
"    Plugin 'Shougo/neosnippet'
"    Plugin 'Shougo/neosnippet-snippets'
"else
"    Plugin 'exvim/ex-autocomplpop'
"    Plugin 'ervandew/supertab'
"endif

Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'aperezdc/vim-template'
"Plugin 'alpertuna/vim-header'
"Plugin 'altercation/vim-colors-solarized'
"Plugin 'scrooloose/nerdtree'
Plugin 'tpope/vim-vinegar'
Plugin 'scrooloose/nerdcommenter'
Plugin 'jlanzarotta/bufexplorer'

"Plugin 'itchyny/lightline.vim'
Plugin 'vimwiki/vimwiki'
Plugin 'tpope/vim-commentary'
Plugin 'godlygeek/tabular'
"Plugin 'vim-scripts/taglist.vim'
Plugin 'majutsushi/tagbar'
Plugin 'vim-scripts/TagHighlight'
Plugin 'easymotion/vim-easymotion'
Plugin 'yegappan/mru'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'mileszs/ack.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'flazz/vim-colorschemes'
"Plugin 'tomasr/molokai'
Plugin 'mbbill/fencview'            " 文件格式自动识别
"Plugin 'hail2u/vim-css3-syntax'
"Plugin 'pangloss/vim-javascript'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'vim-syntastic/syntastic'
Plugin 'airblade/vim-rooter'
Plugin 'xolox/vim-easytags'
Plugin 'xolox/vim-misc'
"Plugin 'haolongzhangm/auto_update_cscope_ctags_database'
"Plugin 'vim-scripts/autoload_cscope.vim'
"Plugin 'erig0/cscope_dynamic'
"Plugin 'chazy/cscope_maps'
Plugin 'vimcn/vimcdoc'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'amix/open_file_under_cursor.vim'
Plugin 'vim-gitgutter'
"Plugin 'octol/vim-cpp-enhanced-highlight'
Plugin 'derekwyatt/vim-fswitch'
"Plugin 'google/vim-maktaba' " Add maktaba and codefmt to the runtimepath. (The latter must be installed before it can be used.)
"Plugin 'google/vim-codefmt' 
"Plugin 'google/vim-glaive'  " Also add Glaive, which is used to configure codefmt's maktaba flags
Plugin 'Chiel92/vim-autoformat'
Plugin 'Valloric/YouCompleteMe'
Plugin 'junegunn/goyo.vim'
"Plugin 'vim-scripts/winmanager'



" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Git plugin not hosted on GitHub
"Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
"Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
" Plugin 'ascenator/L9', {'name': 'newL9'}

" All of your Plugins must be added before the following line
call vundle#end()            " required
" To ignore plugin indent changes, instead use:
"filetype plugin on

" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
"
"}}}



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Helper functions
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
func! DeleteTillSlash()
    let g:cmd = getcmdline()

    if has("win16") || has("win32")
        let g:cmd_edited = substitute(g:cmd, "\\(.*\[\\\\]\\).*", "\\1", "")
    else
        let g:cmd_edited = substitute(g:cmd, "\\(.*\[/\]\\).*", "\\1", "")
    endif

    if g:cmd == g:cmd_edited
        if has("win16") || has("win32")
            let g:cmd_edited = substitute(g:cmd, "\\(.*\[\\\\\]\\).*\[\\\\\]", "\\1", "")
        else
            let g:cmd_edited = substitute(g:cmd, "\\(.*\[/\]\\).*/", "\\1", "")
        endif
    endif   

    return g:cmd_edited
endfunc

func! CurrentFileDir(cmd)
    return a:cmd . " " . expand("%:p:h") . "/"
endfunc







