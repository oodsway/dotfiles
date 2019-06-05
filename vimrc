" if syntanx not enabled, enable it
"  https://stackoverflow.com/questions/33380451/is-there-a-difference-between-syntax-on-and-syntax-enable-in-vimscript#33380495

if !exists("g:syntax_on")
    syntax enable
endif

set history=500
set showcmd
set number
set scrolloff=7
set hlsearch "aka hls
set ignorecase "aka ic
set smartcase
set incsearch "aka is
set ruler
set wildmenu
set cmdheight=2
set autoindent
colorscheme desert
" set cursorline
" highlight CursorLine ctermbg=gray ctermfg=blue
" set cursorcolumn
filetype plugin indent on
