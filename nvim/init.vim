":CocInstall coc-prettier Basic ------------------------------------ "
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
set updatetime=300
set shortmess+=c
set signcolumn=yes
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
set clipboard=unnamed

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
autocmd BufNewFile,BufRead *.njk set filetype=html.js
autocmd BufNewFile,BufRead *.jst set filetype=html.js
autocmd BufNewFile,BufRead *.handlebars set filetype=html.js
autocmd BufNewFile,BufRead *.hbs set filetype=html.js
autocmd BufNewFile,BufRead *.less set filetype=less
autocmd BufNewFile,BufRead {Guardfile,Gemfile,Rakefile,Vagrantfile,Thorfile,config.ru} set filetype=ruby
autocmd BufNewFile,BufRead *.clj,*cljs,*.wisp set filetype=clojure
autocmd BufNewFile,BufRead *.js set filetype=javascript.jsx
autocmd BufNewFile,BufRead *.elm set tabstop=4

augroup ft_markdown
  au!
  au BufNewFile,BufRead *.md setlocal filetype=markdown
  au BufNewFile,BufRead *.md setlocal textwidth=80
  au BufNewFile,BufRead *.md setlocal smartindent " Indent lists correctly

  " au BufNewFile,BufRead *.md setlocal wrap
  " au BufNewFile,BufRead *.md setlocal linebreak
augroup END

" Backup ------------------------------------ "
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set noswapfile " no swap files

set completeopt=menu,menuone,preview,noselect,noinsert

" vim-plug package manager ------------------- "
call plug#begin('~/.local/share/nvim/plugged')

" Utilities
Plug 'nvim-lua/plenary.nvim'
Plug 'editorconfig/editorconfig-vim'
Plug 'regedarek/zoomwin'
Plug 'eugen0329/vim-esearch'
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-file-browser.nvim'
Plug 'nvim-tree/nvim-web-devicons'
Plug 'nvim-tree/nvim-tree.lua'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'

" JavaScript / TypeScript
Plug 'moll/vim-node'
Plug 'jelera/vim-javascript-syntax'
Plug 'ianks/vim-tsx'
Plug 'HerringtonDarkholme/yats.vim'
Plug 'othree/html5.vim'
Plug 'prisma/vim-prisma'

" Various languages
Plug 'neovimhaskell/haskell-vim'
Plug 'ElmCast/elm-vim'
Plug 'purescript-contrib/purescript-vim'
Plug '~/.local/share/nvim/plugged/unison'
Plug 'idris-hackers/idris-vim'
Plug 'jparise/vim-graphql'

" Tmux
Plug 'benmills/vimux'
Plug 'christoomey/vim-tmux-navigator'

" Git
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'


" Docs / Markdown
Plug 'godlygeek/tabular'
Plug 'junegunn/limelight.vim'
Plug 'junegunn/goyo.vim'
Plug 'vim-pandoc/vim-pandoc'
Plug 'vim-pandoc/vim-pandoc-syntax'

" Theme/UI
Plug 'ayu-theme/ayu-vim'
Plug 'drewtempelmeyer/palenight.vim'
Plug 'rakr/vim-one'
Plug 'glepnir/galaxyline.nvim' , {'branch': 'main'}
Plug 'catppuccin/nvim', { 'as': 'catppuccin' }

" Language Server, linting, formatting, completion
Plug 'neoclide/coc.nvim', {'do': { -> coc#util#install()}}

Plug 'kyazdani42/nvim-web-devicons'

Plug 'dag/vim-fish'

call plug#end()

" Plugin configuration ------------------------------------ "

" :lua require('statusline')

" Telescope
:lua require("telescope").load_extension "file_browser"
nnoremap <leader>. <cmd>Telescope find_files<cr>

" nvim tree

:lua require("nvim-tree").setup()

" = Coc.nvim

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

" Insert <tab> when previous text is space, refresh completion if not.
inoremap <silent><expr> <TAB>
\ coc#pum#visible() ? coc#pum#next(1):
\ <SID>check_back_space() ? "\<Tab>" :
\ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

inoremap <expr> <cr> coc#pum#visible() ? coc#_select_confirm() : "\<CR>"

nmap <silent> <leader>dd <Plug>(coc-definition)
nmap <silent> <leader>dr <Plug>(coc-references)
nmap <silent> <leader>dj <Plug>(coc-implementation)
nmap <silent> <leader>cn :call CocAction('diagnosticNext')<CR>
nmap <silent> <leader>cp :call CocAction('diagnosticPrevious')<CR>

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

nnoremap <leader>n :NvimTreeToggle<CR>

" = esearch
nmap <leader>a <plug>(esearch)

" = vim-pandoc
let g:pandoc#modules#disabled = ['folding']
let g:pandoc#keyboard#enabled_submodules = ["lists", "references", "styles", "sections"]

" = vim-pandoc-syntax
let g:pandoc#syntax#conceal#use = 0
let g:pandoc#syntax#codeblocks#embeds#langs = ['css', 'elm', 'haskell', 'ruby', 'erb=eruby', 'javascript', 'js=javascript', 'json=javascript', 'typescript', 'ts=typescript', 'xml', 'html']

autocmd FileType markdown set nolist
" Taken from here: https://github.com/plasticboy/vim-markdown/issues/232
autocmd FileType markdown
    \ set formatoptions-=q |
    \ set formatlistpat=^\\s*\\d\\+\\.\\s\\+\\\|^\\s*\[-*+]\\s\\+

" haskell-vim
let g:haskell_indent_case_alternative = 1
let g:haskell_indent_in = 1
let g:haskell_indent_before_where = 2
let g:haskell_indent_after_bare_where = 2

let g:haskell_enable_quantification = 1   " to enable highlighting of `forall`
let g:haskell_enable_recursivedo = 1      " to enable highlighting of `mdo` and `rec`
let g:haskell_enable_arrowsyntax = 1      " to enable highlighting of `proc`
let g:haskell_enable_pattern_synonyms = 1 " to enable highlighting of `pattern`
let g:haskell_enable_typeroles = 1        " to enable highlighting of type roles
let g:haskell_enable_static_pointers = 1  " to enable highlighting of `static`
let g:haskell_backpack = 1                " to enable highlighting of backpack keywords
let g:haskell_classic_highlighting = 1

let g:elm_syntastic_show_warnings = 1

" ZoomWin
nnoremap <leader>z :ZoomWin<cr>

" vim-gitgutter
let g:gitgutter_sign_added = '|'
let g:gitgutter_sign_modified = '|'
let g:gitgutter_sign_removed = '|'
let g:gitgutter_sign_removed_first_line = '|'
let g:gitgutter_sign_modified_removed = '|'
let g:gitgutter_realtime = 0
let g:gitgutter_eager = 0

" Small functions ----------------------------- "

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

function! Focus()
  exec ':Limelight'
  exec ':Goyo'
endfunction
map <leader>f :call Focus()<CR>

" Color ------------------------------------ "
" set proper colors for terminal vim
syntax on
set t_Co=256

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

" tmux support
set t_8b=^[[48;2;%lu;%lu;%lum
set t_8f=^[[38;2;%lu;%lu;%lum

set background=dark

"colorscheme catppuccin-macchiato
colorscheme aesir
