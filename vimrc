call pathogen#helptags()
execute pathogen#infect()
syntax on
let g:TerminusITerm=1
set showmatch
set nocompatible
set visualbell
set number
set autochdir
set backspace=indent,eol,start
set guifont=Meslo\ LG\ S\ DZ\ Regular\ for\ Powerline:h13
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
set laststatus=2 "Always show statusline
set showcmd " Show incomplete commands
set hidden

" TABLINE
set showtabline=2
hi TabLine      ctermfg=Black  ctermbg=Green     cterm=NONE
hi TabLineFill  ctermfg=Black  ctermbg=Green     cterm=NONE
hi TabLineSel   ctermfg=White  ctermbg=DarkBlue  cterm=NONE

" FINDING FILES
set path+=**                " Search down into subfolders/Enables tabbing
set wildmenu                " Command line completion
set wildmode=list:longest   " Complete files like a shell
set ignorecase              " Make search case insensitive
set hlsearch                " make search highlight all matches
set incsearch
set diffopt+=vertical

" Trigger `autoread` when files changes on disk
autocmd FocusGained,BufEnter,CursorHold,CursorHoldI * if mode() != 'c' | checktime | endif

" Notification after file change
autocmd FileChangedShellPost *
  \ echohl WarningMsg | echo "File changed on disk. Buffer reloaded." | echohl None

" INDENT GUIDES
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_color_change_percent = 1
let g:indent_guides_guide_size = 1
let g:indent_guides_start_level = 2
let g:indent_guides_auto_colors = 0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=#282828 ctermbg=237
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven  guibg=#282828 ctermbg=236

" THEME RELATED
set background=dark
let g:gruvbox_contrast_dark = 'hard'
let g:gruvbox_italic = 1
let g:gruvbox_italicize_comments = 1
let g:gruvbox_italicize_strings = 1
" let g:gruvbox_invert_indent_guides = 1
" let g:gruvbox_invert_tabline = 1
" let g:gruvbox_improved_strings = 1
let g:gruvbox_improved_warnings = 1
colorscheme gruvbox

" SYNTASTIC
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" PRETTIER
let g:prettier#config#bracket_spacing = 'true'

" NETRW
let g:netrw_liststyle=3
let g:netrw_alto = 1
let g:netrw_altv = 1
let g:netrw_altfile=0
let g:netrw_hide=1
map <Leader>e :Explore<CR>
map <Leader>v :Vexplore<CR>
map <Leader>s :Sexplore<CR>
map <Leader>l :Lexplore<CR>
map <Leader>r :Rexplore<CR>
map <Leader>t :Texplore<CR>
set splitbelow
set splitright

" TABS
map <C-w><C-t> :tabnew<CR>
imap <C-w><C-t> :tabnew<CR>
map <C-w><C-,> :tabp<CR>
imap <C-w><C-,> :tabp<CR>
map <C-w><C-.> :tabn<CR>
imap <C-w><C-.> :tabn<CR>

" Map 'gcc' to 'Ctrl + /'
map <C-_> :Commentary<CR>

" Clear highlighted search items
nnoremap <leader>h :nohlsearch<cr>

" Toggle line numbers
map <leader>n :set invnumber<CR>

map <ScrollWheelUp> <C-Y>
map <S-ScrollWheelUp> <C-U>
map <ScrollWheelDown> <C-E>
map <S-ScrollWheelDown> <C-D>

" Avoid creating swap files in cwd
set backupdir=~/.vim/backup//
set directory=~/.vim/swap//
set undodir=~/.vim/undo//
