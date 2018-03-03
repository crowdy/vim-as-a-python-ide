" .vimrc file modified by Dan Sheffner

" Lots of credit to:
" Sample .vimrc file by Martin Brochhaus
" Presented at PyCon APAC 2012
"
runtime ~/.vim/bundle/pathogen/autoload/pathogen.vim

" Automatic reloading of .vimrc
autocmd! bufwritepost .vimrc source %

" gets rid of extra space
autocmd BufWritePre * %s/\s\+$//e

" map ctrl n to line numbers
:nmap <C-N><C-N> :set invnumber<CR>

" Mouse and backspace
" set mouse=a " on OSX press ALT and click
set bs=2 " make backspace behave like normal again

" Rebind <Leader> key
" I like to have it here becuase it is easier to reach than the default and
" it is next to ``m`` and ``n`` which I use for navigating between tabs.
let mapleader = ","

" Bind nohl
" Removes highlight of your last search
" ``<C>`` stands for ``CTRL`` and therefore ``<C-n>`` stands for ``CTRL+n``
noremap <C-n> :nohl<CR>
vnoremap <C-n> :nohl<CR>
inoremap <C-n> :nohl<CR>

" Quicksave command
noremap <C-Z> :update<CR>
vnoremap <C-Z> <C-C>:update<CR>
inoremap <C-Z> <C-O>:update<CR>

" Quick quit command
noremap <Leader>e :quit<CR> " Quit current window
noremap <Leader>E :qa!<CR> " Quit all windows

" bind Ctrl+<movement> keys to move around the windows, instead of using Ctrl+w + <movement>
" Every unnecessary keystroke that can be saved is good for your health :)
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
map <c-h> <c-w>h

" easier moving between tabs
map <Leader>n <esc>:tabprevious<CR>
map <Leader>m <esc>:tabnext<CR>

" map sort function to a key
vnoremap <Leader>s :sort<CR>

" easier moving of code blocks
" Try to go into visual mode (v), thenselect several lines of code here and
" then press ``>`` several times.
vnoremap < <gv " better indentation
vnoremap > >gv " better indentation

" Show whitespace
" MUST be inserted BEFORE the colorscheme command
autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red
au InsertLeave * match ExtraWhitespace /\s\+$/

" Color scheme
" mkdir -p ~/.vim/colors && cd ~/.vim/colors
" wget -O wombat256mod.vim http://www.vim.org/scripts/download_script.php?src_id=13400
set t_Co=256
color wombat256mod

" Enable syntax highlighting
" You need to reload this file for the change to apply
"

" Pathogen load
filetype off

call pathogen#infect()
call pathogen#helptags()

filetype plugin indent on
syntax on

set nocompatible
set nocp

" Showing line numbers and length
set number " show line numbers
set tw=79 " width of document (used by gd)
set nowrap " don't automatically wrap on load
set fo-=t " don't automatically wrap text when typing
set colorcolumn=80
highlight ColorColumn ctermbg=233


" easier formatting of paragraphs
vmap Q gq
nmap Q gqap

" Useful settings
set history=700
set undolevels=700

" Real programmers don't use TABs but spaces
set tabstop=4
set softtabstop=4
set shiftwidth=4
set shiftround
set expandtab

" Make search case insensitive
set hlsearch
set incsearch
set ignorecase
set smartcase

" Disable stupid backup and swap files - they trigger too many events
" for file system watchers
set nobackup
set nowritebackup
set noswapfile

" Setup Pathogen to manage your plugins
" mkdir -p ~/.vim/autoload ~/.vim/bundle
" curl -so ~/.vim/autoload/pathogen.vim https://raw.github.com/tpope/vim-pathogen/HEAD/autoload/pathogen.vim
" Now you can install any plugin into a .vim/bundle/plugin-name/ folder

" ============================================================================
" Python IDE Setup
" ============================================================================

" Settings for vim-powerline
" cd ~/.vim/bundle
" git clone git://github.com/Lokaltog/vim-powerline.git
set laststatus=2

" Settings for ctrlp
" cd ~/.vim/bundle
" git clone https://github.com/kien/ctrlp.vim.git
let g:ctrlp_max_height = 30
set wildignore+=*.pyc
set wildignore+=*_build/*
set wildignore+=*/coverage/*

" Settings for ython-mode
" cd ~/.vim/bundle
" git clone --recursive https://github.com/davidhalter/jedi-vim.git ~/.vim/bundle/jedi-vim
"
"Jedi is by default automatically initialized. If you don't want that I suggest you disable the auto-initialization in your .vimrc:
"
"let g:jedi#auto_initialization = 0
"There are also some VIM options (like completeopt and key defaults) which are automatically initialized, but you can skip this:
"
"let g:jedi#auto_vim_configuration = 0
"You can make jedi-vim use tabs when going to a definition etc:
"
"let g:jedi#use_tabs_not_buffers = 1
"If you are a person who likes to use VIM-splits, you might want to put this in your .vimrc:
"
"let g:jedi#use_splits_not_buffers = "left"
"This options could be "left", "right", "top", "bottom" or "winwidth". It will decide the direction where the split open.
"
"Jedi automatically starts the completion, if you type a dot, e.g. str., if you don't want this:
"
"let g:jedi#popup_on_dot = 0
"Jedi selects the first line of the completion menu: for a better typing-flow and usually saves one keypress.
"
"let g:jedi#popup_select_first = 0
"Jedi displays function call signatures in insert mode in real-time, highlighting the current argument. The call signatures can be displayed as a pop-up in the buffer (set to 1, the default), which has the advantage of being easier to refer to, or in Vim's command line aligned with the function call (set to 2), which can improve the integrity of Vim's undo history.

"let g:jedi#show_call_signatures = "1"
"Here are a few more defaults for actions, read the docs (:help jedi-vim) to get more information. If you set them to "", they are not assigned.
"
"NOTE: subject to change!
"
"let g:jedi#goto_command = "<leader>d"
"let g:jedi#goto_assignments_command = "<leader>g"
"let g:jedi#goto_definitions_command = ""
"let g:jedi#documentation_command = "K"
"let g:jedi#usages_command = "<leader>n"
"let g:jedi#completions_command = "<C-Space>"
"let g:jedi#rename_command = "<leader>r"
"Finally, if you don't want completion, but all the other features, use:
"
"let g:jedi#completions_enabled = 0

map <Leader>b Oimport ipdb; ipdb.set_trace() # BREAKPOINT<C-c>

" Better navigating through omnicomplete option list
" See http://stackoverflow.com/questions/2170023/how-to-map-keys-for-popup-menu-in-vim
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

" Python folding
" mkdir -p ~/.vim/ftplugin
" wget -O ~/.vim/ftplugin/python_editing.vim http://www.vim.org/scripts/download_script.php?src_id=5492
set nofoldenable

" Neocomplete
" let g:neocomplete#enable_at_startup = 1
"
set wildmenu
set wildmode=list:longest,full

set clipboard=unnamedplus

" load up the nerd tree
autocmd vimenter * NERDTree
map <Leader>t <plug>NERDTreeTabsToggle<CR>

" move nerdtree to the right
let g:NERDTreeWinPos = "right"
" " move to the first buffer
autocmd VimEnter * wincmd p

" paste toggle
set pastetoggle=<F2>

" turn off auto complete
" let g:jedi#completions_enabled = 0

