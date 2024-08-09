" DNA syntax file
" Usage
"
" :set syntax=DNA

# remove max num of character that can be highlighted
set synmaxcol=0

syn match A "A"
syn match T "T"
syn match C "C"
syn match G "G"

hi A ctermfg=36  term=bold
hi T ctermfg=125  term=bold
hi C ctermfg=215 term=bold
hi G ctermfg=230 term=bold
