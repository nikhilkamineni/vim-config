call pathogen#helptags()
execute pathogen#infect()
syntax on
" let g:TerminusITerm=1
set showmatch
set nocompatible
set visualbell
set number
" set autochdir
set backspace=indent,eol,start
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
set wildmenu                " Command line completion
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
let g:gruvbox_contrast_dark = 'hard'
let g:gruvbox_italic = 1
let g:gruvbox_italicize_comments = 1
let g:gruvbox_italicize_strings = 1
" let g:gruvbox_filetype_hi_groups = 1
" let g:gruvbox_plugin_hi_groups = 1
" let g:gruvbox_invert_indent_guides = 1
" let g:gruvbox_invert_tabline = 1
" let g:gruvbox_improved_strings = 1
" let g:gruvbox_improved_warnings = 1
colorscheme gruvbox8_hard
let g:airline_theme='gruvbox'

" NETRW
map <Leader>e :Explore<CR>
map <Leader>v :Vexplore<CR>
map <Leader>s :Sexplore<CR>
map <Leader>t :Texplore<CR>

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
" Map gh to toggle show hidden files
nnoremap <buffer> gh :call ToggleDotfiles()<CR>

" TABS
map <C-w><C-t> :tabnew<CR>
imap <C-w><C-t> :tabnew<CR>
nnoremap <C-h> :tabprevious<CR>
nnoremap <C-l> :tabnext<CR>
nnoremap <silent> <S-h> :execute 'silent! tabmove ' . (tabpagenr()-2)<CR>
nnoremap <silent> <S-l> :execute 'silent! tabmove ' . (tabpagenr()+1)<CR>

"Terminal
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
 \  'python': ['autopep8', 'black', 'yapf', 'isort', 'remove_trailing_lines', 'trim_whitespace']
\}
let g:ale_linters = {
\   'python': ['autopep8'],
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

" SCROLLING
map <ScrollWheelUp> <C-Y>
map <S-ScrollWheelUp> <C-U>
map <ScrollWheelDown> <C-E>
map <S-ScrollWheelDown> <C-D>
