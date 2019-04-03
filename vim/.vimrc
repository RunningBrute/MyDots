set ts=4           "tab = 4 spaces
set autoindent     "auto ident filetype
set softtabstop=4 shiftwidth=4 expandtab "insert 4 spaces instead of tab
set nowrap         "noline wrape
set guioptions+=b  "botom scrolbar
set guioptions-=T  "remove iconbar
set number         "show line number
set history=50     "length of history
set incsearch      "increment search
set showcmd        "show typing comand
set cindent shiftwidth=4   "automatyczne wcięcia o głębokości 4
set nobackup       "no backup files
set nowritebackup  "only in case you don't want a backup file while editing
set noswapfile     "no swap files
set mouse=a

syntax enable      "enable syntax




"----------  COLOR SCHEMES ----------
"   located in ($HOME/.vim/colors/)
"
"colorscheme blaquemagick
"colorscheme fahrenheit
"colorscheme monokai
"colorscheme moria
colorscheme aldmeris




"---------- KEYBOARD SHORTCUTS ----------
"
" from windows - CTRL + (C, V, Z, X)"
source $VIMRUNTIME/mswin.vim
behave mswin

" remove whitespaces form end of line
map <F12> :%s/\s*$//g<CR>

