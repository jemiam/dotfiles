call plug#begin('~/.config/nvim/plugged')

Plug 'bronson/vim-trailing-whitespace'
"Plug 'vim-ruby/vim-ruby'
"Plug 'python-mode/python-mode', { 'branch': 'develop' }
Plug 'rust-lang/rust.vim'
Plug 'elixir-lang/vim-elixir'
Plug 'chase/vim-ansible-yaml'
Plug 'hashivim/vim-terraform'
Plug 'stephpy/vim-yaml'
Plug 'Vimjas/vim-python-pep8-indent'
"Plug 'dense-analysis/ale'
Plug 'tpope/vim-surround'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
"Plug 'vim-syntastic/syntastic'
" Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'tyru/open-browser.vim'
Plug 'tyru/open-browser-github.vim'

" https://mattn.kaoriya.net/software/vim/20191231213507.htm
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'
Plug 'prabirshrestha/vim-lsp'
Plug 'mattn/vim-lsp-settings'
Plug 'mattn/vim-lsp-icons'
Plug 'mattn/vim-goimports'

Plug 'hrsh7th/vim-vsnip'
Plug 'hrsh7th/vim-vsnip-integ'

call plug#end()

source ~/.config/nvim/vim-lsp.vim
source ~/.config/nvim/rust.vim
source ~/.config/nvim/vim-gitgutter.vim

"" python-mode
"let g:pymode_python = 'python3'

"" ale
"let g:ale_fixers = {
"\   'ruby': ['rubocop'],
"\}

"" syntastic
" let g:syntastic_python_checkers = ['pyflakes', 'pep8']
