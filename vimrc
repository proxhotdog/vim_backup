set number
set encoding=utf-8
set t_Co=256
set hlsearch
set cursorline
set history=500
set nobackup
set noswapfile
set tabstop=4
set shiftwidth=4
set expandtab
set softtabstop=4
set list
set listchars=eol:$,tab:>-,trail:.,extends:>,precedes:<,nbsp:_
set smarttab

"For Vundle set up
filetype off
set rtp+=~/.vim/bundle/vundle
call vundle#rc()

"Plugin management area
Bundle 'gmarik/vundle'
Bundle 'flazz/vim-colorschemes'
if filereadable(expand("$HOME/.vim/bundle/vim-colorschemes/README.md"))
    colorscheme kolor
endif

Bundle 'kien/ctrlp.vim'
Bundle 'tpope/vim-fugitive'
Bundle 'jiangmiao/auto-pairs'
Bundle 'bling/vim-airline'
set laststatus=2
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'

Bundle 'kien/rainbow_parentheses.vim'
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

Bundle 'junegunn/vim-easy-align'
Bundle 'vim-scripts/human.vim'
Bundle 'vim-scripts/Syntax-for-Fasta'
au BufRead,BufNewFile *.fas set filetype=fasta

Bundle 'tpope/vim-endwise'
Bundle 'sudar/vim-arduino-syntax'
au BufRead,BufNewFile *.pde set filetype=arduino
au BufRead,BufNewFile *.ino set filetype=arduino

Bundle 'plasticboy/vim-markdown'
Bundle 'vim-scripts/yaml.vim'
filetype plugin indent on
syntax enable

"auto reload vimrc
autocmd BufWritePost .vimrc source %

