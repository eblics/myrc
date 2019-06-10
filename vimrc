syntax enable
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
set mouse=a
set textwidth=0           "don't wrap lines
let mapleader =" "
set pastetoggle=<F3>

" NerdTree is better, so remove netrw
" let g:netrw_liststyle = 3
" let g:netrw_browse_split = 4
" let g:netrw_altv = 1
" let g:netrw_winsize =10 

if has('pythonx')
    set pyxversion=3
endif
"augroup ProjectDrawer
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

call plug#end()  

" enable tabline of airline
let g:airline#extensions#tabline#enabled = 1
" begion bundle configure
let g:solarized_termcolors=256
let g:python3_host_prog="/usr/bin/python3"
let g:deoplete#enable_at_startup = 1
let $NVIM_PYTHON_LOG_FILE="/tmp/nvim_log"
let $NVIM_PYTHON_LOG_LEVEL="DEBUG"
let g:SuperTabDefaultCompletionType = "context"

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

" let g:syntastic_always_populate_loc_list = 1
" let g:syntastic_auto_loc_list = 1
" let g:syntastic_check_on_open = 1
" let g:syntastic_check_on_wq = 0
"------------for syntastic----------------------

let g:ycm_global_ycm_extra_conf = '~/.vim/plugged/YouCompleteMe/cpp/ycm/.ycm_extra_conf.py'
let g:ycm_key_invoke_completion = '<c-z>'
let g:ycm_semantic_triggers =  {
			\ 'c,cpp,python,java,go,erlang,perl': ['re!\w{2}'],
			\ 'cs,lua,javascript': ['re!\w{2}'],
			\ }
set completeopt=longest,menu

nmap <F8> :TagbarToggle<CR>

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
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif
"autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
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
au FileType php set dictionary+=~/.myrc/php_funclist.txt
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

" Below is some good tips for vim, see the book "Practical vim edit text as the speed of thought"
" | :%normal A;"                                    | "execute normal command in command mode.                                           |
" | :exe "normal! gg/foo<cr>dd"                     | "execute normal command in command mode.                                           |
" | @:                                              | "repeat last command                                                               |
" | @[x]                                            | "execute macro in register [x]                                                     |
" | @@                                              | "repeat last macro used recently                                                   |
" | q:                                              | "open command history                                                              |
" | q/                                              | "open search history                                                               |
" | i_ctrl_r                                        | "expression register                                                               |
" | <c-d>                                           | "wildmenu for command                                                              |
" | q<x>q                                           | "record a macro(running in normal mode)                                            |
" | write                                           | like & in shell                                                                    |
" | z<x>                                            | "z normal commands, most for fold                                                  |
" | read !ls                                        | "read from shell command                                                           |
" | write !sh                                       | "execute buffer in shell                                                           |
" | :2,$!sort -t',' -k2                             | "sort the lines with external command sort from line 2 to end                      |
" | !G                                              | "jump in command window, and execute external command from current line to end     |
" | vim -u NONE -N                                  | "open vim without user defined .vimrc                                              |
" | ex_%                                            | "current file                                                                      |
" | ex_.                                            | "current line                                                                      |
" | N,M bdelete                                     | "delete buffer from N to M                                                         |
" | [a ]a  [t  ]t [q q[ [t t[                       | "arg, tag, quickfix, tag                                                           |
" | :h cmdline-special                              | "speical chars in command line                                                     |
" | :h ::h                                          | " as above something chars in command line                                         |
" | :h tabpage                                      | "help for page                                                                     |
" | :h window                                       | "help for window                                                                   |
" | :h file-searching                               |                                                                                    |
" | :h changelist                                   |                                                                                    |
" | :h /character-classes                           |                                                                                    |
" | :h visual-search                                | "search in visual mode                                                             |
" | :h search-offset                                | "search offset like 'e' to the end of match                                        |
" | :h mapmode-x                                    |                                                                                    |
" | :h s_flags                                      |                                                                                    |
" | :h sub-replace-special                          |                                                                                    |
" | :h tag-stack                                    |                                                                                    |
" | :h tag-priority                                 |                                                                                    |
" | :h 'infercase'                                  | "help for infercase                                                                |
" | :h compl-current                                |                                                                                    |
" | :h compl-keyword                                |                                                                                    |
" | :h 'include'                                    |                                                                                    |
" | :h compl-tag                                    |                                                                                    |
" | :h 'complete'                                   |                                                                                    |
" | :h _##                                          | "'#' present file name in the argumment list                                       |
" | <c-w>T                                          | "use current window as tab                                                         |
" | gt                                              | "jump to next tab                                                                  |
" | lcd <path>                                      | "change work directory to path                                                     |
" | set path+=                                      | "the 'find' command will start with                                                |
" | <c-G>                                           | "show the status of current buffer                                                 |
" | argdo                                           | "execute command on every file in `args`                                           |
" | bufdo                                           | "like argdo,bug in all buffers                                                     |
" | f<char> ; ,                                     | "find a char ;for repeating forward, '.' for going back                            |
" | aw                                              | "word                                                                              |
" | viw vi} vaw va} etc                             | "jump inner word/tag                                                               |
" | ci" cit etc                                     | "delete word in tags or quotes or something, and replace it with something         |
" | :h mark-motions                                 | "help for marks                                                                    |
" | ``                                              | "Position before the last jump within current file                                 |
" | `.                                              | "Location of last change                                                           |
" | `^                                              | "Location of last insertion                                                        |
" | `[                                              | "Start of last change or yank                                                      |
" | `]                                              | "End of last change or yank                                                        |
" | `<                                              | "Start of last visual selection                                                    |
" | `>                                              | "End of last visual selection                                                      |
" | g;  g,                                          | "jump between changelist                                                           |
" | gi                                              | "jump to last change pos                                                           |
" | jumps                                           | "jump list                                                                         |
" | <c-]>                                           | "jump to keywork                                                                   |
" | _d{motion}                                      | "delete without coping into register                                               |
" | delete c                                        | "delete line and put into register 'c'                                             |
" | :yank                                           | "yank command                                                                      |
" | "0P                                             | "paste the content of yank register, which is register 1                           |
" | %                                               | "Name of the current file                                                          |
" | #                                               | "Name of the alternate file                                                        |
" | .                                               | "Last inserted text                                                                |
" | :                                               | "Last Ex command                                                                   |
" | /                                               | "Last search pattern                                                               |
" | set pastetoggle=<f5>                            | "set paste off and on                                                              |
" | "+p                                             | "paste from system clipboard                                                       |
" | qa qA                                           | "the second will append keystrokes to reg 'a'                                      |
" | :let @a=substitute(@a, '\~', 'vU', 'g')         | "substitute with reg[a]                                                            |
" | /\c /\C                                         | "case insensitive and insentive                                                    |
" | /\m /\M                                         | "search magic or nonmagic, the former will explain '. *' chars as special meaning. |
" | /\v \V                                          | "very magic & nonmagic, very same as m/M                                           |
" | /\v<the>                                        | "char '<>' is zero width delimter for boundary                                     |
" | h \zs \ze  etc                                  | "some zero width delimeter                                                         |
" | /\v"\zs[^"]+\ze"<CR>                            | "zs and ze will exclude quate                                                      |
" | /\v%(AndD)rew Neil/                             | "% denote not capturing this subgroup                                              |
" | /<something>  then :%s//g                       | "first search, then substitude, this is very useful                                |
" | =escape(@u, getcmdtype().'\')                   | "escape string                                                                     |
" | /\v"@<=[^"]+"@=                                 | "postive searching                                                                 |
" | incsearch                                       |                                                                                    |
" | ?<string>                                       | "backforward searching                                                             |
" | :%s///gn                                        | "count the lines of file                                                           |
" | //                                              | "use the previous search                                                           |
" | <C-r>/                                          | "put the last search pattern to buffer                                             |
" | :%s/<C-r>//“\1”/g                               | "use search pattern to substitute                                                  |
" | :%s//\=@0/g                                     | "use reg[0] to replace match                                                       |
" | g&                                              | "repeate substitude entire file,equivelent with::%s//~/&                           |
" | &&                                              | "use last substitute,and use the last flag                                         |
" | :%s//\=submatch(0)-1/g                          | "use submatch result express to do substitude                                      |
" | :%s//\={"dog":"man"}[submatch(1)]/g             | "swap 'dog' and 'man'                                                              |
" | :argdo %s//Practical/ge                         | "the 'e' flag suppress error                                                       |
" | :[range] global[!] /{pattern}/ [cmd]            | "execute cmd with global, vglobal dose the opposite                                |
" | :g/{/ .+1,/}/-1 sort                            | "match {} block and sort                                                           |
" | :g/{/sil .+1,/}/-1 >                            | "intent these lines, and don't echo messages using sil                             |
" | :!ctags -R                                      | "generate tags file                                                                |
" | :autocmd BufWritePost * call system("ctags -R") | "auto remake tags file when write.                                                 |
" | <C-]> g<C-]>                                    | "jump to tag, when there are multiple matched tags, the later will open a list     |
" | K                                               | "open manual                                                                       |
" | <C-t>                                           | "jump to last tag                                                                  |
" | :tag <keyword><pattern>                         | "same as <C-]>                                                                     |
" | :tjump <keyword> <pattern>                      | "same as g<C-]>                                                                    |
" | :pop or <C-t>                                   | "Reverse through tag history                                                       |
" | :tag                                            | "Advance through tag history                                                       |
" | :tnext                                          | "Jump to next matching tag                                                         |
" | :tprev                                          | "Jump to previous matching tag                                                     |
" | :tfirst                                         | "Jump to first matching tag                                                        |
" | :tlast                                          | "Jump to last matching tag                                                         |
" | :tselect                                        | "Prompt user to choose an item from the tag match list                             |
" | make!                                           | "make and don't jump to the first error, the '!' makes sure of it                  |
" | :cnext                                          | "Jump to next item                                                                 |
" | :cprev                                          | "Jump to previous item                                                             |
" | :cfirst                                         | "Jump to first item                                                                |
" | :clast                                          | "Jump to last item                                                                 |
" | :cnfile                                         | "Jump to first item in next file                                                   |
" | :cpfile                                         | "Jump to last item in previous file                                                |
" | :cc N                                           | "Jump to nth item                                                                  |
" | :copen                                          | "Open the quickfix window                                                          |
" | :cclose                                         | "Close the quickfix window                                                         |
" | :cnewer                                         | "open the newer quickfix list                                                      |
" | :colder                                         | "open the older quickfix list                                                      |
" | :lmake lvimgrep lgrep                           | "use the location list, it's saying that every buffer has its own quickfix list.   |
" | :setlocal makeprg=                              | "change default make programe                                                      |
" | :setlocal efm=                                  | "change default error format generated by making program                           |
" | :compiler nodelint                              | "change the default compiler, the result is same with above two commands.          |
" | :args $VIMRUNTIME/compiler/*.vim                | "see the compilers supported by vim                                                |
" | :grep -n Waldo *                                | "show the match num when using grep                                                |
" | let grepprg="grep -n $* /dev/null               |                                                                                    |
" | let grepformat="%f:%l:%m,%f:%l%m,%f %l%m        |                                                                                    |
" | ack --nogroup --column Waldo *                  | "display results as rows and gives column's number                                 |
" | <C-e>                                           | "dismiss the completion window                                                     |
" | :ls!                                            | "list all words in files, so can be popped up in completion window                 |
" | :set complete-=i                                | "set completion will find in                                                       |
" | :set spell                                      | "change the spell                                                                  |
" | [s ]s                                           | "jump between spell errors                                                         |
" | z=  1z=                                         | "open a suggesting words for error spells. the later will use the first one.       |
" | zg                                              | "Add current word to spell file                                                    |
" | zw                                              | "Remove current word from spell file                                               |
" | zug                                             | "Revert zg or zw command for current word                                          |
" | :cd -                                           | "go to the old directory                                                           |
" | :h :cd-                                         |
" | :messages                                       | see the error during load vim script files                                         |
" | vim $(fzf)                                      | use vim to edit the file filtered by fzf                                           |



""	for quickfix_item in getqflist()
"	let buffer_numbers[quickfix_item['bufnr']] = bufname(quickfix_item['bufnr'])
"	endfor
"	return join(map(values(buffer_numbers), 'fnameescape(v:val)'))
"endfunction
