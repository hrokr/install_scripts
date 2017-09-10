" This must be the first instruction. Use Vim instead of just Vi.
set nocompatible

" This allows for a recursive search into subfolders and provides completion
" for file-related tasks (https://www.youtube.com/watch?v=XA2WjJbmmoM&t=226s)
set path+=**

"Display all matching files that match  completion
set wildmenu

"From here to line 49 are for Vundle (https://github.com/VundleVim/Vundle.Vim)
filetype off                  " required
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Vundle has several different ways to bring in plugins. Read the docs.
" Plugins

Plugin 'VundleVim/Vundle.vim'
Plugin 'git://git.wincent.com/command-t.git'
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
Plugin 'edkolev/tmuxline.vim'
Plugin 'janko-m/vim-test'
Plugin 'kien/ctrlp.vim'
Plugin 'moll/vim-node'
Plugin 'powerline/powerline-fonts'
Plugin 'scrooloose/nerdtree'
Plugin 'simnalamburt/vim-mundo'
Plugin 'tpope/vim-abolish'
Plugin 'tpope/vim-fugitive'
Plugin 'vim-syntastic/syntastic'
Plugin 'vimwiki/vimwiki'
Plugin 'vim-airline/vim-airline-themes' "lightweight status/ bar
Plugin 'RltvNmbr.vim'                   "show relative and absolute line #s
Plugin 'SirVer/ultisnips'               "recommended for python dev
Plugin 'honza/vim-snippets'
Plugin 'davidhalter/jedi-vim'           "autocompletion
Plugin 'ElmCast/elm-vim'                "elm syntax and linting
Plugin 'Valloric/YouCompleteMe'         "code completion engine
" All of your Plugins must be added before the following line

call vundle#end()            " required
filetype plugin indent on    " required

" A few key Vundle commands
"filetype plugin on - Use this to ingnore plugin indent changes
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache:w
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
" see :h vundle for more details or wiki for FAQ

" Put non-Plugin stuff after this line

" Plugin settings

" recommended initial settings for syntastic

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

" Written on 2014-07-16 by Miko Bartnicki <mikobartnicki@gmail.com>.

" Font, size, background and appearance settings
set columns=84 lines=48 " GUI window geometry
set number              " show line numbers
set encoding=utf-8      " encoding used for displaying file
set ruler               " show the cursor position all the time
set showmatch           " highlight matching braces
set showmode            " show insert/replace/visual mode
set autoindent
set ts=4
set shortmess+=I        " kill the intro screen

"font settings
if has('gui_running')
        set guifont=Droid\ Sans\ Mono\ for\ Powerline\ Nerd\ Font\ Complete:h18
endif

set number              "-- check this agaist RltvNmbr.vim documentation

" write settings
set confirm             " confirm :q in case of unsaved changes
set fileencoding=utf-8  " encoding used when saving file
set nobackup            " do not keep the backup~ file

" edit settings
set backspace=indent,eol,start " backspacing over everything in insert mode
set nojoinspaces        " no extra space after '.' when joining lines
set textwidth=80        " wrap lines automatically at 80th column

" search settings
set hlsearch            " highlight search results
set ignorecase          " do case insensitive search...
set incsearch           " do incremental search
set smartcase           " ...unless capital letters are used

" file type specific settings
filetype on             " enable file type detection
filetype plugin on      " load the plugins for specific file types
filetype indent on      " automatically indent code

syntax enable           " required for solarized theme to load syntax
                        " highlighting http://ethanschoonover.com/solarized/vim-colors-solarized

set background=dark
colorscheme solarized   " set color scheme, must be installed first

" characters for displaying non-printable characters

set list listchars=trail:.,nbsp:_,extends:+,precedes:+

" automatic commands
if has('autocmd')
        " file type specific automatic commands

        " don't replace s with spaces when editing makefiles
        autocmd Filetype makefile setlocal noexpand

        " disable automatic code indentation when editing TeX and XML files
        autocmd FileType tex,xml setlocal indentexpr=

        " clean-up commands that run automatically on write; use with caution

        " delete empty or whitespaces-only lines at the end of file
        autocmd BufWritePre * :%s/\(\s*\n\)\+\%$//ge

        " replace groups of empty or whitespaces-only lines with one empty line
        autocmd BufWritePre * :%s/\(\s*\n\)\{3,}/\r\r/ge

        " delete any trailing whitespaces
        autocmd BufWritePre * :%s/\s\+$//ge
endif

" general key mappings
" center view on the search result
noremap n nzz
noremap N Nzz

" press F4 to fix indentation in whole file; overwrites marker 'q' position
noremap <F4> mqggVG=`qzz
inoremap <F4> <Esc>mqggVG=`qzza

" press F5 to sort selection or paragraph
vnoremap <F5> :sort i<CR>
nnoremap <F5> Vip:sort i<CR>

" press F8 to turn the search results highlight off
noremap <F8> :nohl<CR>
inoremap <F8> <Esc>:nohl<CR>a

" press F12 to toggle showing the non-prinle characters
noremap <F12> :set list!<CR>
inoremap <F12> <Esc>:set list!<CR>a

filetype plugin indent on
" show existing tab with 4 spaces width
set tabstop=4
" when indenting with '>', use 4 spaces width
set shiftwidth=4
" On pressing tab, insert 4 spaces
set expandtab

"------- resources -------
"https://gist.github.com/MohamedAlaa/2961058
"https://www.fprintf.net/vimCheatSheet.html
"http://vimsheet.com
"
