" ========== Vundle bit ==========

set nocompatible
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'vim-scripts/closetag.vim'
Bundle 'kien/ctrlp.vim'
Bundle 'Raimondi/delimitMate'
Bundle 'mattn/emmet-vim'
Bundle 'itchyny/lightline.vim'
Bundle 'scrooloose/nerdtree'

filetype on

" ========== General config ==========

syntax enable           " enable syntax processing
colorscheme monokai		" summerfruit256

set number              " show line numbers
set showcmd             " show command in bottom bar
set cursorline          " highlight current line
set wildmenu            " visual autocomplete for command menu
set lazyredraw          " redraw only when we need to.
set mouse=a				" Enable mouse support in console
set number				" Line numbers
set nohidden			" Remove the buffer when I close tab
set pastetoggle=<F2>	" Toggle paste nopaste F2 so we can paste from clipboard with nice indenting 
set fileencoding=utf-8	" default encoding for files
set encoding=utf-8		" default encoding for files
set splitbelow			" position of splits
set splitright			" position of splits
set title				" change the terminal's title
set virtualedit=onemore	" allow for cursor beyond last character
set laststatus=2		" always show status line

" ========== Turn off swap files ==========

set noswapfile
set nobackup
set nowb

" ================ Persistent Undo ==================

" Keep undo history across sessions, by storing in file.
" Only works all the time.
if has('persistent_undo') && !isdirectory(expand('~').'/.vim/backups')
silent !mkdir ~/.vim/backups > /dev/null 2>&1
set undodir=~/.vim/backups
set undofile
endif

" ========== Indentation ==========

set tabstop=4			" number of visual spaces per TAB
set softtabstop=4		" number of spaces in tab when editing
set shiftround			" indent to nearest tabstop
set autoindent			" Who doesn't like autoindent?

" Auto indent pasted text
nnoremap p p=`]<C-o>
nnoremap P P=`]<C-o>

" ========== Search ==========

set showmatch           " highlight matching [{()}]
set incsearch           " search as characters are entered
set ignorecase			" ignore case in search
set smartcase			" except if you use uppercase
set hlsearch            " highlight matches

" ========== Key mappings ==========

" move vertically by visual line
nnoremap j gj
nnoremap k gk

" jk is escape
inoremap jk <esc>

" highlight last inserted text
nnoremap gV `[v`]

" Disable :X to encrypt - make :X behave like :x
cnoreabbrev <expr> X (getcmdtype() is# ':' && getcmdline() is# 'X') ? 'x' : 'X'

" Map :q to behave like :q!
cabbrev q q!

" ========== Autocomplete ==========

" Autocomplete in html files
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags

" ========== Emmet ==========

" Expand Emmet keywords with ctrl-E
let user_emmet_expandabbr_key = '<c-e>'
let g:use_zen_complete_tag = 1

" ========== NERDTree ==========

" Map NERDTree toggle to Ctrl-n
map <C-n> :NERDTreeToggle<CR>

" NERDTree file highlighting
function! NERDTreeHighlightFile(extension, fg, bg, guifg, guibg)
 exec 'autocmd filetype nerdtree highlight ' . a:extension .' ctermbg='. a:bg .' ctermfg='. a:fg .' guibg='. a:guibg .' guifg='. a:guifg
  exec 'autocmd filetype nerdtree syn match ' . a:extension .' #^\s\+.*'. a:extension .'$#'
  endfunction

  call NERDTreeHighlightFile('jade', 'green', 'none', 'green', '#151515')
  call NERDTreeHighlightFile('ini', 'yellow', 'none', 'yellow', '#151515')
  call NERDTreeHighlightFile('md', 'blue', 'none', '#3366FF', '#151515')
  call NERDTreeHighlightFile('yml', 'yellow', 'none', 'yellow', '#151515')
  call NERDTreeHighlightFile('config', 'yellow', 'none', 'yellow', '#151515')
  call NERDTreeHighlightFile('conf', 'yellow', 'none', 'yellow', '#151515')
  call NERDTreeHighlightFile('json', 'yellow', 'none', 'yellow', '#151515')
  call NERDTreeHighlightFile('html', 'yellow', 'none', 'yellow', '#151515')
  call NERDTreeHighlightFile('styl', 'cyan', 'none', 'cyan', '#151515')
  call NERDTreeHighlightFile('css', 'cyan', 'none', 'cyan', '#151515')
  call NERDTreeHighlightFile('coffee', 'Red', 'none', 'red', '#151515')
  call NERDTreeHighlightFile('js', 'Red', 'none', '#ffa500', '#151515')
  call NERDTreeHighlightFile('php', 'Magenta', 'none', '#ff00ff', '#151515')

" ========== CtrlP ==========

let g:ctrlp_match_window = 'bottom,order:ttb'
let g:ctrlp_switch_buffer = 0
let g:ctrlp_working_path_mode = 0


