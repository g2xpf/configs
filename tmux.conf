if has('python3')
endif
source ~/.gvimrc

" if has("mac")
"  let g:vimproc_dll_path = $VIMRUNTIME . '/autoload/proc.so'
"  let g:vimproc_dll_path = $VIMRUNTIME . '/autoload/vimproc_mac.so'
" endif

"dein Scripts-----------------------------

" if &compatible
"    set nocompatible               " Be iMproved
" endif

" Required:
" set runtimepath^=/Users/Tsuji-Yuta-PC/.vim/repos/github.com/Shougo/dein.vim

" Required:
" call dein#begin(expand('/Users/Tsuji-Yuta-PC/.vim'))

" Let dein manage dein
" Required:
call plug#begin('~/.vim/plugged')
let $PATH = $PATH . ':' . expand('~/.cabal/bin')
" Plugin for pyenv path resolution
Plug 'Shougo/unite.vim'
Plug 'w0ng/vim-hybrid'
Plug 'simeji/winresizer'
Plug 'thinca/vim-quickrun'
Plug 'Shougo/vimproc.vim', {'do' : 'make'}
" You can specify revision/branch/tag.
Plug 'vim-scripts/gnuplot.vim'
Plug 'edkolev/tmuxline.vim'
Plug 'itchyny/lightline.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'thinca/vim-ref'
Plug 'kana/vim-filetype-haskell'
Plug 'eagletmt/ghcmod-vim'
Plug 'ujihisa/neco-ghc'
Plug 'ujihisa/ref-hoogle'
Plug 'ujihisa/unite-haskellimport'
Plug 'Shougo/vinarise.vim'
Plug 'basyura/TweetVim'
Plug 'mattn/webapi-vim'
Plug 'basyura/twibill.vim'
Plug 'h1mesuke/unite-outline'
Plug 'basyura/bitly.vim'
Plug 'cocopon/vaffle.vim'
Plug 'pangloss/vim-javascript'
" plugins for markdown
Plug 'plasticboy/vim-markdown'
Plug 'kannokanno/previm'
Plug 'tyru/open-browser.vim'
" plugins for LaTeX
Plug 'xuhdev/vim-latex-live-preview', { 'for': 'tex' }
" plugins for autocomplete
" Plug 'roxma/nvim-yarp'
" Plug 'roxma/vim-hug-neovim-rpc'
" Plug 'Shougo/deoplete.nvim'
" Plugin for paste without indentation
Plug 'ConradIrwin/vim-bracketed-paste'
" GLSL syntax highlight
Plug 'tikhomirov/vim-glsl'
" Directory Tree
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
call plug#end()
" Required:

" If you want to install not installed plugins on startup.
" if dein#check_install()
" call dein#install()
" endif

"End dein Scripts-------------------------

"An example for a vimrc file.
"
" Maintainer:	Bram Moolenaar <Bram@vim.org>
" Last change:	2016 Mar 25
"
" To use it, copy it to
"     for Unix and OS/2:  ~/.vimrc
"	      for Amiga:  s:.vimrc
"  for MS-DOS and Win32:  $VIM\_vimrc
"	    for OpenVMS:  sys$login:.vimrc

" When started as "evim", evim.vim will already have done these settings.
if v:progname =~? "evim"
    finish
endif

" Use Vim settings, rather than Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

if has("vms")
    set nobackup		" do not keep a backup file, use versions instead
else
    set backup		" keep a backup file (restore to previous version)
    set undofile		" keep an undo file (undo changes after closing)
endif
set history=50		" keep 50 lines of command line history
set ruler		" show the cursor position all the time
set showcmd		" display incomplete commands
set incsearch		" do incremental searching

" For Win32 GUI: remove 't' flag from 'guioptions': no tearoff menu entries
" let &guioptions = substitute(&guioptions, "t", "", "g")

" Don't use Ex mode, use Q for formatting
map Q gq

" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>

" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
    set mouse=a
endif

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
    syntax on
    set hlsearch
endif

" Only do this part when compiled with support for autocommands.
if has("autocmd")

    " Enable file type detection.
    " Use the default filetype settings, so that mail gets 'tw' set to 72,
    " 'cindent' is on in C files, etc.
    " Also load indent files, to automatically do language-dependent indenting.
    filetype plugin indent on

    " Put these in an autocmd group, so that we can delete them easily.
    augroup vimrcEx
        au!

        " For all text files set 'textwidth' to 78 characters.
        autocmd FileType text setlocal textwidth=78

        " When editing a file, always jump to the last known cursor position.
        " Don't do it when the position is invalid or when inside an event handler
        " (happens when dropping a file on gvim).
        autocmd BufReadPost *
                    \ if line("'\"") >= 1 && line("'\"") <= line("$") |
                    \   exe "normal! g`\"" |
                    \ endif

    augroup END

else

    set autoindent		" always set autoindenting on

endif " has("autocmd")

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
if !exists(":DiffOrig")
    command DiffOrig vert new | set bt=nofile | r ++edit # | 0d_ | diffthis
                \ | wincmd p | diffthis
endif

if has('langmap') && exists('+langnoremap')
    " Prevent that the langmap option applies to characters that result from a
    " mapping.  If unset (default), this may break plugins (but it's backward
    " compatible).
    set langnoremap
endif


" Add optional packages.
"
" The matchit plugin makes the % command work better, but it is not backwards
" compatible.
" packadd matchit

let g:winresizer_gui_enable = 1

let g:quickrun_config = get(g:, 'quickrun_config', {})
let g:quickrun_config._ = {
            \ 'runner'    : 'vimproc',
            \ 'runner/vimproc/updatetime' : 60,
            \ 'outputter' : 'error',
            \ 'outputter/error/success' : 'buffer',
            \ 'outputter/error/error'   : 'quickfix',
            \ 'outputter/buffer/split'  : ':rightbelow 8sp',
            \ 'outputter/buffer/close_on_empty' : 1,
            \ }
let g:necoghc_enable_detailed_browse = 1
let g:ycm_semantic_triggers = {'haskell' : ['.']}

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

noremap <S-h> ^
noremap <S-l> $
noremap <C-p> :r<Space>!xsel<Space>-bo<CR>
noremap <C-n> :NERDTree<CR>
cnoremap -gmt GhcModType
cnoremap -gmtc GhcModTypeClear
cnoremap -gmc GhcModCheck
cnoremap -gml GhcModLint
cnoremap -tl TweetVimHomeTimeline
cnoremap -ts TweetVimCommandSay

set wildcharm=<C-Z>
" 各種コンパイルコマンド
cnoremap -hc !ghc<Space>--make<Space>-O<Space>-dynamic<Space>*.hs<C-Z>
cnoremap -dc !~/dlang/dmd2/osx/bin/dmd<Space>
cnoremap -cppc !g++<Space>-std=gnu++1y<Space>-O2<Space>*.cpp<C-Z><C-Z>
cnoremap -cc !gcc<Space>-Wall<Space>
cnoremap -rc !rustc<Space>-O<Space>
" 検索用コマンド
vnoremap z/ <ESC>/\%V
vmap <C-y> !xsel<Space>-bi<CR><Undo>

function! SetColorSyntax()
    colorscheme hybrid
    syntax on
endfunction
let g:hybrid_reduced_contrast=0
"sw=softtabstop, sts=shiftwidth, ts=tabstop, et=expandtab
" autocmd BufEnter *     colorscheme hybridColor | set tabstop=4
" autocmd BufEnter *.js    colorscheme vim-monokai | set tabstop=4 | set shiftwidth=4
" autocmd BufEnter *.vue   set syntax=html
" " autocmd BufEnter *.html set tabstop=2
" autocmd BufEnter *.html  set tabstop=2 | set shiftwidth=2
" autocmd BufEnter *.ejs   set tabstop=2 | set syntax=html
" autocmd BufEnter *.mkd   set filetype=markdown
" autocmd BufEnter *.md    set filetype=markdown

" if has("autocmd")
"     "ファイルタイプの検索を有効にする
"     filetype plugin on
"     "ファイルタイプに合わせたインデントを利用
"     filetype indent on
"     "sw=softtabstop, sts=shiftwidth, ts=tabstop, et=expandtabの略
"     autocmd FileType c           setlocal sw=4 sts=4 ts=4 et
"     autocmd FileType html        setlocal sw=4 sts=4 ts=4 et
"     autocmd FileType ruby        setlocal sw=2 sts=2 ts=2 et
"     autocmd FileType js          setlocal sw=4 sts=4 ts=4 et
"     autocmd FileType zsh         setlocal sw=4 sts=4 ts=4 et
"     autocmd FileType python      setlocal sw=4 sts=4 ts=4 et
"     autocmd FileType scala       setlocal sw=4 sts=4 ts=4 et
"     autocmd FileType json        setlocal sw=4 sts=4 ts=4 et
"     autocmd FileType html        setlocal sw=4 sts=4 ts=4 et
"     autocmd FileType css         setlocal sw=4 sts=4 ts=4 et
"     autocmd FileType scss        setlocal sw=4 sts=4 ts=4 et
"     autocmd FileType sass        setlocal sw=4 sts=4 ts=4 et
" endif


set nobackup
set nowritebackup
set noswapfile
set noundofile

set foldmethod=indent
set foldnestmax=1

au FileType * setlocal formatoptions-=ro
imap <S-Space> <Space>

colorscheme hybrid
command! -nargs=1 Cnt %s/<args>/&/gn
" tmux configuration 
set ambiwidth=single
let g:tmuxline_powerline_separators = 0
" \'b'    : ['#(whoami)', '#(uptime | cut -d " " -f 1,2,3)'],
let g:tmuxline_preset = {
            \'a'    : ['#S', '#I', '#P'],
            \'b'    : ['#(whoami)', '#(sh ~/.shell/get_cpu_usage.sh)'],
            \'c'    : ['#I', '#W', '#F'],
            \'win'  : ['#I', '#W', '#F'],
            \'cwin' : ['#(sh ~/.shell/get_volume_tmux.sh)', '#(sh ~/.shell/get_weather_tmux.sh)'],
            \'x'    : ['#(sh ~/.shell/get_load_average_tmux.sh)', '#(sh ~/.shell/get_ssid_tmux.sh)'],
            \'y'    : ['#(sh ~/.shell/get_battery_tmux.sh)'],
            \'z'    : ['#[bold] %H:%M | %m/%d %a'],}
let g:tmuxline_separators = {
            \ 'left' : '', 
            \ 'left_alt': '⮁',
            \ 'right' : '',
            \ 'right_alt' : '⮃',
            \ 'space' : ' '}

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

" Powerline系フォントを利用する
" set laststatus=2
" let g:airline_powerline_fonts = 1
" let g:airline#extensions#tabline#enabled = 1
" let g:airline#extensions#tabline#buffer_idx_mode = 1
" let g:airline#extensions#whitespace#mixed_indent_algo = 1
let g:airline_theme = 'papercolor'

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

let g:airline_symbols.branch = '⭠'
let g:airline_symbols.readonly = '⭤'
let g:airline_symbols.linenr = '⭡'
let g:deoplete#enable_at_startup = 1
