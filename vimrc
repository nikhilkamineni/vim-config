" MINPAC PLUGIN MANAGER "
packadd minpac
call minpac#init()
call minpac#add('k-takata/minpac', {'type':'opt'})

call minpac#add('jiangmiao/auto-pairs')
call minpac#add('Yggdroot/indentLine')
call minpac#add('vim-airline/vim-airline')
call minpac#add('vim-airline/vim-airline-themes')
call minpac#add('airblade/vim-gitgutter')
call minpac#add('mkitt/tabline.vim')

" Tpope
call minpac#add('tpope/vim-commentary')
call minpac#add('tpope/vim-fugitive')
call minpac#add('tpope/vim-repeat')
call minpac#add('tpope/vim-sensible')
call minpac#add('tpope/vim-sleuth')
call minpac#add('tpope/vim-surround')
call minpac#add('tpope/vim-unimpaired')
call minpac#add('tpope/vim-vinegar')

" Colorschemes
call minpac#add('nikhilkamineni/vim-gruvbox8')

" fzf
call minpac#add('junegunn/fzf.vim')

if has('unix')
  set rtp+=~/.fzf
endif

if has('macunix')
  set rtp+=/usr/local/opt/fzf
endif

noremap <silent> <C-p> :GFiles<CR>
noremap <silent> <C-b> :Buffers<CR>
noremap <silent> <C-m> :Marks<CR>
noremap <silent> <C-f> :Lines<CR>

command! PackUpdate call minpac#update()
command! PackClean call minpac#clean()

syntax on
set number
" set autochdir
set expandtab
set shiftwidth=2
set softtabstop=2
set mouse=a
set autoread
set updatetime=100
" set laststatus=2 "Always show statusline
" set t_Co=256
set termguicolors
" set hidden
set showmatch
set nocompatible
set visualbell
set ttyfast " Faster redrawing
set lazyredraw
set clipboard=unnamed
set showcmd " Show incomplete commands
filetype plugin on

" CODE FOLDING
set foldmethod=indent
set foldlevel=99
nnoremap <space> za

" TABLINE
set showtabline=2

" FINDING FILES
set path+=**                " Search down into subfolders/Enables tabbing
" set wildmenu                " Command line completion
set wildmode=list:longest   " Complete files like a shell
set ignorecase              " Make search case insensitive
set hlsearch                " make search highlight all matches
set incsearch
set diffopt+=vertical
nnoremap * *N

" Trigger `autoread` when files changes on disk
autocmd FocusGained,BufEnter,CursorHold,CursorHoldI * if mode() != 'c' | checktime | endif

" Notification after file change
autocmd FileChangedShellPost *
  \ echohl WarningMsg | echo "File changed on disk. Buffer reloaded." | echohl None


"""""""""""""""""
" THEME RELATED "
"""""""""""""""""
set background=dark
" set cursorline
let &t_ut=''
let g:srcery_italic = 1
colorscheme gruvbox8

" Gruvbox
" let g:gruvbox_contrast_dark = 'hard'
let g:gruvbox_italic = 1
let g:gruvbox_italicize_comments = 1
let g:gruvbox_italicize_strings = 1
" let g:gruvbox_filetype_hi_groups = 1
" let g:gruvbox_plugin_hi_groups = 1
" let g:gruvbox_invert_indent_guides = 1
" let g:gruvbox_invert_tabline = 1
" let g:gruvbox_improved_strings = 1
" let g:gruvbox_improved_warnings = 1
if g:colors_name == "gruvbox8"
  let g:airline_theme="minimalist"
endif

" EXPLORER SHORTCUTS
map <silent> <Leader>e :Explore<CR>
map <silent> <Leader>v :vsplit <bar> Explore<CR>
map <silent> <Leader>s :Sexplore<CR>
map <silent> <Leader>t :Texplore<CR>
map <Leader>b :bd<CR>
set splitbelow
set splitright

" TABS
map <silent> <C-t> :tabnew<CR>
imap <silent> <C-t> :tabnew<CR>
nnoremap <C-h> :tabprevious<CR>
nnoremap <C-l> :tabnext<CR>
nnoremap <silent> <S-h> :execute 'silent! tabmove ' . (tabpagenr()-2)<CR>
nnoremap <silent> <S-l> :execute 'silent! tabmove ' . (tabpagenr()+1)<CR>

" Terminal
map <silent> <leader>c :set termwinsize=15x0 <bar> term <CR>
map <silent> <leader>C :set termwinsize=0x70 <bar> vert term <CR>
tnoremap <silent> <Esc> <C-\><C-n>
tnoremap <silent> <C-w><C-j> <C-\><C-n><C-w>j
tnoremap <silent> <C-w><C-k> <C-\><C-n><C-w>k
tnoremap <silent> <C-w><C-h> <C-\><C-n><C-w>h
tnoremap <silent> <C-w><C-l> <C-\><C-n><C-w>l
tnoremap <C-h> <C-\><C-n> <bar> :tabnext<CR>
tnoremap <C-l> <C-\><C-n> <bar> :tabprevious<CR>

" Clear highlighted search items
nnoremap <silent> <ESC><ESC> :let @/ = ""<cr>

" Toggle line numbers
map <leader>n :set invnumber<CR>

" Avoid creating swap files in cwd
set backupdir=~/.vim/backup//
set directory=~/.vim/swap//
set undodir=~/.vim/undo//

" SCROLLING
map <ScrollWheelUp> <C-Y>
map <S-ScrollWheelUp> <C-U>
map <ScrollWheelDown> <C-E>
map <S-ScrollWheelDown> <C-D>

" Change cursor shape in insert mode
let &t_SI = "\<Esc>]1337;CursorShape=1\x7"
let &t_EI = "\<Esc>]1337;CursorShape=0\x7"


"""""""""""""""""""""""""""
" LESS Files auto-compile "
"""""""""""""""""""""""""""
" Set up function to Compile less to a css file in the same folder
function! CompileLessFile()
  let current = expand('%') " Path to current .less file's name
  let target = expand('%:r').".css" " Path to target .css file
  let shell_command = "!lessc ".current." ".target
  echo "Compiling less file..."
  if (executable('lessc'))
    execute shell_command
  endif
endfunction

" Call CompileLessFile() after writing a file or buffer with .less extension
autocmd FileWritePost,BufWritePost *.less :call CompileLessFile()

set noshowmode " Hides default status text for current mode
