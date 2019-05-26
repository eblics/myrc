syntax enable
set nocompatible
set backspace=indent,eol,start
set tabstop=4
set softtabstop=4
set shiftwidth=4
set noswapfile
set nu
set si
set ai
let mapleader = ";"

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'Vundlevim/Vundle.vim'
Plugin 'ervandew/supertab'
Plugin 'altercation/vim-colors-solarized'
Plugin 'kien/ctrlp.vim'
Plugin 'Shougo/deoplete.nvim'
Plugin 'roxma/nvim-yarp'
Plugin 'roxma/vim-hug-neovim-rpc'
Plugin 'alvan/vim-php-manual'
Plugin 'shawncplus/phpcomplete.vim'
call vundle#end()  

" begion bundle configure
let g:solarized_termcolors=256
let g:deoplete#enable_at_startup = 1
let g:SuperTabDefaultCompletionType = "context"
" end bundle configure
"
filetype plugin on    " required

" begion keymaps 
nmap <silent> <leader>r :source ~/.vimrc<CR>
cnoremap <C-A> <Home>
inoremap <C-A> <ESC>^i
nnoremap <C-A> ^
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
nnoremap <silent> <C-S> :w<CR>
imap <C-S> <Esc>:w<CR>
imap jj <Esc> <C-S>
imap <C-e> <C-o>$
imap <C-a> <C-o>0
vnoremap v <Esc>
" end keymaps

set background=dark
colorscheme solarized
au FileType php set dictionary+=~/.myrc/php_funclist.txt
au FileType php set omnifunc=phpcomplete#CompletePHP
"autocmd FileType php set keywordprg=pman
autocmd FileType php set keywordprg=help
