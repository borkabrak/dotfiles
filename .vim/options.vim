"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" SET OPTIONS
"
" This file should contain all 'set *' option settings that are
" position-independent (e.g., 'nocompatible', for vim, should come near the
" beginning
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Do NOT try to emulate vi.
set nocompatible

" Enable syntax highlighting
syntax enable

" Enable unicode.  Check first, as re-enabling causes issues when reloading.
if &encoding !~ '^utf-8'
    set encoding=utf-8
endif

" Use 256 colors
"   - This one is required before some colorschemes can take effect
set t_Co=256

" Allow hidden buffers (so you don't have to save all changes before so much
" as *looking* at another buffer)
set hidden

" Tabs are n spaces
set tabstop=4
set expandtab
set shiftwidth=4

" How to show tab characters when `:set list` is used
set listchars+=tab:]-,trail:•,extends:❯,precedes:❮

" Indent/outdent to the next tabstop
set shiftround

" Tabbing around tries to be smart about shiftwidth/tabstop distinctions
set smarttab

" ignore case in searches...
set ignorecase
" ...unless the pattern has uppercase characters or '\C' in it
set smartcase

set autoindent
set smartindent
set incsearch

set undofile
set undodir=$HOME/.vim/undo/
set undolevels=1000
set laststatus=2

" Set the height of the command window
set cmdwinheight=1

" Don't wrap lines on the WINDOW (mismatching it with the buffer)
set nowrap

" Maintain a few lines of context around the cursor
set scrolloff=3

" keep n lines of command history
set history=500

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

" Automatically reload externally changed files
set autoread

" Keep all swapfiles in a single, separate directory (avoid polluting other dirs with .swp files)
set directory=$HOME/.vim/swap/,~/tmp,/var/tmp,/tmp
" Backup files, too
set backupdir=$HOME/.vim/backup

" Better autocompletion
set wildmenu

" Which keys are allowed to wrap over to the next/previous lines?
set whichwrap=b,s,[,],<,>,~,h,l

" Reserve the ALT key for the windowing system (can't make mappings with it in vim this way)
set winaltkeys=yes

" Allow virtual editing in Visual block mode.
set virtualedit=block

" What to remember between sessions
set viminfo+=%

" Abbreviate various messages
set shortmess=atToOs

" show line numbers - setting both 'number' and 'relativenumber' uses a sort
" of mixed mode, where relative numbers are displayed on all lines *except*
" the current one.  This makes motion counts easier to see, while still
" leaving the current line in the file obvious.
set number
set relativenumber

" do not highlight search matches
set nohlsearch

" Respond to the mouse
set mouse=a

" Highlight the line with the cursor
" set cursorline
