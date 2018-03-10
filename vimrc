call pathogen#helptags()
execute pathogen#infect()
set showmatch
set visualbell
set number
set ruler
set autochdir
syntax on
filetype plugin indent on
let g:airline_powerline_fonts = 1
set guifont=Hack:h13
set background=dark
set t_Co=256
set termguicolors
set expandtab
set shiftwidth=2
set softtabstop=2
set mouse=a
let g:gruvbox_contrast_dark = 'hard'
set autoread
let g:TerminusITerm=1
let laststatus=2
set noshowmode
colorscheme gruvbox

"||||| Triger `autoread` when files changes on disk ||||||
" https://unix.stackexchange.com/questions/149209/refresh-changed-content-of-file-opened-in-vim/383044#383044
" https://vi.stackexchange.com/questions/13692/prevent-focusgained-autocmd-running-in-command-line-editing-mode
autocmd FocusGained,BufEnter,CursorHold,CursorHoldI * if mode() != 'c' | checktime | endif
" Notification after file change
" https://vi.stackexchange.com/questions/13091/autocmd-event-for-autoread
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


" Syntastic config
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
"|||||||||||||||||||||||||||||||||||||||||||

let g:prettier#config#bracket_spacing = 'true'

" NETRW 
let g:netrw_liststyle = 3
map <C-n><C-e> :Explore<CR>
map <C-n><C-v> :Vexplore<CR>
map <C-n><C-s> :Sexplore<CR>
map <C-n><C-l> :Lexplore<CR>
map <C-n><C-r> :Rexplore<CR>
map <C-n><C-t> :Texplore<CR>

" TABS
map <C-t><C-n> :tabnew<CR>
imap <C-t><C-n> :tabnew<CR>
map <C-t><C-c> :tabclose<CR>
imap <C-t><C-c> :tabclose<CR>
