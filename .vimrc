" Basic ------------------------------------ "
set nocompatible
set number
set history=1000
set laststatus=2
set encoding=utf-8
scriptencoding utf-8
set showcmd
set autoread
set hidden
set visualbell
set title
set scrolloff=3
set cmdheight=1
set timeoutlen=1000 ttimeoutlen=0

" Resize splits when the window is resized
autocmd VimResized * :wincmd =

" disable Ex mode
nnoremap Q <nop>

" Colorcolumn
set cc=80

" don't show things like -- INSERT --
set noshowmode

" https://gist.github.com/chrishunt/6042695
if $TMUX == ''
  set clipboard+=unnamed
endif

" Use the old vim regex engine (version 1, as opposed to version 2, which was
" introduced in Vim 7.3.969). The Ruby syntax highlighting is significantly
" slower with the new regex engine.
set re=1

" <leader> ------------------------------------ "
let g:mapleader = ","

" Whitespace ------------------------------------ "
set nowrap                      " don't wrap lines
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab                   " use spaces, not tabs (optional)
set backspace=indent,eol,start  " backspace through everything in insert mode
set autoindent                  " always set autoindenting on
set copyindent                  " copy the previous indentation on autoindenting

" Wildmode ------------------------------------ "
set wildmode=list:longest
set wildignore+=*.o,*.obj,.git,*.rbc,*.class,.svn,vendor/gems/*

" Search ------------------------------------ "
set hlsearch                    " highlight matches
set incsearch                   " incremental searching
set ignorecase                  " searches are case insensitive...
set smartcase                   " ... unless they contain at least one capital letter
set ignorecase
set smartcase
set gdefault
set incsearch
set showmatch
set hlsearch
" ,<space> clears search
nnoremap <leader><space> :noh<cr>

" Mappings ------------------------------------ "
command! W :w
:nmap ; :

" Navigation ------------------------------------ "
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>

" easier split (, + w)
nnoremap <leader>w <C-w>v<C-w>l
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Files ------------------------------------ "
autocmd BufNewFile,BufRead *.ejs set filetype=html.js
autocmd BufNewFile,BufRead *.jst set filetype=html.js
autocmd BufNewFile,BufRead *.handlebars set filetype=html.js
autocmd BufNewFile,BufRead *.hbs set filetype=html.js
autocmd BufNewFile,BufRead *.less set filetype=less
autocmd BufNewFile,BufRead {Guardfile,Gemfile,Rakefile,Vagrantfile,Thorfile,config.ru} set filetype=ruby
autocmd BufNewFile,BufRead *.json set filetype=javascript
autocmd BufNewFile,BufRead *.clj,*cljs,*.wisp set filetype=clojure
autocmd BufNewFile,BufRead *.js set filetype=javascript.jsx

autocmd BufNewFile,BufRead *.elm set tabstop=4
autocmd BufNewFile,BufReadPost *.md set filetype=markdown

" Backup ------------------------------------ "
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set noswapfile " no swap files

" vim-plug package manager ------------------- "
call plug#begin('~/.vim/plugged')

" JavaScript / TypeScript
Plug 'moll/vim-node'
Plug 'jelera/vim-javascript-syntax'
Plug 'ianks/vim-tsx'
Plug 'leafgarland/typescript-vim'
"Plug 'HerringtonDarkholme/yats.vim'

" Haskell
Plug 'neovimhaskell/haskell-vim'

" Elm
Plug 'ElmCast/elm-vim'

" Git
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'

" Tmux
Plug 'benmills/vimux'
Plug 'christoomey/vim-tmux-navigator'

" Utilities
Plug 'brooth/far.vim'
Plug 'janko-m/vim-test'
Plug 'Lokaltog/vim-easymotion'
Plug 'junegunn/vim-easy-align'
Plug 'neomake/neomake'
Plug 'editorconfig/editorconfig-vim'
Plug 'tpope/vim-markdown'
Plug 'xolox/vim-misc'
Plug 'xolox/vim-notes'
Plug 'Valloric/YouCompleteMe'
Plug 'regedarek/zoomwin'
Plug 'sbdchd/neoformat'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" Other
Plug 'dansomething/vim-hackernews'
Plug 'idris-hackers/idris-vim'

" Theme
Plug 'joshdick/onedark.vim'
Plug 'andreypopp/vim-colors-plain'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

call plug#end()

" Plugin configuration ------------------------------------ "
autocmd BufWritePre *.js,*.jsx,*.ts,*.tsx,*.hs,*.elm Neoformat

let g:markdown_fenced_languages = ['css', 'erb=eruby', 'javascript', 'js=javascript', 'json=javascript', 'ruby', 'sass', 'xml', 'html']

let g:haskell_indent_case_alternative = 1
let g:haskell_indent_in = 1
let g:haskell_indent_before_where = 2
let g:haskell_indent_after_bare_where = 2

let g:neoformat_enabled_haskell = ['brittany', 'stylishhaskell']

let g:neomake_haskell_enabled_makers = ['hlint']

let g:haskell_enable_quantification = 1   " to enable highlighting of `forall`
let g:haskell_enable_recursivedo = 1      " to enable highlighting of `mdo` and `rec`
let g:haskell_enable_arrowsyntax = 1      " to enable highlighting of `proc`
let g:haskell_enable_pattern_synonyms = 1 " to enable highlighting of `pattern`
let g:haskell_enable_typeroles = 1        " to enable highlighting of type roles
let g:haskell_enable_static_pointers = 1  " to enable highlighting of `static`
let g:haskell_backpack = 1                " to enable highlighting of backpack keywords
let g:haskell_classic_highlighting = 1

" elm-vim
let g:elm_format_autosave = 1
let g:elm_setup_keybindings = 0

au FileType elm nmap <leader>m <Plug>(elm-make)
au FileType elm nmap <leader>M <Plug>(elm-make-main)
au FileType elm nmap <leader>t <Plug>(elm-test)
au FileType elm nmap <leader>r <Plug>(elm-repl)
au FileType elm nmap <leader>e <Plug>(elm-error-detail)
au FileType elm nmap <leader>d <Plug>(elm-show-docs)
au FileType elm nmap <leader>D <Plug>(elm-browse-docs)

let g:elm_syntastic_show_warnings = 1

" ZoomWin
nnoremap <leader>z :ZoomWin<cr>

" vim-easy-align
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

" vim-gitgutter
let g:gitgutter_sign_added = '|'
let g:gitgutter_sign_modified = '|'
let g:gitgutter_sign_removed = '|'
let g:gitgutter_sign_removed_first_line = '|'
let g:gitgutter_sign_modified_removed = '|'
let g:gitgutter_realtime = 0
let g:gitgutter_eager = 0

" vim-airline
let g:airline_powerline_fonts = 1
let g:airline_theme='powerlineish'
let g:airline_theme='onedark'
let g:Powerline_symbols = 'fancy'

let g:airline_right_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_left_alt_sep= ''
let g:airline_left_sep = ''

" Ag
nnoremap <leader>a :Ag<space>

if executable('ag')
  set grepprg=ag\ --nogroup\ --nocolor
endif

" fzf
nnoremap <leader>. :FZF<cr>

let $FZF_DEFAULT_COMMAND='rg --files'

let g:fzf_layout = { 'down': '~40%' }

autocmd! FileType fzf
autocmd  FileType fzf set laststatus=0 noshowmode noruler
  \| autocmd BufLeave <buffer> set laststatus=2 showmode ruler

command! -bang -nargs=* Ag
  \ call fzf#vim#ag(<q-args>,
  \                 <bang>0 ? fzf#vim#with_preview('up:60%')
  \                         : fzf#vim#with_preview('right:50%:hidden', '?'),
  \                 <bang>0)

" Customize fzf colors to match your color scheme
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

" YouCompleteMe
let g:ycm_complete_in_comments_and_strings = 1
let g:ycm_collect_identifiers_from_comments_and_strings = 1
let g:ycm_min_num_of_chars_for_completion = 3
let g:ycm_semantic_triggers = {
     \ 'elm' : ['.'],
     \}

" Small functions ----------------------------- "

nnoremap <leader>j :%!python -m json.tool<cr>

" Rename file with <leader>rn "
function! RenameFile()
    let old_name = expand('%')
    let new_name = input('New file name: ', expand('%'), 'file')
    if new_name != '' && new_name != old_name
        exec ':saveas ' . new_name
        exec ':silent !rm ' . old_name
        redraw!
    endif
endfunction
nnoremap <leader>rn :call RenameFile()<cr>

function! RunTests()
  if match(expand("%"), '\(.js\)$') != -1
    call RunJSTests()
  else if match(expand("%"), '\(.elm\)$') != -1
    call ElmTest()
  endif
endfunction

function! RunJSTests()
  let cwd = getcwd()
  let cmd = 'nvm use; npm test'

  if match(expand("%"), '\(._spec.js\|_test.js\)$') != -1
    let t:test_file = expand("%")
  endif

  if exists("t:test_file")
    if filereadable("node_modules/mocha/bin/mocha")
      let cmd = 'nvm use; mocha ' . t:test_file
    endif
  endif

  call VimuxRunCommand(cmd)
endfunction

nnoremap <Leader>t :call RunJSTests()<CR>

function! RunAllJSTests()
  call VimuxRunCommand('nvm use; npm test')
endfunction
nnoremap <Leader>T :call RunAllJSTests()<CR>

function! BuildProject()
  "if match(expand("%"), '\(.elm\)$') != -1
    "call ElmMake()
  "else
    if filereadable("package.json")
      call BuildJS()
    endif
  "endif
endfunction
nnoremap <Leader>b :call BuildProject()<CR>

function! BuildJS()
  let cwd = getcwd()
  call VimuxRunCommand('nvm use; clear; npm run build')
endfunction

augroup ensure_directory_exists
  autocmd!
  autocmd BufNewFile * call s:EnsureDirectoryExists()
augroup END

function! s:EnsureDirectoryExists()
  let required_dir = expand("%:h")

  if !isdirectory(required_dir)
    " Remove this if-clause if you don't need the confirmation
    if !confirm("Directory '" . required_dir . "' doesn't exist. Create it?")
      return
    endif

    try
      call mkdir(required_dir, 'p')
    catch
      echoerr "Can't create '" . required_dir . "'"
    endtry
  endif
endfunction

" Misc ------------------------------------ "
nmap <leader>p :!thyme -d<cr>

" Color ------------------------------------ "
" set proper colors for terminal vim
syntax on
set t_Co=256

set termguicolors
"Credit joshdick
"Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
"(see < http://sunaku.github.io/tmux-24bit-color.html#usage > for more information.)
if (has("nvim"))
  "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
endif

"For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
"Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
" < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
if (has("termguicolors"))
  set termguicolors
endif

let g:one_allow_italics = 1

" tmux support
set t_8b=^[[48;2;%lu;%lu;%lum
set t_8f=^[[38;2;%lu;%lu;%lum

set background=dark " for the dark version
colorscheme onedark
