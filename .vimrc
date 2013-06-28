set nocompatible " vi非互換
syntax on " 強調表示
colorscheme darkblue

set autoindent
set backspace=indent,eol,start
set expandtab
set nobackup
set hlsearch
set ignorecase
set incsearch
set laststatus=2
set list
set listchars=tab:>-
set ruler
set shiftwidth=2
set showcmd
set showmatch
set smartcase
set statusline=%<%f\ %m%r%h%w%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']'}%=%l,%c%V%8P
set tabstop=2
set wildmode=full:list
set clipboard=unnamed

filetype on
filetype indent on
filetype plugin on

:set encoding=utf-8
:set fileencodings=ucs-bom,iso-2022-jp-3,iso-2022-jp,eucjp-ms,euc-jisx0213,euc-jp,sjis,cp932,utf-8
