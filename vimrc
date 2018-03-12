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
set guifont=Source\ Code\ Pro\ Medium\ for\ Powerline:h14
set t_Co=256
set termguicolors
set expandtab
set shiftwidth=2
set softtabstop=2
set mouse=a
set autoread
set updatetime=100
set clipboard^=unnamed,unnamedplus
set noshowmode " Hides default status text for current mode
set ttyfast " Faster redrawing
set laststatus=2 "Always show statusline
set showcmd " Show incomplete commands

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
let g:airline_powerline_fonts = 1
let g:gruvbox_italic = 1
let g:gruvbox_italicize_comments = 1
let g:gruvbox_italicize_strings = 1
let g:gruvbox_contrast_dark = 'hard'
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
" let g:netrw_liststyle = 1
map <Leader>e :Explore<CR>
map <Leader>v :Vexplore<CR>
map <Leader>s :Sexplore<CR>
map <Leader>l :Lexplore<CR>
map <Leader>r :Rexplore<CR>
map <Leader>t :Texplore<CR>

" TABS
map <C-t><C-n> :tabnew<CR>
imap <C-t><C-n> :tabnew<CR>
map <C-t><C-c> :tabclose<CR>
imap <C-t><C-c> :tabclose<CR>

" Map 'gcc' to 'Ctrl + /'
map <C-_> :Commentary<CR>

" Clear highlighted search items
nnoremap <leader>h :nohlsearch<cr>
