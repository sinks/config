call plug#begin('~/.config/nvim/plugged')

" Tools
Plug 'editorconfig/editorconfig-vim'
Plug 'scrooloose/nerdcommenter'
Plug 'junegunn/vim-easy-align'
Plug 'tpope/vim-fugitive'
" Plug 'junegunn/gv.vim'
Plug 'jreybert/vimagit'
Plug 'ervandew/supertab'
Plug 'mboughaba/vim-lessmess'

" Code help
Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'}
" Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
" ncm2 completion
" Plug 'ncm2/ncm2'
" Plug 'roxma/nvim-yarp'
" Plug 'ncm2/ncm2-path'
" Plug 'ncm2/ncm2-bufword'
"
" Plug 'Shougo/neco-syntax'
Plug 'w0rp/ale'   " ale keeps starting a dart_language_server as well as LanguageClient-neovim
" Plug 'sbdchd/neoformat' " just want updates and be reminded about it
" gives warnings about flow types
" Plug 'autozimu/LanguageClient-neovim', {
"     \ 'branch': 'next',
"     \ 'do': 'bash install.sh',
"     \ }

" Searching/Navigation
Plug 'scrooloose/nerdtree'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'dyng/ctrlsf.vim'                  " global search and replace coolness
Plug 'stefandtw/quickfix-reflector.vim' " editing of quckfix lines

" Plug 'gabesoft/vim-ags' " ag specific with edit mode
" Plug 'mhinz/vim-grepper' " live search by doing :Grepper<CR>:copen<CR>

" Testing,
" Plug 'Shougo/denite.nvim' " want to be alerted when updated

" Airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Languages
" Plug 'fatih/vim-go'
" Plug 'dart-lang/dart-vim-plugin'
" Plug 'elixir-lang/vim-elixir'
" Plug 'pangloss/vim-javascript'
" Plug 'vim-ruby/vim-ruby'
" Plug 'mxw/vim-jsx'
" Plug 'isobit/vim-caddyfile'
" Plug 'ElmCast/elm-vim'
" Plug 'HerringtonDarkholme/yats.vim'
" Plug 'leafgarland/typescript-vim'
" Plug 'peitalin/vim-jsx-typescript'
Plug 'reasonml-editor/vim-reason-plus'
" Plug 'aklt/plantuml-syntax'

Plug 'sheerun/vim-polyglot' " includes a lot of language syntax

" Themes
Plug 'morhetz/gruvbox'
Plug 'sjl/badwolf'
Plug 'icymind/NeoSolarized'
Plug 'lifepillar/vim-solarized8'
Plug 'crusoexia/vim-monokai'
Plug 'nanotech/jellybeans.vim'
Plug 'nightsense/vimspectr'
Plug 'joshdick/onedark.vim'
Plug 'rakr/vim-one'
Plug 'nightsense/shoji'
Plug 'ayu-theme/ayu-vim'
Plug 'sonph/onehalf', { 'rtp': 'vim' }
Plug 'chrisduerr/vim-undead'

" Plug 'ryanoasis/vim-devicons' " Slows down rendering Add icons need a nerd icon installed
" Plug 'flazz/vim-colorschemes' " use themes direct from git instead

call plug#end()

" BACKUP
" set backupcopy=yes " fixes npm noticing the build changes

" SET THEME
set termguicolors
set background=dark
let ayucolor="dark"
try
  " color Tomorrow-Night-Eighties
  " color Tomorrow-Night
  " colorscheme NeoSolarized
  " colorscheme solarized8
  " colorscheme solarized8_flat
  " colorscheme monokai
  " colorscheme gruvbox
  colorscheme onedark
  " colorscheme badwolf
  " colorscheme jellybeans
  " colorscheme onedark
  " colorscheme shoji_niji
  " colorscheme onehalflight
  " colorscheme ayu
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
set shiftwidth=2                " indent default of 2
set softtabstop=-1              " -1 - use shiftwidth for tab
set tabstop=2                   " make \t 2 spaces

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

" languageClient_neovim
" nnoremap <silent> <Leader>a :call LanguageClient#textDocument_codeAction()<CR>
" nnoremap <silent> <Leader>gd :call LanguageClient#textDocument_definition()<CR>
" nnoremap <silent> <Leader>gi :call LanguageClient#textDocument_implementation()<CR>
" nnoremap <silent> <Leader>gr :call LanguageClient_textDocument_references()<CR>
" nnoremap <silent> <Leader>h :call LanguageClient#textDocument_hover()<CR>
" nnoremap <silent> <Leader>rn :call LanguageClient#textDocument_rename()<CR>

nnoremap <silent> <Leader>p :call fzf#run({
      \   'source': "(ag -l -g '')",
      \   'sink': 'e',
      \   'down': '40%'})<CR>

" PLUGINS
"
" NCM2
" autocmd BufEnter * call ncm2#enable_for_buffer()
" set completeopt=noinsert,menuone,noselect
" inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
" inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" DEOPLETE CONFIG
" let g:deoplete#enable_at_startup = 1
" call deoplete#custom#option({
"       \ 'max_list': 15,
"       \ 'auto_complete_delay': 200,
"       \ 'smart_case': v:true,
"       \ 'ignore_case': v:true,
"       \ })

" SUPERTAB
let g:SuperTabDefaultCompletionType = "<c-n>"

" JSX/REACT
let g:jsx_ext_required = 0

" PYTHON3
" let g:python3_host_prog = 'python3'

" DART
" let dart_format_on_save = 1
" let dart_style_guide = 2

" NERD COMMENTER
let g:NERDSpaceDelims = 1
let g:NERDDefaultAlign = 'left'

" LANGUAGE CLIENT SERVER
" let g:LanguageClient_autoStart = 1 " Automatically start language servers.
" let g:LanguageClient_serverCommands = {
"     \ 'reason': ['ocaml-language-server', '--stdio'],
"     \ 'ocaml': ['ocaml-language-server', '--stdio'],
"     \ 'javascript': ['javascript-typescript-stdio'],
"     \ 'javascript.jsx': ['javascript-typescript-stdio'],
"     \ 'ruby': ['solargraph', 'stdio'],
"     \ 'dart': ['dart_language_server'],
"     \ }

" let g:LanguageClient_useFloatingHover = 1
" let g:LanguageClient_useVirtualText = 0
" let g:LanguageClient_hoverPreview = "Auto"
" let g:LanguageClient_completionPreferTextEdit = 1

" let g:neoformat_enabled_dart = ['dartfmt']
" augroup fmt
"   autocmd!
"   autocmd BufWritePre * undojoin | Neoformat
" augroup END

" ALE
let g:ale_lint_on_save = 1 " is default just to make it explicit
let g:ale_lint_on_text_changed = 'never' " seems slow editor down when typing
let g:ale_ruby_rubocop_executable = 'bundle'
let g:ale_cache_executable_check_failures = 0 " cache checks
let g:ale_completion_enabled = 0
let g:ale_linters = {
    \ 'dart': ['dart_language_server'],
    \ }
let g:ale_dart_dartfmt_options = '-l 120'
let g:ale_fix_on_save = 1
let g:ale_fixers = {
    \ 'go': ['gofmt'],
    \ 'reason': ['refmt'],
    \ 'javascript': ['eslint', 'prettier'],
    \ 'ruby': ['rubocop'],
    \ 'css': ['prettier'],
    \ 'dart': ['dartfmt'],
    \ }
