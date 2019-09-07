let mapleader = " "                                                                                                            
" ===
" === Auto load for first time uses
" ===
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif


let g:python3_host_prog='/usr/bin/python3'
syntax on
set number
set norelativenumber
set cursorline
set wrap
set showcmd
set wildmenu

set hlsearch
exec "nohlsearch"
set incsearch

set tags=/home/fish/document/code/www/tp/tags

"set shiftwidth=4
""set softtabstop=4
au FileType html,vim,javascript setl shiftwidth=2
au FileType html,vim,javascript setl tabstop=2
au FileType java,php,go,json setl shiftwidth=4
au FileType java,php,go,json setl tabstop=4
au BufNewFile,BufRead *.py
      \ set tabstop=4 |
      \ set softtabstop=4 |
      \ set shiftwidth=4 |
      \ set textwidth=79 |
      \ set expandtab |
      \ set autoindent |
      \ set fileformat=unix |

"F2显示语法错误
autocmd FileType python map <buffer> <F2> :call Flake8()<CR>
""保存文件的时候显示错误
autocmd BufWritePost *.py call flake8#Flake8()
"在vim里运行Python
noremap <LEADER><CR> :nohlsearch<CR>
map <F5> :call RunPython()<CR>
func! RunPython()
  exec "W"
  if &filetype == 'python'
    exec "!time python3 %"
  endif
endfunc

map s <nop>
map S :w<CR>
map Q :q<CR>
map R :source $MYVIMRC<CR>

imap <F6> <C-x><C-o>

map sl :set splitright<CR>:vsplit<CR>
map sj :set nosplitright<CR>:vsplit<CR> 
map si :set nosplitbelow<CR>:split<CR> 
map sk :set splitbelow<CR>:split<CR> 

"跳行
noremap H 5h
noremap J 5j
noremap K 5k
noremap L 5l

call plug#begin('~/.config/nvim/plugged')
                                        
Plug 'vim-airline/vim-airline'
"Plug 'connorholyday/vim-snazzy'
Plug 'liuchengxu/space-vim-theme'
"Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
"Plug 'nsf/gocode', { 'rtp': 'vim', 'do':'~/.vim/plugged/gocode/vim/symlink.sh' }
"Plug 'nvie/vim-flake8'
"Plug 'neoclide/coc.nvim', {'tag': '*', 'do': { -> coc#util#install()}}
"Plug 'neoclide/coc.nvim', {'do': { -> coc#util#install()}}

Plug 'scrooloose/nerdtree'
"Plug 'lvht/phpcd.vim', { 'for': 'php', 'do': 'composer install' }

"auto complete
Plug 'ncm2/ncm2'
Plug 'ncm2/ncm2-jedi'
Plug 'ncm2/ncm2-github'
Plug 'ncm2/ncm2-bufword'
Plug 'ncm2/ncm2-path'
Plug 'ncm2/ncm2-match-highlight'
Plug 'ncm2/ncm2-markdown-subscope'
"Plug 'roxma/LanguageServer-php-neovim',  {'do': 'composer install && composer run-script parse-stubs'}
Plug 'ncm2/ncm2-tern',  {'do': 'npm install'}
Plug 'phpactor/phpactor' ,  {'do': 'composer install', 'for': 'php'}
Plug 'phpactor/ncm2-phpactor'


Plug 'roxma/nvim-yarp'

call plug#end()

"colorscheme snazzy
"colorscheme monokai 
"let g:SnazzyTransparent = 1 
let g:space_vim_transp_bg = 1
colorscheme space_vim_theme 

" use <tab> for trigger completion and navigate to the next complete item
function! s:check_back_space() abort
  let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~ '\s'
endfunction

"inoremap <silent><expr> <Tab>
"    \ pumvisible() ? "\<C-n>" :
"    \ <SID>check_back_space() ? "\<Tab>" :
"    \ coc#refresh()

" ===
" " === NERDTree
" " ===
map tt :NERDTreeToggle<CR>
map <C-h> :tabp<CR>
map <C-l> :tabn<CR>

"NCM2
set shortmess+=c
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <CR> (pumvisible() ? "\<c-y>\<cr>" : "\<CR>")
autocmd BufEnter * call ncm2#enable_for_buffer()
set completeopt=noinsert,menuone,noselect
let ncm2#popup_delay = 5
let g:ncm2#matcher = "substrfuzzy"
let g:ncm2_jedi#python_version = 3
let g:ncm2#match_highlight = 'sans-serif'

