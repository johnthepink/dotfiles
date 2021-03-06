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

call dein#add('wakatime/vim-wakatime')
call dein#add('Quramy/tsuquyomi')
call dein#add('Shougo/vimproc.vim', {'build' : 'make'})
call dein#add('mhartington/oceanic-next', { 'rev': 'b938fbcfdf6d66ffc9b9eb945de8b3629c634f65' })
call dein#add('vim-airline/vim-airline')
call dein#add('Xuyuanp/nerdtree-git-plugin')
call dein#add('mattn/webapi-vim')
call dein#add('mattn/gist-vim')
call dein#add('tmux-plugins/vim-tmux')
call dein#add('tmux-plugins/vim-tmux-focus-events')
call dein#add('rhysd/github-complete.vim')
call dein#add('junegunn/goyo.vim')

call dein#add('neomake/neomake')

call dein#add('Shougo/deoplete.nvim')
call dein#add('mhartington/deoplete-typescript')
call dein#add('HerringtonDarkholme/yats.vim')
call dein#add('steelsojka/deoplete-flow')
call dein#add('fishbullet/deoplete-ruby')

call dein#add('janko-m/vim-test')

if dein#check_install()
  call dein#install()
endif
call dein#end()
