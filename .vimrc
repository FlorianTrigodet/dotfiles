" install pathogen:
" mkdir -p ~/.vim/autoload ~/.vim/bundle && \
" curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
"
" install plugins:
" cd ~/.vim/bundle
" git clone https://github.com/morhetz/gruvbox.git
" git clone https://github.com/vim-airline/vim-airline
" git clone https://github.com/vim-airline/vim-airline-themes
" git clone https://github.com/godlygeek/tabular.git
" git clone https://github.com/tpope/vim-fugitive
" git clone https://github.com/jamshedvesuna/vim-markdown-preview
" git clone --recursive https://github.com/davidhalter/jedi-vim.git
" git clone https://github.com/preservim/vim-indent-guides.git

set nocompatible

" enable the use of mouse
set mouse=a

" add line number
set number relativenumber

" spelling
set nospell

" no wrap
set nowrap

" coloration
filetype plugin indent on
set hlsearch
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red
syntax on

" unable auto comment (when paste)
" set paste


execute pathogen#infect()
set term=xterm-256color
set background=dark
" colorscheme mustang
let g:gruvbox_guisp_fallback = "bg"
colorscheme gruvbox

" indent highlight
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_start_level=2
let g:indent_guides_guide_size = 1

" When editing a file, always jump to the last cursor position
autocmd BufReadPost *
\ if ! exists("g:leave_my_cursor_position_alone") |
\ if line("'\"") > 0 && line ("'\"") <= line("$") |
\ exe "normal g'\"" |
\ endif |
\ endif
set cursorline


let g:airline#extensions#tabline#enabled = 1

set tabstop=4
set softtabstop=4
set shiftwidth=4
set smarttab
set expandtab
set backspace=indent,eol,start
set list

" markdown preview
let vim_markdown_preview_toggle=1
let vim_markdown_preview_browser='Google Chrome'
let vim_markdown_preview_github=1
let vim_markdown_preview_hotkey='<C-m>'

" leader is space
let mapleader=" "

" jedi stuff
let g:jedi#show_call_signatures = 1
let g:jedi#smart_auto_mappings = 1

" toggle tagbar
nmap <leader>v :TagbarToggle<CR>

" DNA stuff
cnoreabbrev DNA_col set syntax=DNA

" Copilot off by default
let g:copilot_enabled = 0
