set tabstop=4
set softtabstop=1
set shiftwidth=4
set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()
Plugin 'Vundlevim/Vundle.vim'
Plugin 'ervandew/supertab'
Plugin 'altercation/vim-colors-solarized'
Plugin 'kien/ctrlp.vim'
call vundle#end()  
filetype plugin on    " required

"my normal map keys
nmap <silent> ;r :source ~/.vimrc<CR>
