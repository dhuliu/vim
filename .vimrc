" This line should not be removed as it ensures that various options are
" properly set to work with the Vim-related packages available in Debian.
 
" Uncomment the next line to make Vim more Vi-compatible
" NOTE: debian.vim sets 'nocompatible'. Setting 'compatible' changes numerous
" options, so any other options should be set AFTER setting 'compatible'.
set nocompatible

" Vim5 and later versions support syntax highlighting. Uncommenting the
" following enables syntax highlighting by default.
if has("syntax")
syntax on " 
endif
"colorscheme ron " elflord ron peachpuff default 
highlight Function cterm=bold,underline ctermbg=red ctermfg=green


" detect file type
filetype on
filetype plugin on

" If using a dark background within the editing area and syntax highlighting
" turn on this option as well
set background=dark

" Uncomment the following to have Vim jump to the last position when
" reopening a file
if has("autocmd")
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
"have Vim load indentation rules and plugins according to the detected filetype
filetype plugin indent on
endif

" The following are commented out as they cause vim to behave a lot
" differently from regular Vi. They are highly recommended though.

set ffs=unix,dos,mac
set ignorecase "
"set smartcase 
set autowrite "
set autoindent "
"set smartindent " 
set tabstop=4 "
set softtabstop=4 " 
set shiftwidth=4 " 
set cindent "
set cinoptions={0,1s,t0,n-2,p2s,(03s,=.5s,>1s,=1s,:1s "
"set backspace=2 "
set showmatch "
set linebreak 
set whichwrap=b,s,<,>,[,] "
"set hidden " Hide buffers when they are abandoned
set mouse=a " Enable mouse usage (all modes) 
set number " Enable line number 
"set previewwindow " 
set history=50 " set command history to 50 "历史记录50条


set laststatus=2
set statusline=
set statusline+=%1*\ %<%F\ 
set statusline+=%8*\ %=\ %l/%L\ (%p%%)
set statusline+=%9*\ %c
"set statusline+=%l/%L\ \ 

set ruler 

set showcmd "Show (partial) command in status line. 
set showmode "Show matching brackets. 

"--find setting--
set incsearch " 
set hlsearch

set t_Co=256
let g:solarized_termcolors=256
colorscheme cterm
set fileencodings=utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1,ucs-bom,gbk

"-- Taglist setting --
let Tlist_Ctags_Cmd='ctags' 
let Tlist_Use_Right_Window=0 
let Tlist_Show_One_File=1 "
let Tlist_File_Fold_Auto_Close=1 "
let Tlist_Exit_OnlyWindow=1 

let Tlist_Process_File_Always=1 "
let Tlist_Inc_Winwidth=0
let Tlist_Auto_Open=1 "auto open tlist


"-- WinManager setting --
"let g:winManagerWindowLayout='FileExplorer|TagList' "
"let g:persistentBehaviour=0 " 
"nmap wm :WMToggle<cr>

" -- MiniBufferExplorer --
"let g:miniBufExplMapWindowNavVim = 1 " 
"let g:miniBufExplMapWindowNavArrows = 1 
"let g:miniBufExplMapCTabSwitchBufs = 1 " 
"let g:miniBufExplMapCTabSwitchWindows = 1 " 
"let g:miniBufExplModSelTarget = 1 " 


"--fold setting--
set foldmethod=syntax "
set foldlevel=100 " 
set foldcolumn=5 " 


"----tagbar---
let g:tagbar_left = 1
let g:tagbar_sort = 0

"cscope add
if has("cscope")  
   " set csprg=/usr/bin/cscope  
    set csto=0  
    set cst  
    set csverb  
    set cspc=3  
    "add any database in current dir  
    if filereadable("cscope.out")  
       silent! cs add cscope.out  
    "else search cscope.out elsewhere  
    else  
       let cscope_file=findfile("cscope.out", ".;")  
       let cscope_pre=matchstr(cscope_file, ".*/")  
       if !empty(cscope_file) && filereadable(cscope_file)  
           exe "silent ! cs add" cscope_file cscope_pre  
       endif        
     endif  
endif 

"map ctrl w j -> ctrl j
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-h> <C-w>h
map <C-l> <C-w>l

nmap <C-\>s :cs find s <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>g :cs find g <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>c :cs find c <C-R>=expand("<cword>")<CR><CR>
"nmap ft :cs find t <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>e :cs find e <C-R>=expand("<cword>")<CR><CR>
"nmap fn :cs find f <C-R>=expand("<cfile>")<CR><CR>
"nmap fi :cs find i <C-R>=expand("<cfile>")<CR><CR>
nmap <C-\>d :cs find d <C-R>=expand("<cword>")<CR><CR>


set ff=unix
set ffs=unix

"--ctags setting--
map <F5> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR><CR> :TlistUpdate<CR>
imap <F5> <ESC>:!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR><CR> :TlistUpdate<CR>
set tags=tags;
set tags+=./tags;
set tags+=/home/liliu/workspace/tinno/kernel/tags;
let NERDTreeWinPos=1
nmap <F2> :NERDTreeToggle<CR>
nmap <F3> :TagbarToggle<CR>
let g:tagbar_ctags_bin = 'ctags'
