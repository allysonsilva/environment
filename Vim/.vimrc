" ⎡⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺⎤
" ⎜ Vim Configuration - v1.0.0 ⎜
" ⎣⎽⎽⎽⎽⎽⎽⎽⎽⎽⎽⎽⎽⎽⎽⎽⎽⎽⎽⎽⎽⎽⎽⎽⎽⎽⎽⎽⎦

set nocompatible
filetype off

set encoding=utf-8
scriptencoding utf-8

" ✪✪✪
" :help key-notation

" ❒❒❒❒❒❒❒❒❒❒❒❒❒❒❒❒❒❒❒❒❒❒❒
" Minimalist Vim Plugin Manager
" ❒❒❒❒❒❒❒❒❒❒❒❒❒❒❒❒❒❒❒❒❒❒❒

" Using vim-plug for plugins
" @see https://github.com/junegunn/vim-plug#usage
call plug#begin('~/.vim/plugged')

  " ++++++++++++++++++++++
  " General Editing / Misc
  " ++++++++++++++++++++++

Plug 'scrooloose/nerdtree'              " A tree explorer plugin for vim.
Plug 'scrooloose/nerdcommenter'         " Make commenting easy | Vim plugin for intensely orgasmic commenting.
Plug 'vim-airline/vim-airline'          " Lean & mean status/tabline for vim thats light as air.
Plug 'vim-airline/vim-airline-themes'   " A collection of themes for vim-airline.
Plug 'ryanoasis/vim-devicons'           " Adds file type glyphs/icons to popular Vim plugins: NERDTree, vim-airline, Powerline, Unite, vim-startify and more.
Plug 'tpope/vim-eunuch'                 " eunuch.vim: helpers for UNIX | Vim sugar for the UNIX shell commands that need it the most.
" Plug 'terryma/vim-multiple-cursors'     " True Sublime Text style multiple selections for Vim.
Plug 'tpope/vim-unimpaired'             " unimpaired.vim: pairs of handy bracket mappings.
Plug 'cohama/lexima.vim'                " Auto close parentheses and repeat by dot dot dot...
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'  " Extra syntax and highlight for nerdtree files.

  " ++++++++++++++++++++
  " Style / Color Scheme
  " ++++++++++++++++++++

Plug 'morhetz/gruvbox'                  " Retro groove color scheme for Vim.
Plug 'dracula/vim', { 'as': 'dracula' } " A dark theme for Vim.
Plug 'gregsexton/MatchTag'              " Vim MatchParen for HTML tags.
Plug 'kien/rainbow_parentheses.vim'     " Colorize parentheses and similar chars | Better Rainbow Parentheses.

  " +++++++++
  " Searching
  " +++++++++

Plug 'haya14busa/incsearch.vim'         " Improved incremental searching for Vim | incsearch.vim incrementally highlights ALL pattern matches unlike default incsearch.
Plug 'mileszs/ack.vim'                  " Vim plugin for the Perl module / CLI script ack | Run your favorite search tool from Vim, with an enhanced results list.

  " ++++++++
  " Snippets
  " ++++++++

Plug 'honza/vim-snippets'               " vim-snipmate default snippets (Previously snipmate-snippets)
Plug 'mattn/emmet-vim'                  " expanding html abbreviations, like zencode | emmet for vim.

  " +++
  " Git
  " +++
Plug 'Xuyuanp/nerdtree-git-plugin'      " A plugin of NERDTree showing git status.
Plug 'tpope/vim-fugitive'               " Git from vim | fugitive.vim: a Git wrapper so awesome, it should be illegal.
Plug 'airblade/vim-gitgutter'           " A Vim plugin which shows a git diff in the gutter (sign column) and stages/undoes hunks.

  " +++++++++
  " Languages
  " +++++++++

" General
Plug 'sheerun/vim-polyglot'             " A solid language pack for Vim.

" Html
Plug 'othree/html5.vim'
" Css
Plug 'ap/vim-css-color'
Plug 'hail2u/vim-css3-syntax'
" JS
Plug 'pangloss/vim-javascript'
" Markdown
Plug 'tpope/vim-markdown'
" Php
Plug 'StanAngeloff/php.vim'
Plug 'rayburgemeestre/phpfolding.vim'
Plug 'lvht/phpcd.vim', { 'for': 'php', 'do': 'composer install' }
" Plug 'arnaud-lb/vim-php-namespace'
Plug '2072/PHP-Indenting-for-VIm'

  " ++++++++++++++++++++++++++++
  " Development Tool Integration
  " ++++++++++++++++++++++++++++

Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'

" Initialize plugin system
call plug#end()

if filereadable(expand("~/.vimrc.bundles"))
  source ~/.vimrc.bundles
endif

" ❒❒❒❒❒❒❒❒❒❒❒
" [Vim Settings]
" ❒❒❒❒❒❒❒❒❒❒❒

syntax on " Adds vim color based on file
          " Enable highlighting for syntax
set t_Co=256 " FORCE 256 colors in vim

let mapleader = "," " The <Leader> key is mapped to [\] by default. So if you have a map of <Leader>t, you can execute it by default with [\]+[t]
let maplocalleader = ";" " This is meant to be a prefix for mappings that only take effect for certain types of files

if has("eval")
  filetype plugin indent on " Enable file type detection, plugins and indent
endif

" Clipboard
if has("clipboard")
  set clipboard=unnamed " Copy to the system clipboard

  if has("unnamedplus") " X11 support
    set clipboard+=unnamedplus
  endif
endif

" List chars {{{
    set list " Shows certain hidden chars
    set listchars=space:.,tab:▸\ ,trail:·,extends:»,precedes:« " Display extra whitespace

    highlight SpecialKey term=standout ctermfg=darkgray guifg=darkgray

    " Display/Hide white space characters with F3
    " Toggle show/hide invisible chars
    nnoremap <F3> :set list! list?<CR>
" }}}

" Colors/Theming {{{

    " ###########################
    " --- Rainbow Parentheses ---
    " ###########################

    " Better Rainbow Parentheses (Always On:)
    au VimEnter * RainbowParenthesesToggle
    au Syntax * RainbowParenthesesLoadRound
    au Syntax * RainbowParenthesesLoadSquare
    au Syntax * RainbowParenthesesLoadBraces

    " :RainbowParenthesesToggle       " Toggle it on/off
    " :RainbowParenthesesLoadRound    " (), the default when toggling
    " :RainbowParenthesesLoadSquare   " []
    " :RainbowParenthesesLoadBraces   " {}
    " :RainbowParenthesesLoadChevrons " <>

    let g:rbpt_colorpairs = [
        \ ['brown',       'RoyalBlue3'],
        \ ['Darkblue',    'SeaGreen3'],
        \ ['darkgray',    'DarkOrchid3'],
        \ ['darkgreen',   'firebrick3'],
        \ ['darkcyan',    'RoyalBlue3'],
        \ ['darkred',     'SeaGreen3'],
        \ ['darkmagenta', 'DarkOrchid3'],
        \ ['brown',       'firebrick3'],
        \ ['gray',        'RoyalBlue3'],
        \ ['black',       'SeaGreen3'],
        \ ['darkmagenta', 'DarkOrchid3'],
        \ ['Darkblue',    'firebrick3'],
        \ ['darkgreen',   'RoyalBlue3'],
        \ ['darkcyan',    'SeaGreen3'],
        \ ['darkred',     'DarkOrchid3'],
        \ ['red',         'firebrick3'],
    \ ]

    let g:rbpt_max = 16
    let g:rbpt_loadcmd_toggle = 0

    " #####################
    " Gruvbox Configurations
    " #####################
    let g:gruvbox_contrast_dark = 'soft'

    " Turn on syntax highlightning
    set background=dark
    colorscheme gruvbox

    " Cursor
    hi CursorLine cterm=NONE term=bold guibg=white ctermbg=237 ctermfg=NONE

    " " Background color equal to terminal (Removes background color from theme)
    " hi! Normal ctermbg=NONE guibg=NONE
    " hi! NonText ctermbg=NONE guibg=NONE
" }}}

" Indentation and Text-Wrap {{{
    set autoindent
    set cindent
    set indentkeys-=0#
    set cinkeys-=0#
    set cinoptions=:s,ps,ts,cs
    set cinwords=if,else,while,do,for,switch,case
    set nowrap                      " don't wrap lines

    " map <F9> :set wrap!<cr>

    set expandtab                   " expand tabs by default (overloadable per file type later) | use spaces, not tabs
    set tabstop=4                   " tab is # spaces
    set softtabstop=4               " when hitting <BS>, pretend like a tab is removed, even if spaces | Tab key results in # spaces
    set shiftwidth=4                " number of spaces to use for autoindenting | the # of spaces for indenting
    set shiftround                  " use multiple of shiftwidth when indenting with '<' and '>'
    set nomodeline                  " disable mode lines (security measure)

    " set pastetoggle=<F4>            " when in insert mode, press <F4> to go to
    "                                 "    paste mode, where you can paste mass data
    "                                 "    that won't be autoindented
    " nnoremap <F4> :set invpaste paste?<CR>

    set smarttab                    " insert tabs on the start of a line according to
                                    "    shiftwidth, not tabstop | Insert Tabs at ^ per shiftwidth, not tabstop

    set formatoptions+=1            " When wrapping paragraphs, don't end lines
                                    "    with 1-letter words (looks stupid)
    " or set formatoptions=qrn1     " automatic formating.
" }}}

" Wildmenu completion {{{
    " wildmenu e wildmode são usados ​​para conclusão da linha de comando.
    set wildmenu  " Make tab completion for files/buffers act like bash
                  " Show list instead of just completing
    set wildchar=<TAB>              " show possible completions.
    set wildmode=list:longest,full  " show a list when pressing tab and complete first full match | Command <Tab> completion, list matches, then longest common part, then all.
    " or list:longest,list:full     " use emacs-style tab completion when selecting files, etc.

    if exists("&wildignorecase")
        set wildignorecase          " Ignore case in file name completion
    endif

    set completeopt=longest,menuone                  " In insert mode, type the first couple of characters of a word | Ctrl-N to insert the next matching word or Ctrl-P to insert the previous matching word.

    set wildignore+=.hg,.git,.svn                    " Version control
    set wildignore+=*.aux,*.out,*.toc                " LaTeX intermediate files
    set wildignore+=*.jpg,*.bmp,*.gif,*.png,*.jpeg   " binary images
    set wildignore+=*.o,*.obj,*.exe,*.dll,*.manifest " compiled object files
    set wildignore+=*.spl                            " compiled spelling word lists
    set wildignore+=*.sw?                            " Vim swap files
    set wildignore+=*.DS_Store                       " OSX bullshit
    set wildignore+=node_modules/**                  " Node
    set wildignore+=.history/**
    set wildignore+=*.swp,*.bak,*.class
    set wildignore+=~/tmp/**,tmp/**,build/**,coverage/**
    set wildignore+=*.pyc
    set wildignore+=*.orig                           " Merge resolution files
" }}}

" UI settings {{{
    " set inccommand=split
    set statusline=%F%m%r%h%w\ [POS=%04l,%04v][%p%%]
    " or set statusline=%<%f\ (%{&ft})\ %-4(%m%)%=%-19(%3l,%02c%03V%)
    set cmdheight=1                 " use a status bar that is 1 rows high
    set mouse=a                     " enable using the mouse if terminal emulator
                                    "    supports it (xterm does) | Enable mouse, all modes.
    set scrolloff=4                 " keep 4 lines off the edges of the screen when scrolling | Show next three lines scrolling.
                                    "    When searching in vim, make sure the search hit is never at the bottom.
    set sidescrolloff=2             " Show next two columns scrolling
    set laststatus=2                " tell VIM to always put a status line in, even
                                    "    if there is only one window

    " Open new split panes to right and bottom, which feels more natural
    set splitbelow                  " New horizontal splits are below
    set splitright                  " New vertical splits are to the right

    set title                       " change the terminal's title | Show the filename in the window title bar.
    set showmode                    " always show what mode we're currently editing in | Shows input or replace mode at bottom
    set ruler                       " Show position in bottom right | Show the cursor position all the time
    set number                      " always show line numbers
    set relativenumber
    set numberwidth=5               " width of numbers line (default on gvim is 4)
    set showcmd                     " show (partial) command in the last line of the screen
                                    "    this also shows visual selection info | display incomplete commands
    set cursorline                  " underline the current line, for quick orientation
    set showmatch                   " set show matching parenthesis | Show matching brackets/parenthesis | Cursor shows matching ) and }
    set backspace=indent,eol,start  " allow backspacing over everything in insert mode | allow deletion of previously entered data in insert mode

    set conceallevel=3

    " Toggle line numbers [\N]
    nnoremap <leader>N :setlocal number!<cr>

    " Speed up scrolling of the viewport slightly [CTRL+e and CTRL+y]
    nnoremap <C-e> 3<C-e>
    nnoremap <C-y> 3<C-y>
" }}}

" Search / Regexp {{{
    set ignorecase                  " Searches are case insensitive... | ignore case when searching
    set smartcase                   " ignore case if search pattern is all lowercase,
                                    "    case-sensitive otherwise
    set hlsearch                    " highlight search terms | Highlight matches
    set incsearch                   " show search matches as you type | do incremental searching
    set gdefault                    " search/replace 'globally' (on a line) by default | Applies substitutions globally on lines. Append 'g' to invert back.
" }}}

" Folds Settings {{{
    set nofoldenable
    " set foldenable
    set foldmethod=indent
    set foldlevel=1
    set fillchars=fold:.

    " highlight Folded ctermfg=Grey ctermbg=Black
" }}}

" Performance/Buffer {{{
    set hidden                  " Can put buffer to the background without writing to disk, will remember history/marks
                                " Hides buffers, instead of closing, or forcing save
    set lazyredraw              " Don't update the display while executing macros
    set ttyfast                 " Send more characters at a given time
" }}}

" History/File handling/Backup and Swap files {{{
    set autowriteall
    set autoread                    " automatically reload files changed outside of Vim | Reload files changed outside vim
                                    " If a file is changed outside of vim, automatically reload it without asking

    set history=10000               " remember more commands and search history
    set undolevels=1000             " use many muchos levels of undo
    set undoreload=10000

    if v:version >= 730
        " set undofile                        " keep a persistent backup file | Enable undo file
        " set undodir=~/.vim/undo,~/tmp,/tmp " undos files
    endif

    " Don't make backups at all
    set nobackup                    " do not keep backup files, it's 70's style cluttering
    set nowritebackup
    set noswapfile                   " do not write annoying intermediate swap files, who did ever restore from swap files anyway?

    set backupdir=~/.vim/back/,~/tmp,/tmp " backups files
    set directory=~/.vim/swap,~/tmp,/tmp  " swap files
                                    " store swap files in one of these directories
                                    "    (in case swapfile is ever turned on)
    " set viminfo='20,\"80          " read/write a .viminfo file, don't store more
                                    "    than 80 lines of registers
    " set viminfo='1000,f1,:1000,/1000
" }}}

" Functions/Startup/Maps {{{
    " Jump to last cursor position unless it's invalid or in an event handler
    autocmd BufReadPost * call SetCursorPosition()

    function! SetCursorPosition()
        if &filetype !~ 'git'
            if line("'\"") > 0 && line("'\"") <= line("$")
                exe "normal! g`\""
                normal! zz
            endif
        endif
    endfunction

    function! CleanWhiteSpace()
        let l = line(".")
        let c = col(".")
        :%s/\s\+$//e
        let last_search_removed_from_history = histdel('s', -1)
        call cursor(l, c)
    endfunction()

    function! RemoveBlankLinesAtTheEndOfFile()
        let l = line(".")
        let c = col(".")
        :%s#\($\n\s*\)\+\%$##e
        let last_search_removed_from_history = histdel('s', -1)
        call cursor(l, c)
    endfunction()

    command! -nargs=0 CleanWhiteSpace :call CleanWhiteSpace()
    command! -nargs=0 RemoveBlankLinesAtTheEndOfFile :call RemoveBlankLinesAtTheEndOfFile()

    " Autocommands {{{
        " Remove trailing whitespaces when saving:
        augroup whitespaceclean
            autocmd!
            autocmd BufWritePre * :CleanWhiteSpace
            autocmd BufWritePre * :RemoveBlankLinesAtTheEndOfFile
        augroup end
    " }}}

    " Enable omni completion.
    autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
    autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
    autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
    autocmd FileType php set omnifunc=phpcomplete#CompletePHP

    autocmd BufRead,BufNewFile *.vue setlocal filetype=vue.html.javascript.css
    autocmd BufNewFile,BufReadPost *.md set filetype=markdown

    " Remap code completion to Ctrl+Space
    inoremap <Nul> <C-x><C-o>

    " inoremap <expr> <TAB> pumvisible() ? "\<C-y>" : "\<CR>"
    " inoremap <expr> <Esc> pumvisible() ? "\<C-e>" : "\<Esc>"
    inoremap <expr> j ((pumvisible())?("\<C-n>"):("j"))
    inoremap <expr> k ((pumvisible())?("\<C-p>"):("k"))
    " inoremap <expr> <C-j> pumvisible() ? "\<C-n>" : "\<Down>"
    " inoremap <expr> <C-k> pumvisible() ? "\<C-p>" : "\<Up>"

    inoremap <expr> <C-Space> pumvisible() \|\| &omnifunc == '' ?
      \ "\<lt>C-n>" :
      \ "\<lt>C-x>\<lt>C-o><c-r>=pumvisible() ?" .
      \ "\"\\<lt>c-n>\\<lt>c-p>\\<lt>c-n>\" :" .
      \ "\" \\<lt>bs>\\<lt>C-n>\"\<CR>"

    imap <C-@> <C-Space>

    au BufNewFile,BufRead *.php
      \ set tabstop=4
      \ softtabstop=4
      \ shiftwidth=4
      \ expandtab
      \ autoindent
      \ fileformat=unix

    au BufNewFile,BufRead *.html,*.css,*.js
      \ set tabstop=2
      \ softtabstop=2
      \ shiftwidth=2

    autocmd Filetype javascript setlocal tabstop=2 expandtab shiftwidth=2 softtabstop=2

    " if has("autocmd") && exists("+omnifunc")
    "     autocmd Filetype *
    "      \ if &omnifunc == "" |
    "      \    setlocal omnifunc=syntaxcomplete#Complete |
    "      \ endif
    " endif

    " Vim-Css3-Syntax
    augroup VimCSS3Syntax
        autocmd!
        autocmd FileType css setlocal iskeyword+=-
    augroup END

    augroup javascript_folding
        au!
        au FileType javascript setlocal foldmethod=syntax
    augroup END

    " Bubble single lines, similar to Eclipse (requires unimpaired.vim)
    " Move line
    nmap <C-j> [e
    nmap <C-h> ]e

    " Bubble multiple lines, similar to Eclipse (requires unimpaired.vim)
    " Move multiples lines
    vmap <C-j> [egv
    vmap <C-h> ]egv

    " Toggling Comments
    nmap // <leader>c<space>
    vmap // <leader>cs

    " Mac OS X clipboard sharing
    nmap <F1> :set paste<CR>:r !pbpaste<CR>:set nopaste<CR>
    imap <F1> <Esc>:set paste<CR>:r !pbpaste<CR>:set nopaste<CR>
    nmap <F2> :w !pbcopy<CR><CR>
    vmap <F2> :w !pbcopy<CR><CR>

    " nnoremap <leader>sv :source $MYVIMRC<cr> " or :so %

    " ======
    " SPLITS
    " ======

      " `:ls` for list of open buffers
      " `:e <filename>` will just open into a new buffer | edit, open a new buffer
      " `:bp` previous buffer
      " `:bn` next buffer
      " `:bn` (`n` a number) move to n'th buffer
      " `:buffers` list open buffers
      " `:bnext`
      " `:bprev`

      " `Ctrl-W s` and `Ctrl-W v` to split the current window horizontally and vertically.
      " You can also use `:split` and :`vertical split` (`:sp` and `:vs`)
      "
      " `Ctrl-W w` to switch between open windows.
      "
      " `Ctrl-W c` to close the current window, and `Ctrl-W o` to close all windows except the current one.
      "
      " Starting vim with a `-o` or `-O` flag opens each file in its own split.

      " Criar uma divisão vertical [:vsp] e horizontal [:sp]
      " Pode ser especificado a nova altura de divisão prefixando com um número: [:10sp|10vsp /path/to/file]

    " Easier split navigations
    " nnoremap <C-J> <C-W><C-J>
    " nnoremap <C-K> <C-W><C-K>
    " nnoremap <C-L> <C-W><C-L>
    " nnoremap <C-H> <C-W><C-H>

    nnoremap <Space><Up> <C-W><C-K>
    nnoremap <Space><Down> <C-W><C-J>
    nnoremap <Space><Left> <C-W><C-H>
    nnoremap <Space><Right> <C-W><C-L>

    nnoremap <silent> - :exe "resize " . (winheight(0) * 2/3)<CR>
    nnoremap <silent> = :exe "resize " . (winheight(0) * 3/2)<CR>
    nnoremap <silent> 0 :exe "vertical resize " . (winwidth(0) * 2/3)<CR>
    nnoremap <silent> 9 :exe "vertical resize " . (winwidth(0) * 3/2)<CR>

" }}}

" ❒❒❒❒❒❒❒❒❒❒❒
" Manage Plugins
" ❒❒❒❒❒❒❒❒❒❒❒

" #####################
" --- NERDCommenter ---
" #####################

" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'

" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1

" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1

" Add your own custom formats or override the defaults
let g:NERDCustomDelimiters = {
    \ 'scss': { 'left': '//' },
    \ 'php': { 'left': '/**','right': '*/' }
\ }

" #############################
" vim-nerdtree-syntax-highlight
" #############################

" @see https://github.com/tiagofumo/vim-nerdtree-syntax-highlight/blob/master/after/syntax/nerdtree.vim#L210
let s:brown = "905532"
let s:aqua =  "3AFFDB"
let s:blue = "689FB6"
let s:darkBlue = "44788E"
let s:purple = "834F79"
let s:lightPurple = "834F79"
let s:red = "AE403F"
let s:beige = "F5C06F"
let s:yellow = "F09F17"
let s:orange = "D4843E"
let s:darkOrange = "F16529"
let s:pink = "CB6F6F"
let s:salmon = "EE6E73"
let s:green = "8FAA54"
let s:lightGreen = "31B53E"
let s:white = "FFFFFF"
let s:git_orange = 'F54D27'

let s:php_color = '834F79'

" Highlight full name (not only icons)
" let g:NERDTreeFileExtensionHighlightFullName = 1
" let g:NERDTreeExactMatchHighlightFullName = 1
" let g:NERDTreePatternMatchHighlightFullName = 1

let g:NERDTreeHighlightFolders = 1 " enables folder icon highlighting using exact match
let g:NERDTreeHighlightFoldersFullName = 1 " highlights the folder name

let g:NERDTreeExactMatchHighlightColor = {} " this line is needed to avoid error
let g:NERDTreeExactMatchHighlightColor['.gitignore'] = s:git_orange " sets the color for .gitignore files

let g:NERDTreePatternMatchHighlightColor = {} " this line is needed to avoid error
let g:NERDTreePatternMatchHighlightColor['.*.php$'] = s:php_color " sets the color for files ending with .php

" If you have vim-devicons you can customize your icons for each file type.
let g:NERDTreeExtensionHighlightColor = {} " this line is needed to avoid error
let g:NERDTreeExtensionHighlightColor['vue'] = s:green " sets the color of vue files to blue

let g:NERDTreeLimitedSyntax = 1
let g:NERDTreeGitStatusNodeColorization = 1
let g:NERDTreeSyntaxDisableDefaultExtensions = 1
let g:NERDTreeDisableExactMatchHighlight = 1
let g:NERDTreeDisablePatternMatchHighlight = 1
let g:NERDTreeHighlightCursorline = 0
" @see https://github.com/tiagofumo/vim-nerdtree-syntax-highlight/blob/master/after/syntax/nerdtree.vim#L228
let g:NERDTreeSyntaxEnabledExtensions = [
  \ 'js', 'css', 'html', 'json', 'ts', 'tsx', 'jsx', 'sass', 'scss',
  \ 'vue', 'react.jsx', 'gulpfile.js',
  \ 'db', 'diff', 'dump', 'ico', 'ini', 'markdown', 'md', 'sh', 'sql', 'vim',
  \ 'php', 'erl', 'go', 'py', 'rb'
\]

" ################
" --- NERDTree ---
" ################

map <C-t> :NERDTreeToggle<CR>

" let g:NERDTreeDirArrowExpandable = '▸'
" let g:NERDTreeDirArrowCollapsible = '▾'
" let g:NERDTreeShowHidden = 1

" ###########################
" --- nerdtree-git-plugin ---
" ###########################

let g:NERDTreeIndicatorMapCustom = {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ 'Ignored'   : '☒',
    \ "Unknown"   : "?"
\ }

let g:NERDTreeShowIgnoredStatus = 1

" ###################
" --- Vim Airline ---
" ###################

let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#tabline#show_tab_nr = 1
let g:airline#extensions#tabline#tab_nr_type = 2
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline_theme = 'luna'

" ### Tab navigation ###
" :ls
" :b <buffer-name>
" :bnext
" :bn
" :bprevious
" :bp
" :bfirst
" :blast

nmap <leader>p <Plug>AirlineSelectPrevTab
nmap <leader>n <Plug>AirlineSelectNextTab

nmap <Leader>1 :bp<CR>
nmap <Leader>2 :bn<CR>
nmap <Leader>3 :ls<CR>:b<Space>

" nmap <silent> <leader>n :call TabN()<CR>
" nmap <silent> <leader>p :call TabP()<CR>

" function! TabN()
"     let s:tab_count = tabpagenr('$')
"     if s:tab_count <= 1
"         :bn
"     else
"         :tabnext
"     endif
" endfunction

" function! TabP()
"     let s:tab_count = tabpagenr('$')
"     if s:tab_count <= 1
"         :bp
"     else
"         :tabprev
"     endif
" endfunction

" ###################
" --- Vim-devicon ---
" ###################

let g:webdevicons_enable = 1
let g:WebDevIconsOS = 'Darwin'
let g:webdevicons_enable_denite = 0
let g:webdevicons_enable_nerdtree = 1
let g:webdevicons_enable_airline_tabline = 1
let g:webdevicons_enable_airline_statusline = 1
let g:WebDevIconsUnicodeDecorateFolderNodes = 1
let g:DevIconsEnableFoldersOpenClose = 1
let g:WebDevIconsNerdTreeAfterGlyphPadding = ' '
let g:WebDevIconsUnicodeDecorateFileNodes = 1
let g:webdevicons_conceal_nerdtree_brackets = 1
let g:WebDevIconsUnicodeDecorateFolderNodesDefaultSymbol = ''
let g:WebDevIconsUnicodeDecorateFileNodesDefaultSymbol = ''
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols = {} " needed
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['js'] = ''
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['tsx'] = ''
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['css'] = ''
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['html'] = ''
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['json'] = ''
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['md'] = ''
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['sql'] = ''

" #####################
" --- incsearch.vim ---
" #####################

map / <Plug>(incsearch-forward)
map ? <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)

" ###############
" --- ack.vim ---
" ###############

if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

cnoreabbrev Ack Ack!
nnoremap <Leader>a :Ack!<Space>

" #####################
" --- vim-gitgutter ---
" #####################

set updatetime=100

" Ativar realce da linha (Padrão é desativado)
" :GitGutterLineHighlightsToggle

let g:gitgutter_enabled = 1
let g:gitgutter_max_signs = 1000

" ###############
" --- FZF.vim ---
" ###############

" @see https://github.com/junegunn/fzf/blob/master/README-VIM.md
" @see https://github.com/junegunn/fzf.vim#customization

map <C-z> :FZF<CR>

" [Buffers] Jump to the existing window if possible
let g:fzf_buffers_jump = 1

" [[B]Commits] Customize the options used by 'git log':
" let g:fzf_commits_log_options = '--graph --color=always --format="%C(auto)%h%d %s %C(black)%C(bold)%cr"'

let g:fzf_command_prefix = 'Fzf'

" Customizable extra key bindings for opening selected files in different ways
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }

" Determines the size and position of fzf window
" - down / up / left / right
let g:fzf_layout = {
  \ 'down': '~40%',
  \ 'window': 'enew' }

" Enables history feature.
" CTRL-N and CTRL-P will be automatically bound to next-history and
" previous-history instead of down and up. If you don't like the change,
" explicitly bind the keys to down and up in your $FZF_DEFAULT_OPTS.
let g:fzf_history_dir = '~/.local/share/fzf-history'

" Customizes fzf colors to match the current color scheme
let g:fzf_colors =
  \ { 'fg':    ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

" Hide statusline
" autocmd! FileType fzf
" autocmd  FileType fzf set laststatus=0 noshowmode noruler
"   \| autocmd BufLeave <buffer> set laststatus=2 showmode ruler

" Custom statusline
function! s:fzf_statusline()
  " Override statusline as you like
  highlight fzf1 ctermfg=161 ctermbg=251
  highlight fzf2 ctermfg=23 ctermbg=251
  highlight fzf3 ctermfg=237 ctermbg=251
  setlocal statusline=%#fzf1#\ >\ %#fzf2#fz%#fzf3#f
endfunction

autocmd! User FzfStatusLine call <SID>fzf_statusline()

" ###########
" --- JS ---
" ###########
let g:javascript_plugin_jsdoc = 1
let g:javascript_plugin_ngdoc = 1
let g:javascript_plugin_flow = 1

" ###########
" --- PHP ---
" ###########

" ===========
" StanAngeloff/php.vim
" ===========

let g:php_var_selector_is_identifier = 1

" Overriding highlighting
function! PhpSyntaxOverride()
  " Put snippet overrides in this function.
  hi! link phpDocTags phpDefine
  hi! link phpDocParam phpType
endfunction

augroup phpSyntaxOverride
  autocmd!
  autocmd FileType php call PhpSyntaxOverride()
augroup END

" Colourising namespace separator in use, extends and implements
" hi phpUseNamespaceSeparator guifg=#808080 guibg=NONE gui=NONE
" hi phpClassNamespaceSeparator guifg=#808080 guibg=NONE gui=NONE

" Colourising parentheses
" syn match phpParentOnly "[()]" contained containedin=phpParent
" hi phpParentOnly guifg=#f08080 guibg=NONE gui=NONE

" ===========
" rayburgemeestre/phpfolding.vim
" ===========

map <F5> <Esc>:EnableFastPHPFolds<Cr>
map <F6> <Esc>:EnablePHPFolds<Cr>
map <F7> <Esc>:DisablePHPFolds<Cr>

" ===========
" lvht/phpcd.vim
" ===========

" Use `Ctrl+x` `Ctrl+o` to complete and use `ctrl+]` to go to the defination.

let g:phpcd_php_cli_executable = 'php'
" let g:phpcd_autoload_path = 'vendor/autoload.php'
" @see https://github.com/lvht/phpcd.vim/wiki/Laravel-Facade-Support
let g:phpcd_autoload_path = '.autoload.php'

" Maps
" <C-]> = :<C-u>call phpcd#JumpToDefinition('normal')
" <C-W><C-]> = :<C-u>call phpcd#JumpToDefinition('split')
" <C-W><C-\> = :<C-u>call phpcd#JumpToDefinition('vsplit')

" ===========
" Local config
" ===========

if filereadable($HOME . "/.vimrc.local")
  source ~/.vimrc.local
endif

" =========
" Load All Plugins
" =========

" Plugins need to be added to runtimepath before helptags can be generated
packloadall

" Load all of the helptags now, after plugins have been loaded
" All messages and errors will be ignored
silent! helptags ALL
