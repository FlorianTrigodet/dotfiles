" install pathogen:
" mkdir -p ~/.vim/autoload ~/.vim/bundle && \
" curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
"
" install plugins:
" cd ~/.vim/bundle
" git clone https://github.com/vim-scripts/syntastic.git
" git clone https://github.com/morhetz/gruvbox.git
" git clone https://github.com/vim-airline/vim-airline
" git clone https://github.com/vim-airline/vim-airline-themes

set nocompatible

" ennable the use of mouse
set mouse=v

" add line number
set number

" coloration
filetype plugin on
syntax on

" unable auto comment (when paste)
set paste


execute pathogen#infect()
set term=xterm-256color
set background=dark
" colorscheme mustang
colorscheme gruvbox


" When editing a file, always jump to the last cursor position
autocmd BufReadPost *
\ if ! exists("g:leave_my_cursor_position_alone") |
\ if line("'\"") > 0 && line ("'\"") <= line("$") |
\ exe "normal g'\"" |
\ endif |
\ endif
set cursorline


let g:airline#extensions#tabline#enabled = 1

