" check whether vim-plug is installed and install it if necessary
let plugpath = expand('<sfile>:p:h'). '/autoload/plug.vim'
if !filereadable(plugpath)
    if executable('curl')
        let plugurl = 'https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
        call system('curl -fLo ' . shellescape(plugpath) . ' --create-dirs ' . plugurl)
        if v:shell_error
            echom "Error downloading vim-plug. Please install it manually.\n"
            exit
        endif
    else
        echom "vim-plug not installed. Please install it manually or install curl.\n"
        exit
    endif
endif

call plug#begin('~/.config/nvim/plugged')

" colorschemes
Plug 'dracula/vim'

" utilities
Plug 'scrooloose/nerdtree', { 'on': ['NERDTreeToggle', 'NERDTreeFind'] } | Plug 'Xuyuanp/nerdtree-git-plugin' | Plug 'ryanoasis/vim-devicons' " file drawer
Plug '/usr/local/opt/fzf' | Plug 'junegunn/fzf.vim' " fuzzy file finder and so much more
Plug 'mileszs/ack.vim' " search inside files using ack. Same as command line ack utility, but use :Ack
" Plug 'Raimondi/delimitMate' " automatic closing of quotes, parenthesis, brackets, etc.
Plug 'jiangmiao/auto-pairs' " automatic closing of quotes, parenthesis, brackets, etc.
Plug 'tpope/vim-obsession' " save vim sessions
Plug 'tpope/vim-commentary' " comment stuff out
Plug 'tpope/vim-unimpaired' " mappings which are simply short normal mode aliases for commonly used ex commands
Plug 'tpope/vim-ragtag' " endings for html, xml, etc. - ehances surround
Plug 'tpope/vim-surround' " mappings to easily delete, change and add such surroundings in pairs, such as quotes, parens, etc.
Plug 'benmills/vimux' " tmux integration for vim
Plug 'vim-airline/vim-airline' " fancy statusline
Plug 'vim-airline/vim-airline-themes' " themes for vim-airline
Plug 'apriendeau/colorline'
Plug 'neomake/neomake' " neovim replacement for syntastic using neovim's job control functonality
Plug 'tpope/vim-fugitive' " amazing git wrapper for vim
Plug 'tpope/vim-repeat' " enables repeating other supported plugins with the . command
Plug 'garbas/vim-snipmate' " snippet manager
Plug 'editorconfig/editorconfig-vim' " .editorconfig support
Plug 'MarcWeber/vim-addon-mw-utils' " interpret a file by function and cache file automatically
Plug 'tomtom/tlib_vim' " utility functions for vim
Plug 'sotte/presenting.vim', { 'for': 'markdown' } " a simple tool for presenting slides in vim based on text files
Plug 'ervandew/supertab' " Perform all your vim insert mode completions with Tab
Plug 'tpope/vim-dispatch' " asynchronous build and test dispatcher
Plug 'tpope/vim-vinegar' " netrw helper
Plug 'AndrewRadev/splitjoin.vim' " single/multi line code handler: gS - split one line into multiple, gJ - combine multiple lines into one
Plug 'vim-scripts/matchit.zip' " extended % matching
Plug 'tpope/vim-sleuth' " detect indent style (tabs vs. spaces)
Plug 'sickill/vim-pasta' " context-aware pasting
Plug 'vimwiki/vimwiki' " vim wiki for docs and journal

" Language-specific Configuration {{{
    " html / templates {{{
        " emmet support for vim - easily create markdup wth CSS-like syntax
        Plug 'mattn/emmet-vim', { 'for': ['html', 'javascript.jsx']}
        let g:user_emmet_settings = {
        \  'javascript.jsx': {
        \      'extends': 'jsx',
        \  },
        \}

        " match tags in html, similar to paren support
        Plug 'gregsexton/MatchTag', { 'for': 'html' }
        Plug 'othree/html5.vim', { 'for': 'html' }

        " templates
        Plug 'mustache/vim-mustache-handlebars'
        Plug 'digitaltoad/vim-pug', { 'for': ['jade', 'pug'] }
    " }}}

    " JavaScript {{{
        Plug 'othree/yajs.vim', { 'for': [ 'javascript', 'javascript.jsx', 'html' ] }
        " Plug 'pangloss/vim-javascript', { 'for': ['javascript', 'javascript.jsx', 'html'] }
        Plug 'moll/vim-node', { 'for': 'javascript' }
        Plug 'mxw/vim-jsx', { 'for': ['javascript.jsx', 'javascript'] }
        Plug 'ternjs/tern_for_vim', { 'for': ['javascript', 'javascript.jsx'], 'do': 'npm install' }
    " }}}

    " TypeScript {{{
        Plug 'leafgarland/typescript-vim', { 'for': 'typescript' }
        Plug 'ianks/vim-tsx', { 'for': 'typescript' }
        Plug 'Shougo/vimproc.vim', { 'do': 'make' }
    " }}}

    " Styles {{{
        Plug 'wavded/vim-stylus', { 'for': ['stylus', 'markdown'] }
        Plug 'groenewege/vim-less', { 'for': 'less' }
        Plug 'hail2u/vim-css3-syntax', { 'for': 'css' }
        Plug 'cakebaker/scss-syntax.vim', { 'for': 'scss' }
        Plug 'gko/vim-coloresque'
        Plug 'stephenway/postcss.vim', { 'for': 'css' }
        " Plug 'ap/vim-css-color', { 'for': ['css','stylus','scss'] } " set the background of hex color values to the color
    " }}}

    " Markdown {{{
        Plug 'tpope/vim-markdown', { 'for': 'markdown' }
        " let g:markdown_fenced_languages = [ 'tsx=typescript.tsx' ]

        " Open markdown files in Marked.app - mapped to <leader>m
        Plug 'itspriddle/vim-marked', { 'for': 'markdown', 'on': 'MarkedOpen' }
        " nmap <leader>m :MarkedOpen!<cr>
        " nmap <leader>mq :MarkedQuit<cr>
        " nmap <leader>* *<c-o>:%s///gn<cr>
    " }}}

    " JSON {{{
        Plug 'elzr/vim-json', { 'for': 'json' }
        " let g:vim_json_syntax_conceal = 0
    " }}}


    Plug 'fatih/vim-go', { 'for': 'go' } " go support
    Plug 'ekalinin/Dockerfile.vim'
" }}}

call plug#end()
