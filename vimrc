" Use Vim settings, rather then Vi settings. This setting must be as early as
" possible, as it has side effects.
set nocompatible

" Leader
let mapleader = " "

set hidden
set backspace=2   " Backspace deletes like most programs in insert mode
set nobackup
set nowritebackup
set noswapfile    " http://robots.thoughtbot.com/post/18739402579/global-gitignore#comment-458413287
set history=50
set showcmd       " display incomplete commands
set cursorline
set incsearch     " do incremental searching
set laststatus=2  " Always display the status line
set autowrite     " Automatically :write before running commands
set nowrap        " dont wrap words
set scrolloff=10

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if (&t_Co > 2 || has("gui_running")) && !exists("syntax_on")
  syntax on
endif

if &compatible
  set nocompatible
end

filetype off
set rtp+=~/.vim/bundle/Vundle.vim/
call vundle#begin()

" Let Vundle manage Vundle
Plugin 'gmarik/Vundle.vim'

" Define bundles via Github repos
" ctrlp with faster matcher
Plugin 'kien/ctrlp.vim'
Plugin 'FelikZ/ctrlp-py-matcher'

Plugin 'pbrisbin/vim-mkdir'
Plugin 'tpope/vim-fugitive'

" Ruby and Rails plugins
Plugin 'vim-ruby/vim-ruby'
Plugin 'tpope/vim-rails'

Plugin 'vim-scripts/tComment'
Plugin 'bling/vim-airline'
Plugin 'wesQ3/vim-windowswap'
Plugin 'tpope/vim-endwise'

Plugin 'rking/ag.vim'

" GoLang
Plugin 'fatih/vim-go'

" color schemes
Plugin 'nanotech/jellybeans.vim'

call vundle#end()
filetype on

filetype plugin indent on

augroup vimrcEx
  autocmd!

  " When editing a file, always jump to the last known cursor position.
  " Don't do it for commit messages, when the position is invalid, or when
  " inside an event handler (happens when dropping a file on gvim).
  autocmd BufReadPost *
    \ if &ft != 'gitcommit' && line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif

  " Set syntax highlighting for specific file types
  autocmd BufRead,BufNewFile Appraisals set filetype=ruby
  autocmd BufRead,BufNewFile *.md set filetype=markdown

  " Enable spellchecking for Markdown
  autocmd FileType markdown setlocal spell

  " Automatically wrap at 80 characters for Markdown
  autocmd BufRead,BufNewFile *.md setlocal textwidth=80

  " Allow stylesheets to autocomplete hyphenated words
  autocmd FileType css,scss,sass setlocal iskeyword+=-

  " set tab width for Go Lang
  autocmd FileType go setlocal shiftwidth=8 tabstop=8
augroup END

" Softtabs, 2 spaces
set tabstop=2
set shiftwidth=2
set shiftround
set expandtab

" get rid of last search highlight
nnoremap <CR> :noh<CR>

" Use The Silver Searcher https://github.com/ggreer/the_silver_searcher
if executable('ag')
  " Use Ag over Grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
  " ag is fast enough that CtrlP doesn't need to cache
  " let g:ctrlp_use_caching = 0

  " Set delay to prevent extra search
  let g:ctrlp_lazy_update = 50
  let g:ctrlp_match_func = { 'match' : 'pymatcher#PyMatch' }

  let g:ctrlp_clear_cache_on_exit = 0
  let g:ctrlp_custom_ignore = {
    \ 'dir':  '\.git$|\.yardoc\|public$|log\|tmp$',
    \ 'file': '\.so$\|\.dat$|\.DS_Store$|\.jpg$',
    \ }
endif

" Numbers
set number
set numberwidth=5

" Tab completion
" will insert tab at beginning of line,
" will use completion if not at beginning
set wildmode=list:longest,list:full
function! InsertTabWrapper()
    let col = col('.') - 1
    if !col || getline('.')[col - 1] !~ '\k'
        return "\<tab>"
    else
        return "\<c-p>"
    endif
endfunction
inoremap <Tab> <c-r>=InsertTabWrapper()<cr>
inoremap <S-Tab> <c-n>

" Switch between the last two files
nnoremap <leader><leader> <c-^>

" Get off my lawn
nnoremap <Left> :echoe "Use h"<CR>
nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up> :echoe "Use k"<CR>
nnoremap <Down> :echoe "Use j"<CR>

" Treat <li> and <p> tags like the block tags they are
let g:html_indent_tags = 'li\|p'

" Open new split panes to right and bottom, which feels more natural
set splitbelow
set splitright

" Quicker window movement
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

" Always use vertical diffs
set diffopt+=vertical

colorscheme jellybeans
let &t_Co=256

" wildmenu
set wildmenu
set wildmode=full

" turn off mouse
set mouse=c

" highlight search results
set hlsearch


set textwidth=0
set colorcolumn=0

" some intendation fixes
set smartindent

set ignorecase
set smartcase
" insert binding.pry easily
nnoremap <c-a> orequire 'pry'; binding.pry<Esc>
inoremap <c-a> require 'pry'; binding.pry<Esc>

