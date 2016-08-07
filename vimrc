
" If vundle is not installed, do it first
if (!isdirectory(expand("$HOME/.vim/repos/github.com/Shougo/dein.vim")))
  call system(expand("mkdir -p $HOME/.vim/repos/github.com"))
  call system(expand("git clone https://github.com/Shougo/dein.vim $HOME/.vim/repos/github.com/Shougo/dein.vim"))
endif

" don't bother with vi compatibility
set nocompatible


" required
set runtimepath+=~/.vim/repos/github.com/Shougo/dein.vim/

" required
call dein#begin(expand('~/.vim'))
let pluginsExist = 0

call dein#add('Shougo/dein.vim')
call dein#add('VundleVim/Vundle.vim')
call dein#add('airblade/vim-gitgutter')
call dein#add('altercation/vim-colors-solarized')
call dein#add('austintaylor/vim-indentobject')
call dein#add('christoomey/vim-tmux-navigator')
call dein#add('juvenn/mustache.vim')
call dein#add('kchmck/vim-coffee-script')
call dein#add('ctrlpvim/ctrlp.vim')
call dein#add('leafgarland/typescript-vim')
call dein#add('majutsushi/tagbar')
call dein#add('rking/ag.vim')
call dein#add('garbas/vim-snipmate')
call dein#add('MarcWeber/vim-addon-mw-utils')
call dein#add('tomtom/tlib_vim')
call dein#add('nathanaelkane/vim-indent-guides')
call dein#add('nono/vim-handlebars')
call dein#add('pangloss/vim-javascript')
call dein#add('scrooloose/nerdtree')
call dein#add('scrooloose/syntastic')
call dein#add('slim-template/vim-slim')
call dein#add('tpope/vim-bundler')
call dein#add('tpope/vim-commentary')
call dein#add('tpope/vim-cucumber')
call dein#add('tpope/vim-dispatch')
call dein#add('tpope/vim-endwise')
call dein#add('tpope/vim-fugitive')
call dein#add('tpope/vim-pastie')
call dein#add('tpope/vim-ragtag')
call dein#add('tpope/vim-rails')
call dein#add('tpope/vim-repeat')
call dein#add('tpope/vim-surround')
call dein#add('tpope/vim-unimpaired')
call dein#add('tpope/vim-vividchalk')
call dein#add('eventualbuddha/vim-protobuf')
call dein#add('vim-ruby/vim-ruby')
call dein#add('vim-scripts/Align')
call dein#add('vim-scripts/greplace.vim')
call dein#add('vim-scripts/matchit.zip')
call dein#add('terryma/vim-multiple-cursors')
call dein#add('Slava/vim-spacebars')
call dein#add('digitaltoad/vim-jade')
call dein#add('othree/yajs.vim')
call dein#add('mxw/vim-jsx')
call dein#add('wakatime/vim-wakatime')
call dein#add('Quramy/tsuquyomi')
call dein#add('Shougo/vimproc.vim')
call dein#add('mhartington/oceanic-next')
call dein#add('vim-airline/vim-airline')
call dein#add('Xuyuanp/nerdtree-git-plugin')
call dein#add('mattn/webapi-vim')
call dein#add('mattn/gist-vim')
call dein#add('tmux-plugins/vim-tmux')
call dein#add('tmux-plugins/vim-tmux-focus-events')
call dein#add('rhysd/github-complete.vim')
call dein#add('junegunn/goyo.vim')

if dein#check_install()
  call dein#install()
endif
call dein#end()

" enable syntax highlighting
syntax enable

" configure Vundle
filetype on " without this vim emits a zero exit status, later, because of :ft off
filetype off

" ensure ftdetect et al work by including this after the Vundle stuff
filetype plugin indent on

set autoindent
set autoread                                                 " reload files when changed on disk, i.e. via `git checkout`
set backspace=2                                              " Fix broken backspace in some setups
set backupcopy=yes                                           " see :help crontab
set clipboard=unnamed                                        " yank and paste with the system clipboard
set directory-=.                                             " don't store swapfiles in the current directory
set encoding=utf-8
set expandtab                                                " expand tabs to spaces
set ignorecase                                               " case-insensitive search
set incsearch                                                " search as you type
set laststatus=2                                             " always show statusline
set list                                                     " show trailing whitespace
set listchars=tab:▸\ ,trail:▫
set number                                                   " show line numbers
set ruler                                                    " show where you are
set scrolloff=3                                              " show context above/below cursorline
set shiftwidth=2                                             " normal mode indentation commands use 2 spaces
set showcmd
set smartcase                                                " case-sensitive search if any caps
set softtabstop=2                                            " insert mode tab and backspace use 2 spaces
set tabstop=2
set wildignore=log/**,node_modules/**,target/**,tmp/**,*.rbc
set wildmenu                                                 " show a navigable menu for tab completion
set wildmode=longest,list,full

" Enable basic mouse behavior such as resizing buffers.
set mouse=a
if exists('$TMUX')  " Support resizing in tmux
  set ttymouse=xterm2
endif

" keyboard shortcuts
let mapleader = ','
noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l
noremap <leader>l :Align
nnoremap <leader>a :Ag<space>
nnoremap <leader>b :CtrlPBuffer<CR>
nnoremap <leader>d :NERDTreeToggle<CR>
nnoremap <leader>f :NERDTreeFind<CR>
nnoremap <leader>t :CtrlP<CR>
nnoremap <leader>T :CtrlPClearCache<CR>:CtrlP<CR>
nnoremap <leader>] :TagbarToggle<CR>
nnoremap <leader><space> :call whitespace#strip_trailing()<CR>
nnoremap <leader>g :GitGutterToggle<CR>
noremap <silent> <leader>V :source ~/.vimrc<CR>:filetype detect<CR>:exe ":echo 'vimrc reloaded'"<CR>

" in case you forgot to sudo
cnoremap w!! %!sudo tee > /dev/null %

" plugin settings
let g:ctrlp_match_window = 'order:ttb,max:20'
" let g:NERDSpaceDelims=1
let g:gitgutter_enabled = 0

" Use The Silver Searcher https://github.com/ggreer/the_silver_searcher
if executable('ag')
  " Use Ag over Grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
endif

" fdoc is yaml
autocmd BufRead,BufNewFile *.fdoc set filetype=yaml
" md is markdown
autocmd BufRead,BufNewFile *.md set filetype=markdown
autocmd BufRead,BufNewFile *.md set spell
" extra rails.vim help
autocmd User Rails silent! Rnavcommand decorator      app/decorators            -glob=**/* -suffix=_decorator.rb
autocmd User Rails silent! Rnavcommand observer       app/observers             -glob=**/* -suffix=_observer.rb
autocmd User Rails silent! Rnavcommand feature        features                  -glob=**/* -suffix=.feature
autocmd User Rails silent! Rnavcommand job            app/jobs                  -glob=**/* -suffix=_job.rb
autocmd User Rails silent! Rnavcommand mediator       app/mediators             -glob=**/* -suffix=_mediator.rb
autocmd User Rails silent! Rnavcommand stepdefinition features/step_definitions -glob=**/* -suffix=_steps.rb
" automatically rebalance windows on vim resize
autocmd VimResized * :wincmd =

" Fix Cursor in TMUX
if exists('$TMUX')
  let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
  let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
else
  let &t_SI = "\<Esc>]50;CursorShape=1\x7"
  let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif

" Don't copy the contents of an overwritten selection.
vnoremap p "_dP

set nocursorline " don't highlight current line

" keyboard shortcuts
inoremap jj <ESC>

" highlight search
"set hlsearch
"nmap <leader>hl :let @/ = ""<CR>

" gui settings
if (&t_Co == 256 || has('gui_running'))
  if ($TERM_PROGRAM == 'iTerm.app')
    colorscheme OceanicNext
  else
    colorscheme desert
  endif
endif

" Disambiguate ,a & ,t from the Align plugin, making them fast again.
"
" This section is here to prevent AlignMaps from adding a bunch of mappings
" that interfere with the very-common ,a and ,t mappings. This will get run
" at every startup to remove the AlignMaps for the *next* vim startup.
"
" If you do want the AlignMaps mappings, remove this section, remove
" ~/.vim/bundle/Align, and re-run rake in maximum-awesome.
function! s:RemoveConflictingAlignMaps()
  if exists("g:loaded_AlignMapsPlugin")
    AlignMapsClean
  endif
endfunction
command! -nargs=0 RemoveConflictingAlignMaps call s:RemoveConflictingAlignMaps()
silent! autocmd VimEnter * RemoveConflictingAlignMaps

" use ack instead of grep
set grepprg=ack

" Let airline tell me my status
set noshowmode
set noswapfile
filetype on
" set relativenumber number
set conceallevel=0

" vim-airline
let g:airline#extensions#tabline#enabled = 1
set hidden
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#tabline#show_tab_nr = 1
let g:airline_powerline_fonts = 1
let g:airline_theme='oceanicnext'
" let g:airline_theme='base16_solarized'
cnoreabbrev <expr> x getcmdtype() == ":" && getcmdline() == 'x' ? 'Sayonara' : 'x'
" nmap <leader>t :term<cr>
nmap <leader>, :bnext<CR>
nmap <leader>. :bprevious<CR>
let g:airline#extensions#tabline#buffer_idx_mode = 1
nmap <leader>1 <Plug>AirlineSelectTab1
nmap <leader>2 <Plug>AirlineSelectTab2
nmap <leader>3 <Plug>AirlineSelectTab3
nmap <leader>4 <Plug>AirlineSelectTab4
nmap <leader>5 <Plug>AirlineSelectTab5
nmap <leader>6 <Plug>AirlineSelectTab6
nmap <leader>7 <Plug>AirlineSelectTab7
nmap <leader>8 <Plug>AirlineSelectTab8
nmap <leader>9 <Plug>AirlineSelectTab9
set guifont=Sauce\ Code\ Pro\ Nerd\ Font\ Complete:h13

" NERDTree
let g:NERDTreeWinSize=45
let g:NERDTreeAutoDeleteBuffer=1

function! NERDTreeHighlightFile(extension, fg, bg, guifg, guibg)
exec 'autocmd FileType nerdtree highlight ' . a:extension .' ctermbg='. a:bg .' ctermfg='. a:fg .' guibg='. a:guibg .' guifg='. a:guifg
exec 'autocmd FileType nerdtree syn match ' . a:extension .' #^\s\+.*'. a:extension .'$#'
endfunction

call NERDTreeHighlightFile('jade', 'green', 'none', 'green', '#141e23')
call NERDTreeHighlightFile('ini', 'yellow', 'none', 'yellow', '#141e23')
call NERDTreeHighlightFile('md', 'blue', 'none', '#3366FF', '#141e23')
call NERDTreeHighlightFile('yml', 'yellow', 'none', 'yellow', '#141e23')
call NERDTreeHighlightFile('config', 'yellow', 'none', 'yellow', '#141e23')
call NERDTreeHighlightFile('conf', 'yellow', 'none', 'yellow', '#141e23')
call NERDTreeHighlightFile('json', 'yellow', 'none', 'yellow', '#141e23')
call NERDTreeHighlightFile('html', 'yellow', 'none', 'yellow', '#141e23')
call NERDTreeHighlightFile('styl', 'cyan', 'none', 'cyan', '#141e23')
call NERDTreeHighlightFile('css', 'cyan', 'none', 'cyan', '#141e23')
call NERDTreeHighlightFile('coffee', 'Red', 'none', 'red', '#141e23')
call NERDTreeHighlightFile('js', 'Red', 'none', '#ffa500', '#141e23')
call NERDTreeHighlightFile('ts', 'Blue', 'none', '#6699cc', '#141e23')
call NERDTreeHighlightFile('php', 'Magenta', 'none', '#ff00ff', '#141e23')
call NERDTreeHighlightFile('ds_store', 'Gray', 'none', '#686868', '#141e23')
call NERDTreeHighlightFile('gitconfig', 'Gray', 'none', '#686868', '#141e23')
call NERDTreeHighlightFile('gitignore', 'Gray', 'none', '#686868', '#141e23')
call NERDTreeHighlightFile('bashrc', 'Gray', 'none', '#686868', '#141e23')
call NERDTreeHighlightFile('bashprofile', 'Gray', 'none', '#686868', '#141e23')

" jsx
let g:jsx_ext_required = 0

" System mappings
" No need for ex mode
nnoremap Q <nop>
" recording macros is not my thing
map q <Nop>

