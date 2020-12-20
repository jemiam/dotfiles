" vim-plug
source ~/.vimrc.vim-plug

set nocompatible
syntax on
"colorscheme darkblue
"filetype on
"filetype indent on
"filetype plugin on

set autoindent
set backspace=indent,eol,start
set directory=~/.vim/tmp
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
set wildmode=longest,list,full
set clipboard&
set clipboard^=unnamedplus
set iskeyword+=-
set undodir=~/.vim/undodir
set undofile

:set encoding=utf-8
:set fileencodings=utf-8,ucs-bom,iso-2022-jp-3,iso-2022-jp,eucjp-ms,euc-jisx0213,euc-jp,sjis,cp932

"pbcopy
vmap <C-c> :w !pbcopy<CR>

" auto complete
"inoremap { {}<LEFT>
"inoremap ( ()<LEFT>
"inoremap [ []<LEFT>
"inoremap < <><LEFT>
"inoremap " ""<LEFT>
"inoremap ' ''<LEFT>
"
"vnoremap { "zdi^V{<C-R>z}<ESC>
"vnoremap [ "zdi^V[<C-R>z]<ESC>
"vnoremap ( "zdi^V(<C-R>z)<ESC>
"vnoremap " "zdi^V"<C-R>z^V"<ESC>
"vnoremap ' "zdi'<C-R>z'<ESC>


" 80 column
if (exists('+colorcolumn'))
  set colorcolumn=80
  highlight ColorColumn ctermbg=1
endif

nmap ,r :r!cat<CR>

" auto mkidr
augroup vimrc-auto-mkdir  " {{{
  autocmd!
  autocmd BufWritePre * call s:auto_mkdir(expand('<afile>:p:h'), v:cmdbang)
  function! s:auto_mkdir(dir, force)  " {{{
    if !isdirectory(a:dir) && (a:force ||
    \    input(printf('"%s" does not exist. Create? [y/N]', a:dir)) =~? '^y\%[es]$')
      call mkdir(iconv(a:dir, &encoding, &termencoding), 'p')
    endif
  endfunction  " }}}
augroup END  " }}}

" QuickFix
autocmd QuickFixCmdPost *grep* cwindow

" tagsジャンプの時に複数ある時は一覧表示
nnoremap <C-]> g<C-]>

if has("mac")
    " mac用の設定
elseif has("unix")
    " unix固有の設定

    " vim終了時にレジスタをクリップボードに保存
    " https://stackoverflow.com/questions/6453595/prevent-vim-from-clearing-the-clipboard-on-exit/13576798
    autocmd VimLeave * call system("xclip -selection clipboard -i", getreg('+'))
elseif has("win64")
    " 64bit_windows固有の設定
elseif has("win32unix")
    " Cygwin固有の設定
elseif has("win32")
    " 32bit_windows固有の設定
endif

" sudo忘れたときに
" wで一瞬固まるので使わない
"cnoremap w!! w !sudo tee > /dev/null %
