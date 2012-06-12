" Environment {
    set nocompatible 	" be iMproved
    filetype off 		" required!

    " Setup Bundle Support
    " The next two lines ensure that the ~/.vim/bundle/ system works
    set rtp+=~/.vim/bundle/vundle
    call vundle#rc()
" }



" Bundles {
    " let Vundle manage Vundle
    " required!
    Bundle 'gmarik/vundle'

    " plugins
    "Bundle 'vim-scripts/bufexplorer.zip'
    "Bundle 'fholgado/minibufexpl.vim'
    Bundle 'vim-scripts/minibufexpl.vim'
    "Bundle 'vim-scripts/taglist.vim'
    Bundle 'majutsushi/tagbar'
    Bundle 'vim-scripts/DoxygenToolkit.vim'
    Bundle 'scrooloose/syntastic'
    Bundle 'scrooloose/nerdtree'
    Bundle 'scrooloose/nerdcommenter'
    Bundle 'Rip-Rip/clang_complete'
    Bundle 'ervandew/supertab'
    Bundle 'tpope/vim-surround'
    Bundle 'vim-scripts/AutoClose'
    Bundle 'Lokaltog/vim-powerline'
    Bundle 'vim-scripts/c.vim'
    Bundle 'klen/python-mode'
    Bundle 'python.vim'
    Bundle 'python_match.vim'
    Bundle 'pythoncomplete'
" }



" General Configurations {
    filetype plugin indent on 	" required!

    " color
    colorscheme desert

    " syntax highlighting
    syntax on

    scriptencoding utf-8

    " allow buffer switching without saving
    set hidden

    " highlight current line
    set cursorline

    " indent at the same level of the previous line
    set autoindent

    " color the 81st column, vim version >= 7.3
    if version >= 703
        set colorcolumn=81
    endif

    " show
    set showmode
    set showcmd
    set showmatch

    " search
    set incsearch
    set hlsearch

    " TAB and space
    set tabstop=4
    set shiftwidth=4
    set expandtab

    " Always show status line, even for one window
    set laststatus=2
    set statusline=%<%f\    " Filename
    set statusline+=%w%h%m%r " Options
    set statusline+=%fugitive#statusline() "  Git Hotness
    set statusline+=\ [%&ff/%Y]            " filetype
    set statusline+=\ [%getcwd()]          " current dir
    set statusline+=%=%-14.(%l,%c%V%)\ %p%%  " Right aligned file nav info

    " line number and column number
    set number
    set ruler

    " make backspace work normal
    "set backspace=2
    set backspace=indent,eol,start

    " split
    map <S-s> :split<cr>
    map <S-v> :vsplit<cr>

    " windows size
    " height
    map <S-j> <C-W>+
    map <S-k> <C-W>-
    " width
    map <S-h> <C-W><
    map <S-l> <C-W>>

    " move among several windows
    map <C-j> <C-W>j
    map <C-k> <C-W>k
    map <C-h> <C-W>h
    map <C-l> <C-W>l

    " encoding
    set encoding=utf-8
    set fileencodings=utf-8,gbk,gb2312,gb18030,ucs-bom,cp936,latin1
    " encode current file
    map en :set fileencoding=utf-8<cr>

    " quickfix
    nmap <silent> <F6> :cn<cr>
    nmap <silent> <F7> :cp<cr>
    nmap <silent> <F8> :cw<cr>
" }



" Plugin Configurations {
"
    " bufexplorer {
    " \be to list buffers
    " j, k to move, d to close, r to reverse order of buffer list
    " }

    " minibufexpl {
        let g:miniBufExplMapWindowNavVim=1 
        let g:miniBufExplMapWindowNavArrows=1 
        let g:miniBufExplMapCTabSwitchBufs=1 
        let g:miniBufExplModSelTarget=1 
        " open next buffer
        map <S-n> :bn!<cr>
        " open previous buffer
        map <S-p> :bp!<cr> 
    " }

    " taglist {
    "    let Tlist_Show_One_File=1
    "    let Tlist_Exit_OnlyWindow=1
    "    let Tlist_Use_Right_Window = 1
    "    let Tlist_Sort_Type = "name"
    "    map <F12> :Tlist<cr>
    " }

    " TagBar {
        map tt :TagbarToggle<CR>
    " }
 
    " DoxygenToolkit {
        map fg :Dox<cr>
    " }

    " syntastic {
    "
    " }
 
    " nerdtree {
        map nt :NERDTreeToggle<cr>
        " open nerdtree and taglist by one key
        map wm :NERDTreeToggle<cr> :TagbarToggle<cr>
    " }

    " nerdcommenter {
        map cm <plug>NERDCommenterToggle
    " }

    " clang_complete {
        " use libclang.so, not the executeable file clang
        let g:clang_use_library = 1
        " nothing is selected
        let g:clang_auto_select = 0
        " automatically complete after ->, ., ::
        let g:clang_complete_auto = 1
        " highlight warnings and errors
        let g:clang_hl_errors = 1
        " open quickfix window on error
        "let g:clang_complete_copen = 1
        " periodically update the quickfix window
        "let g:clang_periodic_quickfix = 1
        " close the preview window automatically after acompletion
        "let g:clang_close_preview = 1
        " do not open the preview window
        set completeopt=menu,longest
    " }

    " supertab {
        "let g:SuperTabDefaultCompletionType = '<C-X><C-U>'
        " use omni completion
        let g:SuperTabDefaultCompletionType = '<C-X><C-O>'
    " }

    " python-mode {
        let g:pymode_lint_checker = "pyflakes"
    " }

    " csupport {
        let g:C_FormatTime='%a %b %e %H:%M:%S %Y'
        let g:C_LocalTemplateFile=$HOME.'/.vim/local_config/csupport/Templates'
    " }

    " powerline {
        "let g:Powerline_symbols = 'fancy'
    " }


" }


" External Tools {

    " Astyle {
        source $HOME/.vim/local_config/astyle/astylerc 
    " }

    " ctags and cscope {
        source $HOME/.vim/local_config/tagscoperc 
    " }

" }

" Functions {

" File Comment
map <F4> :call FileComment()<cr>
function AddFileComment()
    call append(0, "/*")
    call append(1, " * @file ".expand("%:t"))
    call append(2, " * @brief ")
    call append(3, " * ")
    call append(4, " * @version 1.0")
    call append(5, " * @date ".strftime("%a %b %e %H:%M:%S %Y"))
    call append(6, " * ")
    call append(7, " * @copyright Copyright (C) ".strftime("%Y")." UESTC")
    call append(8, " * @author shiwei<shiwei2012@gmail.com>")
    call append(9, " */")
    echohl WarningMsg | echo "Successful in adding the copyright." | echohl None
endfunc

function UpdateFileComment()
    normal m'
    execute '/@file/s@e.*$@\="e ".expand("%:t")@'
    execute "noh"
    normal ''
    echohl WarningMsg | echo "Successful in updating the copyright." | echohl None
endfunc'

function FileComment()
    let n = 1 
    while n < 10
        let line = getline(n)
        if line =~ '^ \*\s*\S* @file \S*.*$'
            call UpdateFileComment()
            return
        endif
        let n = n + 1
    endwhile
    call AddFileComment()
endfunction"

" }
