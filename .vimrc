" This must be the first instruction. Use Vim instead of just Vi.
set nocompatible

" This allows for a recursive search into subfolders and provides completion
" for file-related tasks (https://www.youtube.com/watch?v=XA2WjJbmmoM&t=226s)
set path+=**

"Display all matching files that match  completion
set wildmenu


let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif


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

" show existing tab with 4 spaces width
set tabstop=4
" when indenting with '>', use 4 spaces width
set shiftwidth=4
" On pressing tab, insert 4 spaces
set expandtab

