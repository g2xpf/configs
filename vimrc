" basic settings
set number
set background=dark
set autoindent
set noswapfile
set nobackup
set nowritebackup
set tabstop=4
set shiftwidth=4
set expandtab

" disable tex conceal
let g:tex_conceal=''

" set indent depending on filetype
filetype plugin indent on

" keymapping 
noremap <S-h> ^
noremap <S-l> $
map <C-n> :NERDTreeToggle<CR>

" packages
call plug#begin('~/.vim/plugged')
" colorschemes
Plug 'w0ng/vim-hybrid'

" linter
Plug 'w0rp/ale'

" indent guides
Plug 'Yggdroot/indentLine'

" dark powered asynchronous completion frameworkw
Plug 'Shougo/deoplete.nvim', { 'do': ':updateRemotePlugins' }

" git tools
Plug 'tpope/vim-fugitive'

" tools
Plug 'thinca/vim-quickrun'

" status bar
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" Plug 'Lokaltog/vim-powerline'
" Plug 'powerline/powerline'

" langage syntax support
Plug 'tikhomirov/vim-glsl'
Plug 'amal-khailtash/vim-xdc-syntax'
Plug 'zah/nim.vim'

" Directory Tree
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'tpope/vim-obsession'

" plugins for markdown
Plug 'plasticboy/vim-markdown'
Plug 'kannokanno/previm'
Plug 'tyru/open-browser.vim'

" plugins for autocomplete
Plug 'roxma/nvim-yarp'
Plug 'roxma/vim-hug-neovim-rpc'
Plug 'Shougo/deoplete.nvim'

" plugin for transparency
Plug 'miyakogi/seiya.vim'

" plugins for resize
Plug 'simeji/winresizer'

" plugins for go support
Plug 'zchee/deoplete-go'
Plug 'fatih/vim-go'
Plug 'nsf/gocode'

call plug#end()

" set colorscheme
colorscheme hybrid

" set transparency
let g:seiya_auto_enable=1

" set airline theme
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
let g:airline_theme = 'papercolor'
let g:airline_powerline_fonts = 1
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''
let g:airline_symbols.whitespace = 'Ξ'

" set pane number
function! WindowNumber(...)
    let builder = a:1
    let context = a:2
    call builder.add_section('airline_b', '%{tabpagewinnr(tabpagenr())}')
    return 0
endfunction

command! -nargs=1 Cnt %s/<args>/&/gn

" only when starting 
if has('vim_starting')
    call airline#add_statusline_func('WindowNumber')
    call airline#add_inactive_statusline_func('WindowNumber')
endif

"neovim settings
if(has("nvim"))
    source $HOME/.config/nvim/subInit.vim
endif

" indentLine config
let g:indentLine_enabled = 1
let g:indentLine_char = '>'
let g:indentLine_leadingSpaceEnabled = 1
let g:indentLine_leadingSpaceChar = '-'
let g:indentLine_faster = 1

" use fuzzy
function! FzyCommand(choice_command, vim_command)
  try
    let output = system(a:choice_command . " | fzy ")
  catch /Vim:Interrupt/
    " Swallow errors from ^C, allow redraw! below
  endtry
  redraw!
  if v:shell_error == 0 && !empty(output)
    exec a:vim_command . ' ' . output
  endif
endfunction

nnoremap <leader>e :call FzyCommand("ag . --silent -l -g ''", ":e")<cr>
nnoremap <leader>v :call FzyCommand("ag . --silent -l -g ''", ":vs")<cr>
nnoremap <leader>s :call FzyCommand("ag . --silent -l -g ''", ":sp")<cr>

" launch NERDTree automatically
autocmd VimEnter * NERDTree
