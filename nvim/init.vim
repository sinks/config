syntax on

call plug#begin('~/.config/nvim/plugged')

Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'editorconfig/editorconfig-vim'
Plug 'mhinz/vim-grepper'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-fugitive'
Plug 'flazz/vim-colorschemes'
Plug 'benekastah/neomake'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'sheerun/vim-polyglot' " includes a lot of language plugins
Plug 'jaawerth/nrun.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'fatih/vim-go'
Plug 'dart-lang/dart-vim-plugin'
Plug 'elixir-lang/vim-elixir'
Plug 'Shougo/denite.nvim'
Plug 'autozimu/LanguageClient-neovim', { 'do': ':UpdateRemotePlugins' }

call plug#end()

" BACKUP
set backupcopy=yes " fixes npm noticing the build changes

" DEOPLETE CONFIG
let g:deoplete#enable_at_startup = 1
let g:deoplete#file#enable_buffer_path = 1

" JSX/REACT
let g:jsx_ext_required = 0

" NEOMAKE
autocmd! BufWritePost * Neomake
let enabled_js_linters = []
if filereadable(nrun#Which('standard', 0))
  call add(enabled_js_linters, 'standard')
  au BufEnter *.js let b:neomake_javascript_standard_exe = nrun#Which('standard', 0)
  au BufEnter *.jsx let b:neomake_javascript_standard_exe = nrun#Which('standard', 0)
endif

if filereadable(nrun#Which('eslint', 0))
  call add(enabled_js_linters, 'eslint')
  au BufEnter *.js let b:neomake_javascript_eslint_exe = nrun#Which('eslint', 0)
  au BufEnter *.jsx let b:neomake_javascript_eslint_exe = nrun#Which('eslint', 0)
endif

if filereadable(nrun#Which('flow', 0))
  call add(enabled_js_linters, 'flow')
  au BufEnter *.js let b:neomake_javascript_flow_exe = nrun#Which('flow', 0)
  au BufEnter *.jsx let b:neomake_javascript_flow_exe = nrun#Which('flow', 0)
endif

let g:neomake_javascript_enabled_makers = enabled_js_linters

let enabled_css_linters = []
if filereadable(nrun#Which('stylelint', 0))
  call add(enabled_css_linters, 'stylelint')
  au BufEnter *.css let b:neomake_css_stylelint_exe = nrun#Which('stylelint', 0)
endif

let g:neomake_css_enabled_makers = enabled_css_linters

" IF GUI RUNNING
if has("gui_running")
  set noanti
  set guifont=monaco:h13
endif

" SET THEME
set termguicolors
try
  "color Tomorrow-Night-Eighties
  "color Tomorrow-Night
  "color Solarized
  "color molokai
  "color wombat
  color gruvbox
  "color badwolf
catch
endtry

set background=dark

" GENERAL {
set showcmd
set ic
set inccommand=split " live substitute
" }

" INDENTING {
set tabstop=2
set shiftwidth=2
set softtabstop=2
set smartindent
set smarttab
set expandtab
set copyindent
" }

" REMAP
let mapleader = "\<Space>"
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
map <leader>n :NERDTreeFind<CR>           " map nerdtree to ctrl+n
" map <leader>p :CtrlP<CR>
map <leader>w :w<CR>
map <leader>f :Ag<CR>
nnoremap <silent> <Leader>p :call fzf#run({
      \   'source': "(git ls-files -oc --exclude-standard --full-name `git rev-parse --show-toplevel` \|\| ag -l -g '')",
      \   'sink': 'e',
      \   'down': '40%'})<CR>

map <leader><Tab> :b!#<CR>
map <leader>; <plug>NERDCommenterToggle<CR>
map <leader>/ :DeniteProjectDir grep<CR>
"map <leader>p :Denite menu -immediately-1 -mode=normal<CR>

"nnoremap <silent> <Leader>p :call denite#start([{
      "\   'name': 'menu/project', 'args': []
      "\ }])<CR>

" CLIPBOARD
set clipboard+=unnamedplus    " always use the clipboard

" PYTHON3
let g:python3_host_prog = 'python3'

" DENITE
call denite#custom#var('file_rec', 'command', ['ag', '--follow', '--nocolor', '--nogroup', '-g', ''])
call denite#custom#var('grep', 'command', ['ag'])
call denite#custom#var('grep', 'default_opts',
      \ ['-i', '--vimgrep'])
call denite#custom#var('grep', 'recursive_opts', [])
call denite#custom#var('grep', 'pattern_opt', [])
call denite#custom#var('grep', 'separator', ['--'])
call denite#custom#var('grep', 'final_opts', [])

let s:menus = {}
"let s:menus.command_candidates = [
      "\ ['p - project', 'Denite menu/project'],
      "\ ]

let s:menus.project = {'description': 'project'}
let s:menus.project.command_candidates = [
      \ ['f - find files in project', 'DeniteProjectDir file_rec'],
      \ ['d - find dir in project', 'DeniteProjectDir directory_rec'],
      \ ]
call denite#custom#var('menu', 'menus', s:menus)

let s:project_key_map = {
      \ 'f': 0, 'd': 1
      \ }


call denite#custom#alias('source', 'menu/project', 'menu')
call denite#custom#option('default', 'quick_move_table', s:project_key_map)
call denite#custom#var('menu/project', 'menus', s:menus)

" Commenter
let g:NERDSpaceDelims = 1

" LSP
let serverCommands = {}
if filereadable(nrun#Which('javascript-typescript-stdio'))
  let serverCommands['javascript'] = [nrun#Which('javascript-typescript-stdio')]
  let serverCommands['javascript.jsx'] = [nrun#Which('javascript-typescript-stdio')]
endif

let g:LanguageClient_serverCommands = serverCommands

" Automatically start language servers.
let g:LanguageClient_autoStart = 1

" RUBY
autocmd FileType ruby setlocal shiftwidth=2 tabstop=2
" JS
autocmd FileType javascript setlocal shiftwidth=2 tabstop=2
" COFFEE
autocmd FileType coffee setlocal shiftwidth=2 tabstop=2
" Strip trailing whitespace
autocmd FileType * autocmd BufWritePre <buffer> call StripTrailingWhitespace()
" Strip trailing blank lines
autocmd filetype c,cpp,java,go,php,javascript,perl,puppet,python,ruby,rust,twig,vim,xml,yml autocmd BufWritePre <buffer> call StripTrailingNewline()

" Save state and run cmd {
function! RunCmd(cmd)
  " Save the last search
  let last_search=@/
  " Save the current cursor position
  let save_cursor = getpos(".")
  " Save the window position
  normal H
  let save_window = getpos(".")
  call setpos('.', save_cursor)

  " Do the business:
  execute a:cmd

  " Restore the last_search
  let @/=last_search
  " Restore the window position
  call setpos('.', save_window)
  normal zt
  " Restore the cursor position
  call setpos('.', save_cursor)
endfunction
" }

" Strip whitespace {
function! StripTrailingWhitespace()
  if &modifiable
    call RunCmd('silent %s/\s\+$//e')
  endif
endfunction
" }

" Strip trailing newline {
function! StripTrailingNewline()
  if &modifiable
    call RunCmd('%s/\($\n\s*\)\+\%$//e')
  endif
endfunction
" }
