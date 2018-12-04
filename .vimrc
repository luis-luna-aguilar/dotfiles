" Makes sure there are no commands bound to any events at this point
autocmd!

" Use Vim settings, rather then Vi settings (much better!).
set nocompatible

" Required for Vundle
filetype off

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

  " let Vundle manage Vundle, required
  Plugin 'gmarik/Vundle.vim'
  Plugin 'thoughtbot/vim-rspec'
  Plugin 'tpope/vim-fugitive'
  Plugin 'tpope/vim-rails'
  Plugin 'tpope/vim-bundler'
  Plugin 'tpope/vim-cucumber'
  Plugin 'tpope/vim-endwise'
  Plugin 'vim-scripts/TailMinusF'
  Plugin 'MarcWeber/vim-addon-mw-utils'
  Plugin 'garbas/vim-snipmate'
  Plugin 'honza/vim-snippets'
  Plugin 'tomtom/tcomment_vim'
  Plugin 'tomtom/tlib_vim'
  Plugin 'lmeijvogel/vim-yaml-helper'
  Plugin 'kchmck/vim-coffee-script'
  Plugin 'vim-ruby/vim-ruby'
  Plugin 'skwp/vim-spec-finder'
  Bundle 'slim-template/vim-slim.git'
  Bundle 'mattn/webapi-vim'
  Bundle 'mattn/gist-vim'

" All of your Plugins must be added before the following line
call vundle#end()

" Only do this part when compiled with support for autocommands.
if has("autocmd")
  " Enable file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting.
  filetype plugin indent on

  " Set File type to 'text' for files ending in .txt
  autocmd BufNewFile,BufRead *.txt setfiletype text

  " Enable soft-wrapping for text files
  autocmd FileType text,markdown,html,xhtml,eruby setlocal wrap linebreak nolist

  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
  au!

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif

  " Automatically load .vimrc source when saved
  autocmd BufWritePost .vimrc source $MYVIMRC

  augroup END

else

  set autoindent		" always set autoindenting on

endif " has("autocmd")

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

set nobackup   "doesn't save backups of overwritten files
set nowritebackup
set history=50   " keep 50 lines of command line history
set ruler   " show the cursor position all the time
set showcmd   " display incomplete commands
set incsearch  " do incremental searching
set relativenumber   "set relative ruler to the cursor

set autoindent " Indentation
set smartindent
set dir=~/.vim/tmp

" Don't use Ex mode, use Q for formatting
" (Ex Mode is used for batch processing)
map Q gq

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if (&t_Co > 2 || has("gui_running")) && !exists("syntax_on")
  syntax on
  set hlsearch
endif

" Softtabs, 2 spaces
set tabstop=2
set shiftwidth=2
set expandtab

" Always display the status line
set laststatus=2

" is the leader character
let mapleader = " "

" Leader Shortcuts

" Yank all file
map <Leader>ca :%y+ <CR>
" Yank all file to Public Registry
map <Leader>cp :%y* <CR>
" Opens the file explorer
map <Leader>e :Explore<CR>
" Hide search highlighting
map <Leader>nh :set invhls<CR>
" Run current spec file
map <Leader>t :call RunCurrentSpecFile()<CR>
" Run nearest spec to current line
map <Leader>tl :call RunNearestSpec()<CR>
" Copy Full Path for YAML entry
map <Leader>cy :YamlGetFullPath<CR>
" Save with Space + s
map <Leader>s :w<CR>
" Exits insert mode with double j
imap jj <Esc>
" Deletes with jk combination
imap jk <Delete>
" Enter for new line in commands mode
nmap <S-Enter> O<Esc>

" For Haml
au! BufRead,BufNewFile *.haml         setfiletype haml

" Display extra whitespace
set list listchars=tab:»·,trail:·

" Local config
if filereadable(".vimrc.local")
  source .vimrc.local
endif

" Use Ack instead of Grep when available
if executable("ack")
  set grepprg=ack\ -H\ --nogroup\ --nocolor\ --ignore-dir=tmp\ --ignore-dir=coverage
endif

" Numbers
set number
set numberwidth=5

" Tags
set tags=./tags;

" Snippets are activated by Shift+Tab
let g:snippetsEmu_key = "<S-Tab>"

" Tab completion options
" (only complete to the longest unambiguous match, and show a menu)
set completeopt=longest,menu
set wildmode=list:longest,list:full
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.pdf
set complete=.,t

" case only matters with mixed case expressions
set ignorecase
set smartcase

" File Explorer hidden files
let g:netrw_list_hide= '.*\.DS_Store$,.*\.swp$'

" Adaptable Panes (focused pane is larger)
set winwidth=84
set winheight=5
set winminheight=5
set winheight=999

" Load plugins
set runtimepath^=~/.vim/bundle/ctrlp.vim

" Sets window title to opened file name
set titlestring=%t%(\ %M%)%(\ (%{expand(\"%:p:h\")})%)%(\ %a%)

" Column highlightning
highlight OverLength ctermbg=red ctermfg=white guibg=#592929
match OverLength /\%81v.\+/
