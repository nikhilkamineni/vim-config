" MINPAC PLUGIN MANAGER "
packadd minpac
call minpac#init()
call minpac#add('k-takata/minpac', {'type':'opt'})

call minpac#add('w0rp/ale')
call minpac#add('jiangmiao/auto-pairs')
call minpac#add('mattn/emmet-vim')
call minpac#add('Yggdroot/indentLine')
call minpac#add('vim-airline/vim-airline')
call minpac#add('vim-airline/vim-airline-themes')
call minpac#add('airblade/vim-gitgutter')
call minpac#add('sheerun/vim-polyglot')
call minpac#add('mkitt/tabline.vim')
call minpac#add('justinmk/vim-dirvish')
call minpac#add('ervandew/supertab')
call minpac#add('lifepillar/vim-cheat40')

" Tpope
call minpac#add('tpope/vim-commentary')
call minpac#add('tpope/vim-fugitive')
call minpac#add('tpope/vim-repeat')
call minpac#add('tpope/vim-scriptease')
call minpac#add('tpope/vim-sensible')
call minpac#add('tpope/vim-sleuth')
call minpac#add('tpope/vim-surround')
call minpac#add('tpope/vim-unimpaired')
call minpac#add('tpope/vim-vinegar')

" Colorschemes
call minpac#add('nikhilkamineni/vim-gruvbox8', {'type': 'opt'})
call minpac#add('nikhilkamineni/Spacegray.vim', {'type': 'opt'})
call minpac#add('dracula/vim', {'name': 'dracula', 'type': 'opt'})

command! PackUpdate call minpac#update()
command! PackClean call minpac#clean()

syntax on
set showmatch
set nocompatible
set visualbell
set number
" set autochdir
" set backspace=indent,eol,start
set guifont=Hack:h14
" set t_Co=256
set termguicolors
set expandtab
set shiftwidth=2
set softtabstop=2
set mouse=a
set autoread
set updatetime=100
set clipboard=unnamed
set noshowmode " Hides default status text for current mode
set ttyfast " Faster redrawing
set lazyredraw
set laststatus=2 "Always show statusline
set showcmd " Show incomplete commands

" TABLINE
set showtabline=2
" hi TabLine      ctermfg=Black  ctermbg=Green     cterm=NONE
" hi TabLineFill  ctermfg=Black  ctermbg=Green     cterm=NONE
" hi TabLineSel   ctermfg=White  ctermbg=DarkBlue  cterm=NONE

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

" THEME RELATED
let &t_ut=''
" set cursorline
set background=dark
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
colorscheme gruvbox8
let g:airline_theme="hybrid"

" LESS Files auto-compile
function! CompileLessFile()
  let current = expand('%') " Path to current .less file's name
  let target = expand('%:r').".css" " Path to target .css file
  let shell_command = "!lessc ".current." ".target
  echo "Compiling less file..."
  if (executable('lessc'))
    execute shell_command
  endif
endfunction

autocmd FileWritePost,BufWritePost *.less :call CompileLessFile()

map <leader>l :call CompileLessFile()<CR>

" NETRW
map <silent> <Leader>e :Explore<CR>
map <silent> <Leader>v :vsplit <bar> Explore<CR>
map <silent> <Leader>s :Sexplore<CR>
map <silent> <Leader>t :Texplore<CR>

map <Leader>b :bd<CR>

set splitbelow
set splitright

" CODE FOLDING
set foldmethod=indent
set foldlevel=99
nnoremap <space> za

" DIRVISH
let g:loaded_netrwPlugin = 1
command! -nargs=? -complete=dir Explore Dirvish <args>
command! -nargs=? -complete=dir Texplore tabnew | silent Dirvish <args>
command! -nargs=? -complete=dir Sexplore split | silent Dirvish <args>
command! -nargs=? -complete=dir Vexplore vsplit | silent Dirvish <args>
map <silent> <Leader>E :Dirvish %<CR>
map <silent> <Leader>T :tabnew <bar> Dirvish %<CR>
map <silent> <Leader>S :split <bar> Dirvish %<CR>
map <silent> <Leader>V :vsplit <bar> Dirvish %<CR>
" Map gh to toggle show hidden files
nnoremap <buffer> gh :call ToggleDotfiles()<CR>

" TABS
map <C-w><C-t> :tabnew<CR>
imap <C-w><C-t> :tabnew<CR>
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

" Map 'gcc' to 'Ctrl + /'
map <C-_> :Commentary<CR>

" Clear highlighted search items
nnoremap <silent> <ESC><ESC> :let @/ = ""<cr>

" Toggle line numbers
map <leader>n :set invnumber<CR>

" ALE
let g:airline#extensions#ale#enabled = 1
let g:ale_completion_enabled = 1
let g:ale_completion_delay = 200
let g:ale_fixers = {
\  'javascript': ['prettier', 'eslint'],
\  'c': ['clang-format', 'trim_whitespace'],
\  'cpp': ['clang-format', 'trim_whitespace'],
\  'markdown': ['prettier'],
\  'python': ['autopep8', 'black', 'yapf', 'isort', 'remove_trailing_lines', 'trim_whitespace'],
\  'json': ['prettier', 'fixjson', 'trim_whitespace']
\}
let g:ale_linters = {
\   'python': ['autopep8', 'flake8'],
\   'javascript': ['eslint']
\}
let g:ale_javascript_prettier_options = '--single-quote'
map <Leader>f :ALEFix<CR>
map <Leader>a :ALEToggle<CR>
map <Leader>A :ALEDetail<CR>

" Avoid creating swap files in cwd
set backupdir=~/.vim/backup//
set directory=~/.vim/swap//
set undodir=~/.vim/undo//

" EMMETT
let g:user_emmet_leader_key='<C-e>'

" Supertab
let g:SuperTabClosePreviewOnPopupClose = 1
let g:SuperTabDefaultCompletionType = "<c-n>"

" SCROLLING
map <ScrollWheelUp> <C-Y>
map <S-ScrollWheelUp> <C-U>
map <ScrollWheelDown> <C-E>
map <S-ScrollWheelDown> <C-D>

" Change cursor shape in insert mode
let &t_SI = "\<Esc>]1337;CursorShape=1\x7"
let &t_EI = "\<Esc>]1337;CursorShape=0\x7"
