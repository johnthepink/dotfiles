set runtimepath+=~/.vim/repos/github.com/Shougo/dein.vim/

call dein#begin(expand('~/.vim'))
let pluginsExist = 0

call dein#add('Shougo/dein.vim')
call dein#add('airblade/vim-gitgutter')
call dein#add('austintaylor/vim-indentobject')
call dein#add('christoomey/vim-tmux-navigator')
call dein#add('ctrlpvim/ctrlp.vim')
call dein#add('majutsushi/tagbar')
call dein#add('rking/ag.vim')
call dein#add('scrooloose/nerdtree')
call dein#add('slim-template/vim-slim')
call dein#add('tpope/vim-bundler')
call dein#add('tpope/vim-commentary')
call dein#add('tpope/vim-cucumber')
call dein#add('tpope/vim-endwise')
call dein#add('tpope/vim-rhubarb')
call dein#add('tpope/vim-fugitive')
call dein#add('shumphrey/fugitive-gitlab.vim')
call dein#add('tpope/vim-rails')
call dein#add('tpope/vim-repeat')
call dein#add('tpope/vim-surround')
call dein#add('tpope/vim-unimpaired')
call dein#add('vim-ruby/vim-ruby')
call dein#add('vim-scripts/Align')
call dein#add('vim-scripts/greplace.vim')
call dein#add('vim-scripts/matchit.zip')
call dein#add('terryma/vim-multiple-cursors')

call dein#add('othree/yajs.vim', {'on_ft': 'javascript'})
call dein#add('othree/es.next.syntax.vim', {'on_ft': 'javascript'})
call dein#add('othree/jsdoc-syntax.vim', {'on_ft':['javascript', 'typescript']})
call dein#add('heavenshell/vim-jsdoc', {'on_ft':['javascript', 'typescript']})
call dein#add('moll/vim-node', {'on_ft':['javascript', 'typescript']})
call dein#add('elzr/vim-json', {'on_ft': 'json'})
call dein#add('pangloss/vim-javascript')
call dein#add('mxw/vim-jsx')
call dein#add('fleischie/vim-styled-components')

call dein#add('hail2u/vim-css3-syntax', {'on_ft':['css','scss']})
call dein#add('ap/vim-css-color', {'on_ft': ['css', 'scss', 'yaml']})

call dein#add('othree/html5.vim')

call dein#add('wakatime/vim-wakatime')
call dein#add('Quramy/tsuquyomi')
call dein#add('Shougo/vimproc.vim', {'build' : 'make'})
call dein#add('trevordmiller/nova-vim')
call dein#add('vim-airline/vim-airline')
call dein#add('Xuyuanp/nerdtree-git-plugin')
call dein#add('mattn/webapi-vim')
call dein#add('mattn/gist-vim')
call dein#add('tmux-plugins/vim-tmux')
call dein#add('tmux-plugins/vim-tmux-focus-events')
call dein#add('rhysd/github-complete.vim')
call dein#add('junegunn/goyo.vim')

" call dein#add('neomake/neomake')
" call dein#add('w0rp/ale')
call dein#add('dense-analysis/ale')

call dein#add('Shougo/deoplete.nvim')
call dein#add('HerringtonDarkholme/yats.vim')
" call dein#add('mhartington/deoplete-typescript')
call dein#add('mhartington/nvim-typescript', {'build': './install.sh'})
" call dein#add('steelsojka/deoplete-flow')
" call dein#add('fishbullet/deoplete-ruby')

call dein#add('fgsch/vim-varnish')

call dein#add('janko-m/vim-test')

call dein#add('hashivim/vim-terraform')

call dein#add('cespare/vim-toml')

call dein#add('reasonml-editor/vim-reason-plus')
call dein#add('/usr/local/opt/fzf')
call dein#add('junegunn/fzf.vim')
call dein#add('autozimu/LanguageClient-neovim', {
    \ 'rev': 'next',
    \ 'build': 'bash install.sh',
    \ })
call dein#add('jparise/vim-graphql')
call dein#add('pantharshit00/vim-prisma')

call dein#add('milch/vim-fastlane')

call dein#add('mustache/vim-mustache-handlebars')

" call dein#add('flowtype/vim-flow', {
"     \ 'autoload': {
"     \   'filetypes': 'javascript'
"     \ },
"     \ 'build': {
"     \   'mac': 'npm install -g flow-bin',
"     \   'unix': 'npm install -g flow-bin'
"     \ }})

if dein#check_install()
  call dein#install()
endif
call dein#end()
