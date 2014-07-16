"set number
set nocompatible
set autoindent
set smartindent
set whichwrap=b,s,h,l,<,>,[,]
set showmatch
set showmode
set encoding=utf-8 nobomb
set ruler
set title
set showcmd
set tabstop=4
set shiftwidth=4
set expandtab
set backupskip=/tmp/*,/private/tmp/*
syntax on

colorscheme wombat

autocmd FileType php,ctp,tpl :set dictionary=~/.vim/dict/php.dict

set ignorecase
set smartcase
set wrapscan

filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'
filetype plugin indent on 

"Bundle 'nathanaelkane/vim-indent-guides'
"let g:indent_guides_enable_on_vim_startup=1
"let g:indent_guides_start_level=2
"let g:indent_guides_auto_colors=0
"autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=#262626 ctermbg=gray
"autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=#3c3c3c ctermbg=darkgray
"let g:indent_guides_color_change_percent = 30
"let g:indent_guides_guide_size = 1
