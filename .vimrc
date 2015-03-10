" shis file is pooled from various resources some of which are mentioned.
" Attempt to follow Doug Black's, "Do not put anything in your .vimrc
" that you do not understand" is underway
" URL: http://vim.wikia.com/wiki/Example_vimrc
" Authors: http://vim.wikia.com/wiki/Vim_on_Freenode
" Description: A minimal, but feature rich, example .vimrc. If you are a
"              newbie, basing your first .vimrc on this file is a good choice.
"              If you're a more advanced user, building your own .vimrc based
"              on this file is still a good idea.

"------------------------------------------------------------
" Features {{{
"
" These options and commands enable some very useful features in Vim, that
" no user should have to live without.

" Set 'nocompatible' to ward off unexpected things that your distro might
" have made, as well as sanely reset options when re-sourcing .vimrc
set nocompatible

" Attempt to determine the type of a file based on its name and possibly its
" contents. Use this to allow intelligent auto-indenting for each filetype,
" and for plugins that are filetype specific.
filetype indent plugin on
" }}}

"------------------------------------------------------------
" Must have options {{{1
"
" These are highly recommended options.

" Better command-line completion
set wildmenu

" Show partial commands in the last line of the screen
set showcmd

" Set the command window height to 2 lines, to avoid many cases of having to
" "press <Enter> to continue"
set cmdheight=2

" Display line numbers on the left
set number

" Enable syntax highlighting
syntax on

" Highlight cursor line
set nocursorline

" Show matching parenthesis
set showmatch

" Highlight seach items
set hlsearch

" Start highligting as you types the search term
set incsearch

" Ignore case except when capital case is used
set ignorecase
set smartcase

" Allow backspacing over autoindent, line breaks and start of insert action
set backspace=indent,eol,start

" When opening a new line and no filetype-specific indenting is enabled, keep
" the same indent as the line you're currently on. Useful for READMEs, etc.
set autoindent

" Stop certain movements from always going to the first character of a line.
" While this behaviour deviates from that of Vi, it does what most users
" coming from other editors would expect.
set nostartofline

" Display the cursor position on the last line of the screen or in the status
" line of a window
set ruler

" Always display the status line, even if only one window is displayed
set laststatus=2

" Instead of failing a command because of unsaved changes, instead raise a
" dialogue asking if you wish to save changed files.
set confirm

" Use visual bell instead of beeping when doing something wrong
set visualbell

" And reset the terminal code for the visual bell. If visualbell is set, and
" this line is also included, vim will neither flash nor beep. If visualbell
" is unset, this does nothing.
set t_vb=

" Enable use of the mouse for all modes
set mouse=a

" Quickly time out on keycodes, but never time out on mappings
" set notimeout ttimeout ttimeoutlen=200

" Clipboard
set clipboard=unnamed


"""""""""""""""""""""""""""""""""""""""
" autocmd group 
"""""""""""""""""""""""""""""""""""""""
augroup configcmds
	autocmd!
	" Make changes effective right away
	autocmd! bufwritepost .vimrc source %

	" Strip trailing whitespaces
	autocmd FileType c,cpp,php,python autocmd BufWritePre <buffer> :%s/\s\+$//e

	" Special tab spaces for python files
	autocmd FileType * set tabstop=2|set shiftwidth=2|set noexpandtab
	autocmd FileType python set tabstop=4|set shiftwidth=4|set expandtab
augroup END
"""""""""""""""""""""""""""""""""""""""
" Keyboard shortcuts
"""""""""""""""""""""""""""""""""""""""
" Use <F10> to toggle between 'paste' and 'nopaste'
set pastetoggle=<F10>

" Easy saving of files that need root permission
cmap w!! %!sudo tee > /dev/null %

" Easy indentation
vnoremap < <gv
vnoremap > >gv

" Quick save in normal and insert mode
imap jj <esc>:w<CR>a
noremap <space>	<esc>:w<CR>

" Easy write and quit
map <F9> <esc>:wq<CR>
map <F3> <esc>:q<CR>
map! <F9> <esc>:wq<CR>
map! <F3> <esc>:q<CR>

" Easy split navigation vimbits
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Favour visual lines instead of real lines while moving up-down
nnoremap k gk
nnoremap j gj

" Bind new set of commands with leader binding
let mapleader=","
map <Leader>d <esc>:tabprevious<CR> 
map <Leader>f <esc>:tabnext<CR> 

" Clear search highlight
noremap <Leader>c		:nohlsearch<CR>

" Spell check highlight set underline
map <F2> <esc>:setlocal spell spelllang=en_us<CR>
highlight clear SpellBad
highlight SpellBad term=standout ctermfg=1 term=underline cterm=underline

"""""""""""""""""""""""""""""""""""""""
" Python related settings 
"""""""""""""""""""""""""""""""""""""""
set softtabstop=4


" Do shift-tab in python mode to insert real tab
inoremap <S-Tab> <C-V><Tab>

" Document width, last colomn color
set tw=79 "document width
set nowrap "dont wrap on load
set fo-=t "dont wrap while typing
set colorcolumn=80
highlight ColorColumn ctermbg=233


"""""""""""""""""""""""""""""""""""""""
" Plugin Management 
"""""""""""""""""""""""""""""""""""""""
" Let pathogen handle the plugins
call pathogen#infect()

"""""""""""""""""""""""""""""""""""""""
" General Purpose Plugins 
"""""""""""""""""""""""""""""""""""""""
" Undo tree visualization and selection
" git clone http://github.com/sjl/gundo.vim.git ~/.vim/bundle/gundo
nnoremap <F6> :GundoToggle<CR>

" Relative Line Number Toggling
" cd ~/.vim/bundle && git clone git://github.com/jeffkreeftmeijer/vim-numbertoggle.git

" The silver searcher
" First, install ag via home-brew or apt-get
" brew install the_silver_searcher
" cd ~/.vim/bundle && git clone https://github.com/rking/ag.vim ag && vim
" +Helptags
nnoremap <Leader>a :Ag

"""""""""""""""""""""""""""""""""""""""
" Python IDE Setup Related Plugins
"""""""""""""""""""""""""""""""""""""""
" Settings for vim-powerline: the beautiful line at the bottom
" cd ~/.vim/bundle
" git clone git://github.com/Lokaltog/vim-powerline.git
set laststatus=2

" Settings for ctrlp: search and completion
" cd ~/.vim/bundle
" git clone https://github.com/kien/ctrlp.vim.git
" max_hight, sort files in ttb order, open in new buffer, respect change in 
" working directory within vim, use Ag for matching -- speeds up. Ag fast
let g:ctrlp_max_height = 30
let g:ctrlp_match_window = 'bottom,order:ttb'
let g:ctrlp_switch_buffer = 0
let g:ctrlp_working_path_mode = 0
let g:ctrlp_user_command = 'ag %s -l --nocolor --hidden -g ""'

" Ignore searching following files. Put additinal patterns in .agignore file
set wildignore+=*.pyc
set wildignore+=*_build/*
set wildignore+=*/coverage/*
set wildignore+=.git/*

" Settings for jedi-vim
" cd ~/.vim/bundle
" git clone git://github.com/davidhalter/jedi-vim.git
let g:jedi#usages_command = "<leader>z"
let g:jedi#popup_on_dot = 0
let g:jedi#popup_select_first = 0
map <Leader>b Oimport ipdb; ipdb.set_trace() # BREAKPOINT<C-c>

" Better navigating through omnicomplete option list
" See
" http://stackoverflow.com/questions/2170023/how-to-map-keys-for-popup-menu-in-vim
set completeopt=longest,menuone
function! OmniPopup(action)
    if pumvisible()
        if a:action == 'j'
            return "\<C-N>"
        elseif a:action == 'k'
            return "\<C-P>"
        endif
    endif
    return a:action
endfunction

inoremap <silent><C-j> <C-R>=OmniPopup('j')<CR>
inoremap <silent><C-k> <C-R>=OmniPopup('k')<CR>

" Completion menu color
highlight Pmenu ctermbg=238 gui=bold

" Python folding
" mkdir -p ~/.vim/ftplugin
" wget -O ~/.vim/ftplugin/python_editing.vim
" http://www.vim.org/scripts/download_script.php?src_id=5492
set nofoldenable

" Set modeline setting for this vimrc file. To fold comment nofoldable
" set modelines=1
" vim:foldmethod=marker:foldlevel=0
