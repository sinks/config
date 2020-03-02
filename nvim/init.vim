call plug#begin('~/.config/nvim/plugged')

" Tools
Plug 'editorconfig/editorconfig-vim'
Plug 'scrooloose/nerdcommenter'
Plug 'junegunn/vim-easy-align'
Plug 'tpope/vim-fugitive'
Plug 'junegunn/gv.vim'
Plug 'jreybert/vimagit'
Plug 'mboughaba/vim-lessmess'
Plug 'tpope/vim-sleuth'
Plug 'ripxorip/aerojump.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'janko/vim-test'

" Code LSP, completion, snippet
Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-tsserver', {'do': 'yarn install --frozen-lockfile'}
Plug 'iamcco/coc-flutter', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-solargraph', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-yank', {'do': 'yarn install --frozen-lockfile'}

"
Plug 'dense-analysis/ale'

" Searching/Navigation
Plug 'scrooloose/nerdtree'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'dyng/ctrlsf.vim'                  " global search and replace coolness
Plug 'stefandtw/quickfix-reflector.vim' " editing of quckfix lines

" Plug 'gabesoft/vim-ags' " ag specific with edit mode
" Plug 'mhinz/vim-grepper' " live search by doing :Grepper<CR>:copen<CR>

" Airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Languages
Plug 'reasonml-editor/vim-reason-plus'
" Plug 'aklt/plantuml-syntax'
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'

Plug 'sheerun/vim-polyglot' " includes a lot of language syntax

" Themes
Plug 'NLKNguyen/papercolor-theme'
Plug 'ayu-theme/ayu-vim'
Plug 'crusoexia/vim-monokai'
Plug 'fenetikm/falcon'
Plug 'joshdick/onedark.vim'
Plug 'lifepillar/vim-solarized8'
Plug 'liuchengxu/space-vim-theme'
Plug 'morhetz/gruvbox'
Plug 'nanotech/jellybeans.vim'
Plug 'nightsense/shoji'
Plug 'rakr/vim-one'
Plug 'rakr/vim-two-firewatch'
Plug 'sjl/badwolf'
Plug 'sonph/onehalf', { 'rtp': 'vim' }

" Plug 'ryanoasis/vim-devicons' " Slows down rendering Add icons need a nerd icon installed
" Plug 'flazz/vim-colorschemes' " use themes direct from git instead

call plug#end()

" BACKUP
" set backupcopy=yes " fixes npm noticing the build changes

" SET THEME
set termguicolors
set background=light
let ayucolor="dark"
try
  " color Tomorrow-Night-Eighties
  " color Tomorrow-Night
  " colorscheme solarized8
  " colorscheme solarized8_flat
  colorscheme solarized8_high
  " colorscheme monokai
  " colorscheme badwolf
  " colorscheme jellybeans
  " colorscheme onedark
  " colorscheme shoji_niji
  " colorscheme onehalflight
  " colorscheme onehalfdark
  " colorscheme ayu
  " colorscheme falcon
  " colorscheme space_vim_theme
  " colorscheme PaperColor
  " colorscheme gruvbox

  " colorscheme zellner

  " colorscheme two-firewatch
  " light:
  " when moving up and down cant tell where the cursor actually is, has
  " an underline for the current cursor and block cursor on the paragraph

catch
endtry

" GENERAL
set ignorecase                  " ignore case
set smartcase                   " ignorecase=false when includes an upper case char
set inccommand=split            " live substitute preview

" CLIPBOARD
set clipboard+=unnamedplus    " always use the clipboard

" INDENTING
set expandtab                   " default to spaces
" using tpope/vim-sleuth
set tabstop=2                   " make \t 2 spaces
set shiftwidth=2                " indent default of 2
" set softtabstop=-1              " -1 - use shiftwidth for tab
" set autoindent
" set smartindent
"filetype plugin indent on

" REMAP
let mapleader = "\<Space>"
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
map <leader>n :NERDTreeFind<CR>
map <leader>w :w<CR>
map <leader>f :Ag<CR>
map <leader>b :Buffers<CR>
map <leader>; <plug>NERDCommenterToggle<CR>
map <leader>r <plug>CtrlSFPrompt

" coc.vim
nmap <leader>a  <Plug>(coc-codeaction)
nmap <leader>gd  <Plug>(coc-definition)
nmap <leader>gr  <Plug>(coc-refrences)
nmap <leader>qf  <Plug>(coc-fix-current)
nmap <leader>rn <Plug>(coc-rename)

inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" aerojump
nmap <leader>sb <Plug>(AerojumpBolt)

nnoremap <silent> <Leader>p :call fzf#run({
      \   'source': "(ag -l -g '')",
      \   'sink': 'e',
      \   'down': '40%'})<CR>

" SUPERTAB
let g:SuperTabDefaultCompletionType = "<c-n>"

" JSX/REACT
let g:jsx_ext_required = 0

" PYTHON3
" let g:python3_host_prog = 'python3'

" NERD COMMENTER
let g:NERDSpaceDelims = 1
let g:NERDDefaultAlign = 'left'

" ALE
let g:ale_lint_on_save = 1 " is default just to make it explicit
let g:ale_lint_on_text_changed = 'never' " seems slow editor down when typing
let g:ale_ruby_rubocop_executable = 'bundle'
let g:ale_cache_executable_check_failures = 0 " cache checks
let g:ale_completion_enabled = 0
" let g:ale_dart_dartfmt_options = '-l 120'
let g:ale_linters = {
    \ 'typescript': [],
    \ 'typescriptreact': [],
    \ }
" let g:ale_dart_dartfmt_options = '-l 120'
let g:ale_fix_on_save = 1
let g:ale_fixers = {
    \ 'go': ['gofmt'],
    \ 'reason': ['refmt'],
    \ 'javascript': ['eslint', 'prettier'],
    \ 'ruby': ['rubocop'],
    \ 'css': ['prettier'],
    \ 'dart': ['dartfmt'],
    \ 'typescript': ['tslint'],
    \ 'typescriptreact': ['tslint']
    \ }
