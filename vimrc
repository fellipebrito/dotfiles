scriptencoding utf-8
set encoding=utf-8

execute pathogen#infect()

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
" set statusline=%<%f\ %h%m%r%{fugitive#statusline()}%=%-14.(%l,%c%V%)\ %P
set path+=**
set wildmenu
autocmd vimenter * NERDTree

syntax on
filetype plugin indent on               " Enable filetype-specific indenting and plugins

" 80 Column Marker
set colorcolumn=81

" Paste Toggle
nnoremap <F8> :set invpaste paste?<CR>
set pastetoggle=<F8>

" Fuzzy finder: ignore stuff that can't be opened, and generated files
let g:fuzzy_ignore = "*.png;*.PNG;*.JPG;*.jpg;*.GIF;*.gif;vendor/**;coverage/**;tmp/**;rdoc/**"

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
map <Leader>vim :vsplit ~/.dotfiles/vimrc<cr>

" clojure koans
map <Leader>cc :!lein koan run<cr>

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

" Tests and StyleGuides / PYTHON
map <Leader>ps :w<cr> :!pycodestyle %<cr>
map <Leader>pt :w<cr> :!pytest %<cr>
map <Leader>ppt :w<cr> :!pytest functions<cr>

" Dash / Documentation
map <Leader>D :Dispatch search_on_dash.sh <C-r>"<CR>
map <Leader>mk :set syntax=markdown<CR>

" Matrix / Cat
map <Leader>mm :Matrix<cr>
map <Leader>nc :Nyancat2<cr>

" Search
map <Leader>bs :Dispatch browser_search.sh <C-r>"<CR>

" CtrlP
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'

set wildignore+=*/tmp/*,*.so,*.swp,*.zip
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'

let g:ctrlp_user_command = 'find %s -type f'

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"
let g:UltiSnipsJumpForwardTrigger=";;"
let g:UltiSnipsJumpBackwardTrigger=";l"

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Test-running stuff - Thanks r00
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! RunCurrentTest()
  let in_test_file = match(expand("%"), '\(.feature\|.clj\|_spec.rb\)$') != -1
  if in_test_file
    call SetTestFile()

    if match(expand('%'), '\.feature$') != -1
      call SetTestRunner("cucumber")
      exec '!clear &&' g:bjo_test_runner g:bjo_test_file
    elseif match(expand('%'), '_spec\.rb$') != -1
      call SetTestRunner("rspec")
      " exec ':Dispatch ' g:bjo_test_runner g:bjo_test_file
      exec ":Dispatch! tmux send-keys -t right 'rspec" g:bjo_test_file . "' Enter"
    elseif match(expand('%'), '\.clj$') != -1
      exec '!clear && lein test'
    endif
  else
    " Those var are set the first time you run your tests
    " once you already ran your tests, you can move to the
    " code file, and keep running the tests that are already
    " saved in the session
    " exec '!clear && ' g:bjo_test_runner g:bjo_test_file
    exec ":Dispatch! tmux send-keys -t right 'rspec" g:bjo_test_file . "' Enter"
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

  " exec ":Dispatch 'rspec" g:bjo_test_file . ":" . g:bjo_test_file_line . "' Enter"
  exec ":Dispatch! tmux send-keys -t right 'rspec" g:bjo_test_file . ":" . g:bjo_test_file_line . "' Enter"
endfunction

function! SetTestFile()
  let g:bjo_test_file=@%
endfunction

function! SetTestFileWithLine()
  let g:bjo_test_file=@%
  let g:bjo_test_file_line=line(".")
endfunction

let g:BibleTranslation = "ESV"
let g:BibleFormat = "\\3. \\4"
let g:BibleLocale = "en"
let g:BibleOmitModuleName = 0

nnoremap <leader>b y :call Bible()<CR>
vnoremap <leader>b y :call Bible(@*)<CR> "Use selection as query


 let g:rbpt_colorpairs = [
     \ ['brown',       'RoyalBlue3'],
     \ ['Darkblue',    'SeaGreen3'],
     \ ['darkgray',    'DarkOrchid3'],
     \ ['darkgreen',   'firebrick3'],
     \ ['darkcyan',    'RoyalBlue3'],
     \ ['darkred',     'SeaGreen3'],
     \ ['darkmagenta', 'DarkOrchid3'],
     \ ['brown',       'firebrick3'],
     \ ['gray',        'RoyalBlue3'],
     \ ['black',       'SeaGreen3'],
     \ ['darkmagenta', 'DarkOrchid3'],
     \ ['Darkblue',    'firebrick3'],
     \ ['darkgreen',   'RoyalBlue3'],
     \ ['darkcyan',    'SeaGreen3'],
     \ ['darkred',     'DarkOrchid3'],
     \ ['red',         'firebrick3'],
     \ ]

let g:rbpt_max = 16

let g:rbpt_loadcmd_toggle = 0

au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

