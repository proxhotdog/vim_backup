"Author: proxhotdog
"Description: my personal vimrc configuration, works on Ubuntu and partially on MacOSX

"Basic settings
set t_Co=256
set encoding=utf-8
set number
set hlsearch
set cursorline
set cursorcolumn
set history=500

"No swap or backup files
set nobackup
set noswapfile

"Tab configuration
set tabstop=4
set shiftwidth=4
set expandtab
set softtabstop=4
set smarttab

"Show hidden characters
set list
set listchars=eol:¬,tab:>-,trail:-,extends:>,precedes:<

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

Bundle 'JuliaLang/julia-vim'
Bundle 'kien/ctrlp.vim'
Bundle 'tpope/vim-fugitive'
Bundle 'jiangmiao/auto-pairs'
Bundle 'bling/vim-airline'
set laststatus=2
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
set guifont=DejaVu\ Sans\ Mono\ for\ Powerline\ 10

Bundle 'kien/rainbow_parentheses.vim'
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

Bundle 'junegunn/vim-easy-align'
Bundle 'vim-scripts/human.vim'
Bundle 'vim-scripts/Syntax-for-Fasta'
au BufRead,BufNewFile *.fas set filetype=fasta

"Disable vim-endwise to prevent clash
"Bundle 'tpope/vim-endwise'
Bundle "MarcWeber/vim-addon-mw-utils"
Bundle "tomtom/tlib_vim"
"Bundle "garbas/vim-snipmate"
"Bundle "honza/vim-snippets"
Bundle "thoughtbot/vim-rspec"
" RSpec.vim mappings
map <Leader>t :call RunCurrentSpecFile()<CR>
map <Leader>s :call RunNearestSpec()<CR>
map <Leader>l :call RunLastSpec()<CR>
map <Leader>a :call RunAllSpecs()<CR>

Bundle 'sudar/vim-arduino-syntax'
au BufRead,BufNewFile *.pde set filetype=arduino
au BufRead,BufNewFile *.ino set filetype=arduino

Bundle 'plasticboy/vim-markdown'
Bundle 'vim-scripts/yaml.vim'
Bundle 'kana/vim-fakeclip'
Bundle 'salsifis/vim-transpose'

function RunWith (command)
    execute "w"
    execute "!clear;time " . a:command . " " . expand("%")
endfunction

autocmd FileType ruby nmap <F5> :call RunWith("ruby")<cr>
autocmd FileType perl nmap <F5> :call RunWith("perl")<cr>
autocmd FileType python nmap <F5> :call RunWith("python")<cr>
autocmd BufRead *_spec.rb nmap <F6> :w\|!clear && rspec % --format documentation --color<cr>
autocmd FileType julia nmap <F5> :call RunWith("julia")<cr>

filetype plugin indent on
syntax enable

"auto reload vimrc
autocmd BufWritePost .vimrc source %

