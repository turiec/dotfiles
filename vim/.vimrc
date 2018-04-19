" ===================================================
"
" === .vimrc - vim configuration file             ===
" === author: Milan Ľudma <milan.ludma@gmail.com> ===
" =================================================== 

" ========== SETTINGS ==========
syntax enable      " syntax highlighting TODO: needed??? I have plugin
set number         " set line numbering (nonumber, number!, relativenumber)
set laststatus=2   " show statusbar TODO: needed??? I have plugin
set encoding=utf-8 " change the output encoding that is shown in the terminal
"set fileencoding=utf-8 " change the output encoding of the file that is written
set tabstop=4      " width of tabstop
set shiftwidth=4   " indent size
set expandtab      " tab key inserts spaces instead of tab characters
set smarttab       " tab goes to the next indent of the next tabstop
                   " when the cursor is at the beginning of a line
set smartindent    " 

set hlsearch       " enable search highlighting
set ignorecase     " ignore case when searching.
set incsearch      " incremental search that shows partial matches.
set smartcase      " auto-switch search to case-sensitive when query contains
                   " an uppercase letter.

set ruler          " always show cursor position
"set cursorline     " highlight the line currently under cursor

set noerrorbells   " disable beep on errors
"set visualbell    " flash the screen instead of beeping on errors
set title          " set the window’s title - filename

" special characters used to display hidden whitespaces (fnc: ToggleWhitespacesMode)
let g:lstchars_mode=0 " initial - white chars hidden
set nolist

set clipboard=unnamed " lubo
set pastetoggle=<F3>  " lubo
set matchpairs+=<:>       " lubo
set showcmd        " show cmd - last line of the screen 

" < begin lubo
let @w=':set syntax=whitespace'
let @t=':%s/\t/    /g'
let @n='/ \n'
map <Enter> o<ESC>
map <S-Enter> O<ESC>
inoremap <C-j> <Esc>
" end lubo >

" < begin sebbekarlsson 

" ==== Colors and other basic settings
set guifont=Monospace\ 10
set fillchars+=vert:\$
set background=dark
set hidden
set st=4 sw=4 et
let &colorcolumn="80"
highlight ColorColumn ctermbg=gray guibg=gray

:set guioptions-=m  "remove menu bar
:set guioptions-=T  "remove toolbar
:set guioptions-=r  "remove right-hand scroll bar
:set guioptions-=L  "remove left-hand scroll bar
":set lines=999 columns=999

" ==== NERDTREE
let NERDTreeIgnore = ['__pycache__', '\.pyc$', '\.o$', '\.so$', '\.a$', '\.swp', '*\.swp', '\.swo', '\.swn', '\.swh', '\.swm', '\.swl', '\.swk', '\.sw*$', '[a-zA-Z]*egg[a-zA-Z]*', '.DS_Store']

let NERDTreeShowHidden=1
let g:NERDTreeWinPos="left"
let g:NERDTreeDirArrows=0
map <C-t> :NERDTreeToggle<CR>

" ==== Syntastic
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_javascript_mri_args = "--config=$HOME/.jshintrc"
let g:syntastic_python_checkers = [ 'pylint', 'flake8', 'pep8', 'pyflakes', 'python']
let g:syntastic_yaml_checkers = ['jsyaml']
let g:syntastic_html_tidy_exec = 'tidy5'

" === flake8
let g:flake8_show_in_file=1

" ==== snippets
let g:UltiSnipsExpandTrigger="<A-ENTER>"
let g:UltiSnipsJumpForwardTrigger="<A-ENTER>"
let g:UltiSnipsJumpBackwardTrigger="<A-BACKSPACE>"
" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

" ==== Easymotion
let g:EasyMotion_do_mapping = 0
let g:EasyMotion_smartcase = 1
nmap f <Plug>(easymotion-s)

" ==== moving around
nmap <silent> <A-Up> :wincmd k<CR>
nmap <silent> <A-Down> :wincmd j<CR>
nmap <silent> <A-Left> :wincmd h<CR>
nmap <silent> <A-Right> :wincmd l<CR>
" end sebberkarlsson >

"set mouse=c        " disable mouse
"set shortmess+=A   " disable swap file warning

set nocompatible   " be iMproved, required (vundle)
filetype off       " required (vundle)

" --- disable beep and window flashing
set noerrorbells visualbell t_vb=
autocmd GUIEnter * set visualbell t_vb=

" ========== PLUGIN MANAGER ==========
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'    " let Vundle manage Vundle, required

" ========== PLUGINS ==========

" --- helpers ---
"Plugin 'vim-scripts/L9'

" --- File tree ---
Plugin 'scrooloose/nerdtree'

" --- Completion ---
Plugin 'Valloric/YouCompleteMe'

" --- Git ---
Plugin 'airblade/vim-gitgutter'
Plugin 'tpope/vim-fugitive'

" --- syntax helpers ---
Plugin 'scrooloose/syntastic'
"Plugin 'vim-syntastic/syntastic'
Plugin 'tpope/vim-surround'
"Plugin 'cakebaker/scss-syntax.vim'
"Plugin 'othree/yajs.vim'
"Plugin 'mitsuhiko/vim-jinja'
"Plugin 'octol/vim-cpp-enhanced-highlight'
"Plugin 'ap/vim-css-color'
"Plugin 'Vimjas/vim-python-pep8-indent'

" --- moving / searching ---
"Plugin 'easymotion/vim-easymotion'
Plugin 'kien/ctrlp.vim'
"Plugin 'ctrlpvim/ctrlp.vim'

" --- snippets ---
"Plugin 'SirVer/ultisnips'

"--- status bar on bottom ---
Plugin 'bling/vim-airline'

"Plugin 'scrooloose/nerdcommenter'

" --- PLUGIN THEMES ---
Plugin 'morhetz/gruvbox'
"colorscheme gruvbox

" --- vundle end
call vundle#end()            " required (vundle)
filetype plugin indent on    " required (vundle)

" ========== FUNCTIONS ==========

" use Ctrl+L to toggle the line number counting method
" number -> relativenumber -> nonumber
" TODO: https://jeffkreeftmeijer.com/vim-number/
function! g:ToggleNumberMode()
  if &number == 1 && &relativenumber == 0
     set number relativenumber
  elseif &relativenumber == 1
     set nonumber norelativenumber
  else
     set number
  endif
endfunction

" use Ctrl+W to toggle displaying whitespace characters
" no characters -> eol, tab, nbsp, extends, trail -> + space
function! g:ToggleWhitespacesMode()
  if g:lstchars_mode == 0
     set listchars=eol:↲,tab:▶▹,nbsp:␣,extends:…,trail:•
     set list
     let g:lstchars_mode=1
  elseif g:lstchars_mode == 1
     set listchars=eol:↲,tab:▶▹,nbsp:␣,extends:…,trail:•,space:·
     set list
     let g:lstchars_mode=2
  else
     set nolist
     let g:lstchars_mode=0
  endif
endfunction
" ========== KEY MAPPINGS ==========
nnoremap <silent><C-L> :call g:ToggleNumberMode()<cr>
nnoremap <silent><C-W> :call g:ToggleWhitespacesMode()<cr>

" ==== custom commands
"command JsonPretty execute ":%!python -m json.tool"
"set secure
