set ts=4           "tab = 4 spaces
set autoindent     "auto ident filetype
set softtabstop=4 shiftwidth=4 expandtab   "wstawia 4 spacje zamiast taba
set nowrap         "noline wrape
set guioptions+=b  "botom scrolbar
set guioptions-=T  "remove iconbar
syntax enable       "enable syntax
set number         "show line number
set history=50     "length of history
set incsearch      "increment search
set showcmd        "show typing comand
set cindent shiftwidth=4   "automatyczne wcięcia o głębokości 4
set nobackup       "no backup files
set nowritebackup  "only in case you don't want a backup file while editing
set noswapfile     "no swap files
set mouse=a

"colorscheme desert  "set colorscheme
"colorscheme blaquemagick
colorscheme fahrenheit

"setings for popup menu
:highlight Pmenu guibg=deepSkyBlue4 gui=bold

"file extension ignore in search
:set wildignore=.svn,CVS,.git,*.o,*.a,*.class,*.mo,*.la,*.so,*.obj,*.swp,*.jpg,*.png,*.xpm,*.gif

" auto close options when exiting insert mode
" autocmd InsertLeave * if pumvisible() == 0|pclose|endif
set completeopt=menu,menuone

let OmniCpp_SelectFirstItem = 2 " select first item (but don't insert)

" uzupełnianie składni
filetype plugin on


set foldmethod=indent  "zwijajne wedle wciec
autocmd FileType c,cpp,h,hpp :set foldmethod=syntax "zwijanie lini wedle syntaxu dla c++
set foldlevel=100
" zM - zwija wszystko
" zm - zwija jeden poziom
" zR - rozwija wszystko
" zr - rozwija jeden poziom
" zC - zwija całkowicie cały marker
" zc - zwija jeden marker o jeden poziom
" zO - rozwija cały marker
" zo - rozwija jeden marker o jeden poziom

"##################################################"
" jump between hpp <-> cpp file
function! JumpHeaderSource()
    let s:flipname = ""
    if( match(expand("%"),'\.cpp') > 0 )
        let s:flipname = substitute(expand("%:p"),'\.cpp\(.*\)','\.hpp\1',"")
        let s:flipname = substitute(s:flipname,'Source','Include',"")
    endif
    if( match(expand("%"),'\.hpp') > 0 )
        let s:flipname = substitute(expand("%:p"),'\.hpp\(.*\)','\.cpp\1',"")
        let s:flipname = substitute(s:flipname,'Include','Source',"")
    endif
    if( strlen(s:flipname) == 0)
        echo "Incorrect file format"
        return
    endif
    if filereadable(s:flipname)
        exe ":e " . s:flipname
    else
        echo "Can not open file: " . s:flipname
        return
    endif
endfun

map <F3> :call JumpHeaderSource()<CR>
"################################################"
" blame
command Blame VCSBlame -v

"######## wyszukiwanie i otwieranie plików #######"
function Open(str)
    let _output = system("find . -name ".a:str."| egrep -v \"\\.svn|\\.swp|\\.tmp|\\.o\"") "find files in pwd
    echo "files to be open:\n"._output
    echo "Do you want to open this files? y/n"
    if(nr2char(getchar()) == 'y')   "confirm 2 topen files
        let _files = split(_output)
        for i in _files
            execute ":e ".i
        endfor
    endif
endfunc

command -nargs=1 Open :call Open(<f-args>)
"######### skróty klawiszowe #####################"
"hotkeys from windows"
source $VIMRUNTIME/mswin.vim
behave mswin

nmap <silent> <F6> :split<CR>
nmap <silent> <F5> :NERDTreeToggle<CR>
nmap <silent> <F4> :TagbarToggle<CR>
nmap <silent> <F2> :w<CR>
nmap <silent> <F10> :q<CR>
nmap <silent> <F7> :tabnew<CR>
nmap <silent> <F8> :vsplit<CR>
" Execute file being edited with <Shift> + e:
map <buffer> <S-e> :w<CR>:!/usr/bin/env python % <CR>

" usun biale znaki z konca linii
map <F12> :%s/\s*$//g<CR>

" przeczanie zakładek pod ctrl+tab"
map <silent> <C-Tab> :tabnext<CR>
inoremap <silent> <C-Tab> <esc>:tabnext<CR>a

" przełączanie buforót pod tab
nmap <silent> <Tab> :bNext<CR>

" uzupełnianie pod ctrl+space
inoremap <silent> <C-space> <C-X><C-O>

"\n to turn off search highlighting
nmap <silent> <leader>n :silent :nohlsearch<CR>
"\l to toggle visible whitespace
nmap <silent> <leader>l :set list!<CR>

"##################################################"

set hlsearch
call pathogen#infect()
let $EX_DEV='~/.vim/'

"podkreślanie trailing space pod \l
set listchars+=trail:.
highlight SpecialKey term=standout ctermbg=red guibg=red

"############# auto tags: ############## "
autocmd FileType c,cpp,h,hpp,out :set tags+=~/tags/boost_cpp,~tags/std_cpp,~/tags/common_cpp,~/tags/isar_cpp
autocmd FileType c,cpp,h,hpp,out :set tags+=~/tags/cellc_cpp
autocmd FileType c,cpp,h,hpp,out :set tags+=~/tags/enbc_cpp
autocmd FileType c,cpp,h,hpp,out :set tags+=~/tags/rrom_cpp
"autocmd FileType c,cpp,h,hpp,out :set tags+=~/tags/tupc_cpp
autocmd FileType c,cpp,h,hpp,out :set tags+=~/tags/uec_cpp
autocmd FileType c,cpp,h,hpp,out :set tags+=~/tags/intheaders_cpp

autocmd FileType ttcn,ttcn3,txt,log :set tags+=~/tags/common_ttcn3
"autocmd FileType ttcn,ttcn3,txt,log :set tags+=~/tags/pit_ttcn3
"autocmd FileType ttcn,ttcn3,txt,log :set tags+=~/tags/cellc_ttcn3
"autocmd FileType ttcn,ttcn3,txt,log :set tags+=~/tags/enbc_ttcn3
autocmd FileType ttcn,ttcn3,txt,log :set tags+=~/tags/rrom_ttcn3
"autocmd FileType ttcn,ttcn3,txt,log :set tags+=~/tags/tupc_ttcn3
autocmd FileType ttcn,ttcn3,txt,log :set tags+=~/tags/uec_ttcn3
autocmd FileType ttcn,ttcn3,txt,log :set tags+=~/tags/mcec_ttcn3
"############# ~auto tags~ ############# "
autocmd BufRead,BufNewFile *.ttcn* set filetype=ttcn
autocmd! Syntax ttcn source ~/.vim/syntax/ttcn.vim

autocmd BufRead,BufNewFile *.log set filetype=nsn-syslog
autocmd! Syntax nsn-syslog source ~/.vim/syntax/nsn-syslog.vim

autocmd BufRead,BufNewFile *.k3.txt,*k3.log set filetype=nsn-k3txt
autocmd! Syntax nsn-syslog source ~/.vim/syntax/nsn-k3txt.vim

autocmd BufRead,BufNewFile *.out set filetype=nsn-syslog
" autocomands for tags
autocmd FileType c,cpp,h,hpp :set tags+=~/tags/boost_cpp,~tags/std_cpp,~/tags/common_cpp,~/tags/isar_cpp"
autocmd FileType c,cpp,h,hpp :set tags+=~/tags/cellc_cpp
autocmd FileType c,cpp,h,hpp :set tags+=~/tags/enbc_cpp
autocmd FileType c,cpp,h,hpp :set tags+=~/tags/rrom_cpp
autocmd FileType c,cpp,h,hpp :set tags+=~/tags/tupc_cpp
autocmd FileType c,cpp,h,hpp :set tags+=~/tags/uec_cpp

autocmd FileType ttcn,ttcn3 :set tags+=~/tags/common_ttcn3,~/tags/k3lteasn_ttcn3
autocmd FileType ttcn,ttcn3 :set tags+=~/tags/pit_ttcn3
autocmd FileType ttcn,ttcn3 :set tags+=~/tags/cellc_ttcn3
autocmd FileType ttcn,ttcn3 :set tags+=~/tags/enbc_ttcn3
autocmd FileType ttcn,ttcn3 :set tags+=~/tags/rrom_ttcn3
autocmd FileType ttcn,ttcn3 :set tags+=~/tags/tupc_ttcn3
autocmd FileType ttcn,ttcn3 :set tags+=~/tags/uec_ttcn

