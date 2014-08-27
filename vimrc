scriptencoding utf-8
set encoding=utf-8

" ========================================================================
" Vundle stuff
" ========================================================================
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" Let Vundle manage Vundle (required)!
Bundle 'gmarik/vundle'

" My bundles
Bundle 'ervandew/supertab'
Bundle 'tomtom/tcomment_vim'
Bundle 'tpope/vim-endwise'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-rails'
Bundle 'vim-ruby/vim-ruby'
Bundle 'wincent/Command-T'
Bundle 'koron/nyancat-vim'
Bundle 'uguu-org/vim-matrix-screensaver'
Bundle 'kien/ctrlp.vim'

" ========================================================================
" set vim config stuff
" ========================================================================
set nocompatible                        " be iMproved
set et                                  " tab for spaces
set ts=2 shiftwidth=2 softtabstop=2     " tab size
set smartindent
set bg=dark
set ignorecase
set hlsearch
set viminfo+=!
set history=500                         " keep 500 lines of command line history
set ruler                               " show the cursor position all the time
set showcmd                             " display incomplete commands
set showmatch
set backupdir=~/.tmp
set directory=~/.tmp                    " Don't clutter my dirs up with swp and tmp files
set autoread
set laststatus=2                        " Always show status line.
set relativenumber
set gdefault                            " assume the /g flag on :s substitutions to replace all matches in a line
set autoindent                          " always set autoindenting on
set shiftround                          " When at 3 spaces and I hit >>, go to 4, not 5.
set list listchars=tab:»·,trail:·       " Display extra whitespace
set tw=0
set visualbell t_vb=                    " turn off error beep/flash
set novisualbell                        " turn off visual bell
set backspace=indent,eol,start          " make that backspace key work the way it should
set statusline=%<%f\ %h%m%r%{fugitive#statusline()}%=%-14.(%l,%c%V%)\ %P


" Paste Toggle
nnoremap <F8> :set invpaste paste?<CR>
set pastetoggle=<F8>

" Fuzzy finder: ignore stuff that can't be opened, and generated files
let g:fuzzy_ignore = "*.png;*.PNG;*.JPG;*.jpg;*.GIF;*.gif;vendor/**;coverage/**;tmp/**;rdoc/**"

" ================
" Ruby stuff
" ================
syntax on
filetype plugin indent on               " Enable filetype-specific indenting and plugins

" Complain about whitespaces on the end of file
:highlight ExtraWhitespace ctermbg=red guibg=red
:match ExtraWhitespace /\s\+$/

" Highlight the status line
highlight StatusLine ctermfg=blue ctermbg=yellow

" ===============
" Use hjkl =P
" ===============
inoremap  <Up>     <NOP>
inoremap  <Down>   <NOP>
inoremap  <Left>   <NOP>
inoremap  <Right>  <NOP>
noremap   <Up>     <NOP>
noremap   <Down>   <NOP>
noremap   <Left>   <NOP>
noremap   <Right>  <NOP>

" Use jk as esc
:imap jk <Esc>

" always clear before execute the command
noremap :! :!clear;

" my personal key maps
let mapleader = " "

" Quit with q
map <Leader>q :q<CR>

" my frequently edited files
map <Leader>vim :sp ~/.dotfiles/vimrc<cr>

" Git
map <Leader>gs :Gstatus<CR>
map <Leader>gb :Gblame<CR>
map <Leader>gc :Gcommit<CR>
map <Leader>gp <esc>:!git push<CR>
map <Leader>gd :Gdiff<CR>

" remove all spaces left behind
map <Leader><Space> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl<CR>:retab<CR>
map <Leader>w <esc>:w<cr>

" Tests and StyleGuides
map <Leader>rub :!rubocop %<cr>
map <Leader>auto :!rubocop -a %<cr>
map <Leader>t :w<cr>:call RunCurrentTest()<CR>
map <Leader>T :w<cr>:call RunCurrentLineInTest()<CR>

" Dash / Documentation
map <Leader>D :!open dash://

" Matrix / Cat
map <Leader>mm :Matrix<cr>
map <Leader>nc :Nyancat2<cr>

" CtrlP
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'

set wildignore+=*/tmp/*,*.so,*.swp,*.zip
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'

let g:ctrlp_user_command = 'find %s -type f'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Test-running stuff - Thanks r00
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! RunCurrentTest()
  let in_test_file = match(expand("%"), '\(.feature\|_spec.rb\)$') != -1
  if in_test_file
    call SetTestFile()

    if match(expand('%'), '\.feature$') != -1
      call SetTestRunner("cucumber")
      exec '!clear &&' g:bjo_test_runner g:bjo_test_file
    elseif match(expand('%'), '_spec\.rb$') != -1
      call SetTestRunner("rspec --color --format documentation")
      exec '!clear &&' g:bjo_test_runner g:bjo_test_file
    endif
  else
    " Those var are set the first time you run your tests
    " once you already ran your tests, you can move to the
    " code file, and keep running the tests that are already
    " saved in the session
    exec '!clear && ' g:bjo_test_runner g:bjo_test_file
  endif
endfunction

function! SetTestRunner(runner)
  let g:bjo_test_runner=a:runner
endfunction

function! RunCurrentLineInTest()
  let in_test_file = match(expand("%"), '\(.feature\|_spec.rb\)$') != -1
  if in_test_file
    call SetTestFileWithLine()
  end

  exec "!clear && rspec --color --format documentation " g:bjo_test_file . ":" . g:bjo_test_file_line
endfunction

function! SetTestFile()
  let g:bjo_test_file=@%
endfunction

function! SetTestFileWithLine()
  let g:bjo_test_file=@%
  let g:bjo_test_file_line=line(".")
endfunction
