"===============================================================================
" VUNDLE - package manager for Vim plugins
"
"   Register and configure plugins here
"
"
"   GETTING STARTED WITH VUNDLE:
"   --------------------------------
"
"   1.) The idea is to use vundle to manage all the other vim plugins one
"   desires.  But to get vundle in the first place, go to/create the folder
"   '~/.vim/bundle' and run the following command within it:
"
"
"   $ mkdir ~/.vim/bundle
"   $ git clone 'https://github.com/gmarik/vundle.vim' ~/.vim/bundle
"
"   2.) Then initialize all the vundle-managed plugins by opening vim and
"   running:
"
"   :PluginInstall<cr>
"
"
"===============================================================================
" USEFUL VUNDLE COMMANDS:
"   :PluginList          - list configured plugins
"   :PluginInstall(!)    - install (update) plugins
"   :PluginSearch(!) foo - search (or refresh cache first) for foo
"   :PluginClean(!)      - confirm (or auto-approve) removal of unused plugins
" see :help vundle for more details or wiki for FAQ
"===============================================================================

filetype off
set rtp+=~/.vim/bundle/vundle.vim
call vundle#begin()
  " Vundle itself
  Plugin 'gmarik/vundle.vim'

  " Some stuff requires vimproc..
  " Let's put it near the beginning.
  Plugin 'Shougo/vimproc'

  " vim-misc is required for vim-notes
  Plugin 'xolox/vim-misc'
  " Run with :Note
  Plugin 'xolox/vim-notes'

  " Colorschemes!
  Plugin 'flazz/vim-colorschemes'
  Plugin 'altercation/vim-colors-solarized'
  "Light
  Plugin 'scheakur/vim-scheakur'
  "dark, greenish
  Plugin 'gryftir/gryffin'
  "Light, better than morning
  Plugin 'jlesquembre/peaksea'
  Plugin 'kreeger/benlight'
  Plugin 'trusktr/seti.vim'

  " Trying out a different status line..
  Plugin 'bling/vim-airline'
    if !exists('g:airline_symbols')
        let g:airline_symbols = {}
        " let g:airline_left_sep = ''
        " let g:airline_left_alt_sep = ''
        " let g:airline_right_sep = ''
        " let g:airline_right_alt_sep = ''
        " let g:airline_symbols.branch = ''
        " let g:airline_symbols.readonly = ''
        " let g:airline_symbols.linenr = ''
        " let g:airline_left_sep = '»'
        " let g:airline_right_sep = '«'
        " let g:airline_symbols.linenr = '␤'
        " let g:airline_symbols.paste = 'ρ'
        " let g:airline_symbols.paste = 'Þ'
        let g:airline_left_sep = '▶'
        let g:airline_right_sep = '◀'
        let g:airline_symbols.linenr = '¶'
        let g:airline_symbols.branch = '⎇'
        let g:airline_symbols.paste = '∥'
        let g:airline_symbols.whitespace = 'Ξ'
    endif

  " Sorta like vimium's helptags when browsing, but this is for moving around
  " in the file.  Key: <leader><leader>w
  " Plugin 'Lokaltog/vim-easymotion'

  " Have tags without thinking about them
  "Bundle 'xolox/vim-easytags'

  " Git commands from within vim
  Plugin 'tpope/vim-fugitive'
    " Use git to recursively find the word under the cursor everywhere in the
    " current directory, piping the results to the quickfix list
    nnoremap <leader>G :silent Ggrep <cword> \| copen<cr>

  " Surround is kind of awesome for quotes and whatnot
  Plugin 'tpope/vim-surround'

  " A writing aid to 'hyperfocus' on what you're doing (goyo uses limelight)
  Plugin 'junegunn/limelight.vim'
  let g:limelight_conceal_ctermfg = 'gray'
  Plugin 'junegunn/goyo.vim'
    nnoremap <f4> :Goyo<cr>
    " GOYO AND LIMELIGHT
    " I might not like this after a while, but I'm giving it a shot.  These two
    " plugins more or less go together
    " Think 'hyperfocus'  :)
    function! GoyoBefore()
        Limelight
    endfunction
    function! GoyoAfter()
        Limelight!
    endfunction
    let g:goyo_callbacks = [function('GoyoBefore'), function('GoyoAfter')]

  " 'Zen' coding - the original
  Plugin 'mattn/emmet-vim'
  "let g:user_emmet_leader_key = '<C-j>'
  imap <C-j> <C-y>

  """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
  " NERDTree - The tried-and-true file browser
  "
  Plugin 'scrooloose/nerdtree'
  """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
        let NERDTreeDirArrows=1
        let NERDTreeShowBookmarks=1

        " When opening NERDTree, show the current directory, but leave the cursor
        " in the current window
        noremap <F2> :NERDTreeFind<cr><C-W><C-W>

        " This provides an alternative way to invoke NERDTree, which also serves
        " as an easy way to close it (NERDTreeFind does not)
        noremap <S-F2> :NERDTreeToggle<cr>
        """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

  """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
  " CtrlP
  "
  " A different approach to file navigation.  This is kind of a game changer
  " for managing buffers
  Plugin 'kien/ctrlp.vim'
  """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
        " Select from active buffers
        nnoremap <space><space> :CtrlPBuffer<cr>

        " Make CtrlP rebuild its list next time (in case, e.g., files on disk
        " have changed.)
        nnoremap <f3> :CtrlPClearCache<cr>
        """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

  " Streamlined commenting
  Plugin 'scrooloose/nerdcommenter'

  " Live syntax checking
  Plugin 'scrooloose/syntastic'

  " Unite promises to be a replacement for CtrlP (and more).
  " Read more at http://bling.github.io/blog/2013/06/02/unite-dot-vim-the-plugin-you-didnt-know-you-need/
  Plugin 'shougo/unite.vim'

  " Maybe *this* is a better file browser. (Really, a cleanup of netrw's
  " native interface.)  Key: -
  Plugin 'tpope/vim-vinegar'

  " Coffeescript support
  Plugin 'kchmck/vim-coffee-script'

  " Better 'ga', e.g.
  Plugin 'tpope/vim-characterize'

  " JSON manipulation and pretty-printing
  "   Get started with 'gqaj'
  Plugin 'tpope/vim-jdaddy'

  " unimpaired.vim: pairs of handy bracket mappings http://www.vim.org/scripts/script.php?script_id=1590
  " ( The proximate reason for installing this is to use [q/]q/[Q/]Q to step
  " through the quickfix list. )
  Plugin 'tpope/vim-unimpaired'

  " Laravel's Blade syntax
  " Plugin 'xsbeats/vim-blade'

  """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
  " Vim-orgmode: Text outlining and task management for Vim based on Emacs'
  "              Org-Mode.
  """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
  Plugin 'tpope/vim-speeddating'
  Plugin 'vim-scripts/utl.vim'
  Plugin 'jceb/vim-orgmode'
  """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

  Plugin 'AndrewRadev/linediff.vim'

  "Foldsearch:
  " This plugin provides commands that fold away lines that don't match a
  " specific search pattern. This pattern can be the word under the cursor, the
  " last search pattern, a regular expression or spelling errors. There are also
  " commands to change the context of the shown lines.
  Plugin 'embear/vim-foldsearch'

  " Provide some of TextMate's snippets features
  Plugin 'msanders/snipmate.vim'

  " Better markdown syntax - some features require 'msanders/snipmate'
  " Plugin 'hallison/vim-markdown'
  
  "" A snippets engine
  "Plugin 'SirVer/ultisnips'
  "" The snippets themselves
  "Plugin 'honza/vim-snippets'
  "  let g:UltiSnipsExpandTrigger="<tab>"
  "  let g:UltiSnipsJumpForwardTrigger="<c-b>"
  "  let g:UltiSnipsJumpBackwardTrigger="<c-z>"
  "  " Let snippets split the window?
  "  let g:UltiSnipsEditSplit="vertical"

  " Provide ':AnsiEsc', to toggle display/interpretation of ANSI control characters (colors, mostly)
  "     Try running it on its own help page.
  Plugin 'ponzellus/AnsiEsc'

  " This is supposed to provide some pretty amazing autocomplete functionality
  Plugin 'Valloric/YouCompleteMe'

  " Inline highlighting of CSS color declarations.  Pretty cool.
  "     (A name without a slash for the Plugin command has an assumed prefix of 'vim-scripts/')
  Plugin 'css_color'

  " Color *picker*
  Plugin 'KabbAmine/vCoolor.vim'
  nnoremap <leader>C :VCoolor<cr>

  " Typescript syntax, etc.
  Plugin 'leafgarland/typescript-vim'

  " Syntax for LESS (CSS dialect)
  Plugin 'groenewege/vim-less'

  " Session manager
  Plugin 'vim-scripts/sessionman.vim'

  " Source code browser (supports C/C++, java, perl, python, tcl, sql, php, etc) http://www.vim.org/scripts/script.php?script_id=273
  Plugin 'taglist.vim'

  " 'The missing motion for vim'
  Plugin 'justinmk/vim-sneak'
  let g:sneak#s_next = 1

  " HTML5 + inline SVG omnicomplete function, indent and syntax for Vim.
  Plugin 'othree/html5.vim'
  
call vundle#end()
filetype plugin indent on

" =========================================================================
" FOR SOME REASON, THESE CALLS TO UNITE FUNCTIONS CANNOT GO INSIDE VUNDLE
" SETUP begin/end block: THIS IS MESSY AND LESS THAN IDEAL, BUT WORKS FOR NOW.

" Browse buffers
nnoremap <leader>b :Unite buffer<cr>
" Browse files
nnoremap <leader>f :Unite file<cr>

nnoremap <leader>F :Unite -start-insert file_rec/async:!<cr>

" Set Unite to act sorta like CtrlP:
" ( Alternative prompt char: »)
call unite#custom#profile('default', 'context', {
\   'winheight': 10,
\   'direction': 'botright',
\   'prompt': '❯ ',
\ })

" Don't suggest certain file types to edit
call unite#custom#source('file_rec,file_rec/async',
    \ 'ignore_pattern', '.*\.exe$\|.*\.dll\|.*\.so')

" Tell Unite to ignore the same globs the rest of vim does
call unite#custom#source('file_rec,file_rec/async', 'ignore_globs', split(&wildignore, ','))

" let g:unite_ignore_source_files = ['*.dll']
" =========================================================================
