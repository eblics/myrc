set encoding=utf-8
set nocompatible
set backspace=indent,eol,start  "enable backspace
set tabstop=4
set expandtab "expand tab to spaces
set softtabstop=4 "set num of spaces replacing the tab
set shiftwidth=4
set noswapfile    "disable swapfile   
set nu
set si
set ai
set sc    "in search mode, the Upper case will trigger the \C
set wildmenu  "auto completion in command mode
set wildmode=full
set hidden  "hidden can switch buffer without saving it
set incsearch    "display search result as typing
set hlsearch     "enable search highlight
set mouse=c      "change to c, so xshell can copy from vim
set textwidth=0           "don't wrap lines
set pastetoggle=<F3>
set ignorecase            "ignore case by default
set ve=all                "move cursor whereever I want, I like it
let mapleader =" "
syntax enable

" NerdTree is better, so remove netrw
" let g:netrw_liststyle = 3
" let g:netrw_browse_split = 4
" let g:netrw_altv = 1
" let g:netrw_winsize =10 

if has('pythonx')
    set pyxversion=3
endif
"augroup  pyxversion
"    autocmd!
"    autocmd VimEnter * :Vexplore
"augroup END

" use vim-plug to replace vundle, it's installed by below command
" curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
"     https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

call plug#begin()
"Plug 'scrooloose/syntastic'          "check the syntax of multiple languages
"Plug 'Shougo/deoplete.nvim'          "for auto-completion
"Plug 'roxma/nvim-yarp'               "as above
"Plug 'roxma/vim-hug-neovim-rpc'      "as above
Plug 'shawncplus/phpcomplete.vim'    "for php completion
Plug 'Valloric/YouCompleteMe'
Plug 'ervandew/supertab'
Plug 'altercation/vim-colors-solarized'
Plug 'tomasr/molokai'
Plug 'kien/ctrlp.vim'
Plug 'godlygeek/tabular'             "for alignment by sign like 'nner = 0
"Plug 'junegunn/vim-easy-align'       "very like tabular
"Plug 'scrooloose/nerdcommenter'      "a better commenter
Plug 'tomtom/tcomment_vim'           "comment
Plug 'tpope/vim-fugitive'            "for git
Plug 'tpope/vim-surround'            "for surrounding like '(,[' etc
Plug 'mileszs/ack.vim'               "ack as grep
Plug 'SirVer/ultisnips'              "for snippets
Plug 'honza/vim-snippets'            "for snippets
Plug 'scrooloose/nerdtree'           "file explorer
Plug 'vim-airline/vim-airline'       "status line
Plug 'vim-airline/vim-airline-themes'
Plug 'w0rp/ale'                      "like syntastic,but execute asyn
Plug 'majutsushi/tagbar'             "for ctags
Plug 'vobornik/vim-mql4'             "for mql4 language
Plug 'yggdroot/indentline'           "for lines with same intent
Plug 'tpope/vim-repeat'              "more support for repeating
"Plug 'svermeulen/vim-easyclip'       "better cut paste function
call plug#end()  

"------------------------------------for syntastic--------------------------------------------
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*
"
"let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 1
"let g:syntastic_check_on_open = 1
"let g:syntastic_check_on_wq = 0
"------------------------------------for syntastic--------------------------------------------

nmap <silent> gs <plug>SubstituteOverMotionMap
nmap gss <plug>SubstituteLine


" enable tabline of airline
let g:airline#extensions#tabline#enabled = 1
" begion bundle configure
let g:solarized_termcolors=256
let g:python3_host_prog="/usr/bin/python3"
let g:deoplete#enable_at_startup = 1
let $NVIM_PYTHON_LOG_FILE="/tmp/nvim_log"
let $NVIM_PYTHON_LOG_LEVEL="DEBUG"
"let g:SuperTabDefaultCompletionType = "<c-x><c-o>"
let g:SuperTabDefaultCompletionType = "context"

"let g:UltiSnipsListSnippets="<c-e>"
"let g:UltiSnipsExpandTrigger="<tab>"
" let g:UltiSnipsExpandTrigger="<c-k>"
let g:UltiSnipsExpandTrigger="ii"
let g:UltiSnipsListSnippets="iI"
"let g:UltiSnipsJumpForwardTrigger="<c-b>"
"let g:UltiSnipsJumpBackwardTrigger="<c-z>"

"------------for syntastic----------------------
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*


"------------for tags----------------------
set tags=tags;
set autochdir

" let g:syntastic_always_populate_loc_list = 1
" let g:syntastic_auto_loc_list = 1
" let g:syntastic_check_on_open = 1
" let g:syntastic_check_on_wq = 0
"------------for syntastic----------------------

let g:ycm_global_ycm_extra_conf = '~/.vim/plugged/YouCompleteMe/cpp/ycm/.ycm_extra_conf.py'
let g:ycm_seed_identifiers_with_syntax = 1  "C/C++关键字自动补全
"let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
"let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
let g:ycm_autoclose_preview_window_after_completion=1
nnoremap <leader>g :YcmCompleter GoToDefinitionElseDeclaration<CR>
"let g:ycm_key_invoke_completion = '<c-z>'
"auto trigger in each filetypes
"\ 'php': ['re!\w{2}'],
let g:ycm_semantic_triggers =  {
			\ 'c,cpp,python,java,go,erlang,perl': ['re!\w{2}'],
			\ 'cs,lua,javascript': ['re!\w{2}'],
			\ }
set completeopt=longest,menu


let g:ale_sign_column_always = 1
let g:ale_set_highlights = 0
""自定义error和warning图标
"let g:ale_sign_error = '✗'
"let g:ale_sign_warning = '⚡'
""在vim自带的状态栏中整合ale
"let g:ale_statusline_format = ['✗ %d', '⚡ %d', '✔ OK']
""显示Linter名称,出错或警告等相关信息
"let g:ale_echo_msg_error_str = 'E'
"let g:ale_echo_msg_warning_str = 'W'
"let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'

"----------------NerdTree------------------------
autocmd vimenter * NERDTree
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] |endif
"auto enter the main window to edit
autocmd vimenter * wincmd l
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
map <F2> :NERDTreeToggle<CR>
"----------------NerdTree------------------------

" If you want :UltiSnipsEdit to split your window.
" let g:UltiSnipsEditSplit="vertical"
" end bundle configure
"
filetype plugin on    " required

" begion keymaps 
nmap <silent> <leader>r :source ~/.vimrc<CR>
"cnoremap <C-A> <Home>
inoremap <C-A> <ESC>^i
nnoremap <C-A> ^
nmap <F8> :TagbarToggle<CR>
nnoremap <Leader>e :Ve<CR> 
cnoremap <C-A> <HOME>
cnoremap <C-E>  <END>
cnoremap <C-D>  <DEL>
noremap <C-E> <End>
cnoremap <C-F> <Right>
cnoremap <C-B> <Left>
cnoremap <Esc>b <S-Left>
cnoremap <Esc>f <S-Right>
inoremap <C-D> <Del>
inoremap <c-f> <Right>
noremap <leader>y "*y
noremap <leader>yy "*Y
noremap <leader>p :set paste<CR>:put *<CR>:set nopaste<CR>
nnoremap <silent> <C-l> :<C-u>nohlsearch<CR><C-l>                       "set nohlsearch
nnoremap <silent> <C-S> :w<CR>
imap <C-S> <Esc>:w<CR>
imap jj <Esc> <C-S>
imap <C-e> <C-o>$
imap <C-a> <C-o>0
vnoremap v <Esc>
cnoremap <expr> %% getcmdtype() == ':' ? expand('%:h').'/' : '%%'   "expand current buffer path, see :h ::h
" end keymaps

"set background=dark
 " colorscheme solarized
colorscheme molokai
"au FileType php set dictionary+=~/.myrc/php_funclist.txt
au FileType php set omnifunc=phpcomplete#CompletePHP
autocmd FileType php set keywordprg=:help   "autocmd FileType php set keywordprg=pman
" autocmd FileType php nnoremap <buffer> K :help <C-R><C-W><CR>

xnoremap * :<C-u>call <SID>VSetSearch()<CR>/<C-R>=@/<CR><CR>
xnoremap # :<C-u>call <SID>VSetSearch()<CR>?<C-R>=@/<CR><CR>
function! s:VSetSearch()
    let temp = @s
    norm! gv"sy
    let @/ = '\V' . substitute(escape(@s, '/\'), '\n', '\\n', 'g')
    let @s = temp
endfunction

inoremap <silent> <Bar>   <Bar><Esc>:call <SID>align()<CR>a
function! s:align()
  let p = '^\s*|\s.*\s|\s*$'
  if exists(':Tabularize') && getline('.') =~# '^\s*|' && (getline(line('.')-1) =~# p || getline(line('.')+1) =~# p)
    let column = strlen(substitute(getline('.')[0:col('.')],'[^|]','','g'))
    let position = strlen(matchstr(getline('.')[0:col('.')],'.*|\s*\zs.*'))
    Tabularize/|/l1
    normal! 0
    call search(repeat('[^|]*|',column).'\s\{-\}'.repeat('.',position),'ce',line('.'))
  endif
endfunction
if exists(":Tabularize")
    nmap <Leader>tt :Tabularize /<Bar><CR>
    vmap <Leader>tt :Tabularize /<Bar><CR>
    nmap <Leader>t= :Tabularize /=<CR>
    vmap <Leader>t= :Tabularize /=<CR>
    nmap <Leader>t: :Tabularize /:\zs<CR>
    vmap <Leader>t: :Tabularize /:\zs<CR>
    nmap <Leader>t, :Tabularize /,\zs<CR>
    vmap <Leader>t, :Tabularize /,\zs<CR>
    nmap <Leader>t> :Tabularize /=>\zs<CR>
    vmap <Leader>t> :Tabularize /=>\zs<CR>
endif

if exists(":Ack")
    let g:ackhighlight = 1
endif

if has('win32')
    set guifont=Courier_New:h9
    set encoding=utf-8
    set fileencoding=utf-8
    "source $VIMRUNTIME/delmenu.vim
    source $VIMRUNTIME/menu.vim
    language messages zh_CN.utf-8
    let g:ycm_global_ycm_extra_conf = '~\vimfiles\plugged\YouCompleteMe\third_party\ycmd\.ycm_extra_conf.py'
    let g:ycm_key_invoke_completion = '<c-z>'
    let g:ycm_server_keep_logfiles = 1
    let g:ycm_server_log_level = 'debug'
endif
