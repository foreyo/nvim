syntax enable                           " Enables syntax highlighing
set encoding=UTF-8                      " The encoding displayed
set fileencoding=utf-8                  " The encoding written to file
set t_Co=256                            " Enable 256 colors support
set clipboard=unnamedplus               " Access system clipboard
set mouse=a                             " Enable your mouse
set number                              " Line numbers
set ruler                               " Show the cursor position
set cursorline                          " Enable highlighting of the current line
set tabstop=4                           " Insert 2 spaces for a tab
set shiftwidth=4                        " Change the number of space characters inserted for indentation
set smarttab                            " Makes tabbing smarter will realize you have 2 vs 4
set expandtab                           " Converts tabs to spaces
set smartindent                         " Makes indenting smart
set autoindent                          " Good auto indent
set nobackup                            " This is recommended by coc
set nowritebackup                       " This is recommended by coc

if has('termguicolors')
"  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
"  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors                    " Enable true colors 
endif

" auto-install vim-plug
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
      \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  "autocmd VimEnter * PlugInstall
  autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

call plug#begin('~/.config/nvim/plugged')
  "Plug 'preservim/nerdtree'
  "Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
  Plug 'vim-airline/vim-airline' 
  Plug 'vim-airline/vim-airline-themes' 
  "Plug 'ryanoasis/vim-devicons'
  " Color schemes
  "Plug 'joshdick/onedark.vim'
  Plug 'morhetz/gruvbox'
  Plug 'ayu-theme/ayu-vim'
  " Development
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  Plug 'liuchengxu/vim-which-key'

  "Plug 'python-mode/python-mode', { 'for': 'python', 'branch': 'develop' }
  "Plug 'davidhalter/jedi-vim'
call plug#end()

let g:coc_global_extensions = [
\ 'coc-explorer',
\ 'coc-python'
\ ]
 
" use <tab> for trigger completion and navigate to the next complete item
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <Tab>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<Tab>" :
      \ coc#refresh()

:nmap <space>e :CocCommand explorer<CR>

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

"let g:python_host_prog='~/.pyenv/shims/python'

let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#tabline#formatter='unique_tail'
let g:airline_powerline_fonts=1
let g:airline#extensions#hunks#enabled=0

" Pymode
let g:pymode_run=1
let g:pymode_run_bind='<F5>'

"set background=dark                     " Setting dark mode
let ayucolor="mirage"
colorscheme gruvbox
"colorscheme ayu

" Remove numbers in terminal
au TermOpen * setlocal nonumber norelativenumber

let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_browse_split = 4
let g:netrw_altv = 1
let g:netrw_winsize = 20

" By default timeoutlen is 1000 ms
set timeoutlen=200

let g:mapleader = "\<Space>"
let g:maplocalleader = ','
nnoremap <silent> <leader>      :<c-u>WhichKey '<Space>'<CR>
nnoremap <silent> <localleader> :<c-u>WhichKey  ','<CR>

