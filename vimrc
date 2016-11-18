" If dein is not installed, do it first
if (!isdirectory(expand("$HOME/.vim/repos/github.com/Shougo/dein.vim")))
  call system(expand("mkdir -p $HOME/.vim/repos/github.com"))
  call system(expand("git clone https://github.com/Shougo/dein.vim $HOME/.vim/repos/github.com/Shougo/dein.vim"))
endif

" don't bother with vi compatibility
set nocompatible

" true colors
set termguicolors
" change to blinking cursor in insert mode
let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1

" plugins
source $HOME/.dotfiles/vim-plugins.vim

" settings
source $HOME/.dotfiles/vim-settings.vim

" keyboard shortcuts
source $HOME/.dotfiles/vim-shortcuts.vim

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
" inoremap jj <ESC>

" highlight search
"set hlsearch
"nmap <leader>hl :let @/ = ""<CR>

" theme
" enable syntax highlighting
syntax on
colorscheme oceanicnext
" not needed anymore since oceanic next update
set background=dark

" enable italics, disabled by default
let g:oceanic_next_terminal_italic = 1

" enable bold, disabled by default
let g:oceanic_next_terminal_bold = 1

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

call NERDTreeHighlightFile('jade', 'green', 'none', 'green', '#1b2b34')
call NERDTreeHighlightFile('ini', 'yellow', 'none', 'yellow', '#1b2b34')
call NERDTreeHighlightFile('md', 'blue', 'none', '#3366FF', '#1b2b34')
call NERDTreeHighlightFile('yml', 'yellow', 'none', 'yellow', '#1b2b34')
call NERDTreeHighlightFile('config', 'yellow', 'none', 'yellow', '#1b2b34')
call NERDTreeHighlightFile('conf', 'yellow', 'none', 'yellow', '#1b2b34')
call NERDTreeHighlightFile('json', 'yellow', 'none', 'yellow', '#1b2b34')
call NERDTreeHighlightFile('html', 'yellow', 'none', 'yellow', '#1b2b34')
call NERDTreeHighlightFile('styl', 'cyan', 'none', 'cyan', '#1b2b34')
call NERDTreeHighlightFile('css', 'cyan', 'none', 'cyan', '#1b2b34')
call NERDTreeHighlightFile('coffee', 'Red', 'none', 'red', '#1b2b34')
call NERDTreeHighlightFile('js', 'Red', 'none', '#ffa500', '#1b2b34')
call NERDTreeHighlightFile('ts', 'Blue', 'none', '#6699cc', '#1b2b34')
call NERDTreeHighlightFile('php', 'Magenta', 'none', '#ff00ff', '#1b2b34')
call NERDTreeHighlightFile('ds_store', 'Gray', 'none', '#686868', '#1b2b34')
call NERDTreeHighlightFile('gitconfig', 'Gray', 'none', '#686868', '#1b2b34')
call NERDTreeHighlightFile('gitignore', 'Gray', 'none', '#686868', '#1b2b34')
call NERDTreeHighlightFile('bashrc', 'Gray', 'none', '#686868', '#1b2b34')
call NERDTreeHighlightFile('bashprofile', 'Gray', 'none', '#686868', '#1b2b34')

" jsx
let g:jsx_ext_required = 0

" System mappings
" No need for ex mode
nnoremap Q <nop>
" recording macros is not my thing
map q <Nop>

" deoplete
let g:deoplete#enable_at_startup = 1
" experimental javascript support for typescript deoplate
let g:deoplete#sources#tss#javascript_support = 1
" keep preview window closed
set completeopt-=preview

function! StrTrim(txt)
  return substitute(a:txt, '^\n*\s*\(.\{-}\)\n*\s*$', '\1', '')
endfunction

" linting
let g:neomake_warning_sign = {'text': '?', 'texthl': 'NeomakeWarningSign'}
function! neomake#makers#ft#typescript#tsc()
  return {
      \ 'args': [
          \ '--project', "."
      \ ],
      \ 'append_file': 0,
      \ 'errorformat':
          \ '%f %#(%l\,%c): error %m,'
      \ }
endfunction

let g:neomake_typescript_tslint = {
  \ 'args': ['%:p', '--format verbose'],
  \ 'errorformat': 'f:%l:%c: %m'
  \ }

let g:neomake_open_list = 2

let g:neomake_markdown_alex_maker = {
  \ 'exe': 'alex',
  \ 'errorformat': '%f: line %l\, col %c\, %m',
  \ }
let g:neomake_markdown_enabled_makers = ['alex']

let g:neomake_javascript_eslint_exe = StrTrim(system('PATH=$(npm bin):$PATH && which eslint'))

function! neomake#makers#ft#javascript#eslint()
  return {
    \ 'args': ['-f', 'compact'],
    \ 'errorformat': '%E%f: line %l\, col %c\, Error - %m,' .
    \ '%W%f: line %l\, col %c\, Warning - %m'
    \ }
endfunction

" use flow from node_modules folder
let g:flow_path = StrTrim(system('PATH=$(npm bin):$PATH && which flow'))
let g:deoplete#sources#flow#flow_bin = g:flow_path

let g:neomake_javascript_flow_maker = {
    \ 'exe': 'sh',
    \ 'args': ['-c', g:flow_path.' --json 2> /dev/null | flow-vim-quickfix'],
    \ 'errorformat': '%E%f:%l:%c\,%n: %m',
    \ 'cwd': '%:p:h'
    \ }

let g:neomake_javascript_enabled_makers = ['eslint', 'flow']
let g:neomake_jsx_enabled_makers = ['eslint', 'flow']

autocmd! BufWritePost * Neomake

function! JscsFix()
  let l:winview = winsaveview()
  % ! jscs -x
  call winrestview(l:winview)
endfunction
command JscsFix :call JscsFix()
noremap <leader>j :JscsFix<CR>

" thanks to http://vimcasts.org/e/4
function! WhitespaceStripTrailing()
  let previous_search=@/
  let previous_cursor_line=line('.')
  let previous_cursor_column=col('.')
  %s/\s\+$//e
  let @/=previous_search
  call cursor(previous_cursor_line, previous_cursor_column)
endfunction

" strip trailing whitespace on Ruby buffer saves
augroup whitespace
  autocmd BufWritePre *.rb call WhitespaceStripTrailing()
augroup END
