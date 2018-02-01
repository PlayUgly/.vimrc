set nocompatible

filetype plugin indent on
filetype off
filetype plugin on
filetype indent on

syntax enable

packadd! matchit

set tabstop=4
set shiftwidth=4
set softtabstop=0 noexpandtab
set smarttab
set omnifunc=syntaxcomplete#Complete
set relativenumber




nnoremap <SPACE> <Nop>	
let mapleader = " "

inoremap {{ <Esc>o{<CR><CR>}<CR><Up><UP><TAB>
nnoremap {{ <Esc>o{<CR><CR>}<CR><Up><UP><TAB>

nnoremap <Leader>if iif ()<left>
nnoremap <Leader>eif ielse if ()<left>
nnoremap <Leader>el ielse
nnoremap <Leader>wh iwhile()<left>

inoremap ;; <Esc>Ea

inoremap AA <Esc>A
inoremap II <Esc>I
inoremap CC <Esc>C

"map arrows to resize window
"http://coderoncode.com/tools/2017/04/16/vim-the-perfect-ide.html
nnoremap <Up>		:resize +2<CR>	
nnoremap <Down>		:resize -2<CR>
nnoremap <Left>		:vertical resize +2<CR>
nnoremap <Right>	:vertical resize +2<CR>




" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

"neocomplete
Plugin 'shougo/neocomplete.vim'
" All of your Plugins must be added before the following line
call vundle#end()            " required

"vim autoclose close ", (, [, {, etc
Plugin 'townk/vim-autoclose'

"easytags
"Plugin 'xolox/vim-easytags'

"YouCompleteMe code completion plugin
"Plugin 'valloric/youcompleteme'

"solarized color theme
"Plugin 'altercation/vim-colors-solarized'


"vim plugins installed from Arch repository
"vim-surround
"vim-nerdtree
"vim-tagbar

"run :source %, :PluginInstall to install new plugins
"run "PluginClean to uninstall and delete plugin directory




"Customize vim autoclose
"from https://github.com/Townk/vim-autoclose/commit/2b5dd857113ad84e4746e03590a6680e72f87d78
"let g:AutoClosePairs_add = "<>"

"set background=dark
"let g:solarized_termcolors=256
"colorscheme solarized




"Open NerdTree if no file is specified
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

"Toggle NerdTree open/close with ^n
map <C-n> :NERDTreeToggle<CR>

"By default NerdTree closes when file is opened
let NERDTreeQuitOnOpen = 1




"Airline config
set laststatus=2	"enable at startup


"Neocomplete setup
"" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3

" Define dictionary.
let g:neocomplete#sources#dictionary#dictionaries = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions'
        \ }

" Define keyword.
if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'

" Neovim key-mappings.
inoremap <expr><C-g>     neocomplete#undo_completion()
inoremap <expr><C-l>     neocomplete#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return (pumvisible() ? "\<C-y>" : "" ) . "\<CR>"
  " For no inserting <CR> key.
  "return pumvisible() ? "\<C-y>" : "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
" Close popup by <Space>.
"inoremap <expr><Space> pumvisible() ? "\<C-y>" : "\<Space>"

" AutoComplPop like behavior.
"let g:neocomplete#enable_auto_select = 1

" Shell like behavior(not recommended).
"set completeopt+=longest
"let g:neocomplete#enable_auto_select = 1
"let g:neocomplete#disable_auto_complete = 1
"inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<C-x>\<C-u>"

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Enable heavy omni completion.
if !exists('g:neocomplete#sources#omni#input_patterns')
  let g:neocomplete#sources#omni#input_patterns = {}
endif
"let g:neocomplete#sources#omni#input_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
"let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
"let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'

" For perlomni.vim setting.
" https://github.com/c9s/perlomni.vim
let g:neocomplete#sources#omni#input_patterns.perl = '\h\w*->\h\w*\|\h\w*::'
