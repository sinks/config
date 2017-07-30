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
map <leader>n :NERDTreeToggle<CR>           " map nerdtree to ctrl+n
" map <leader>p :CtrlP<CR>
map <leader>w :w<CR>
map <leader>f :Ag<CR>
nnoremap <silent> <Leader>p :call fzf#run({
      \   'source': "(git ls-files -oc --exclude-standard --full-name `git rev-parse --show-toplevel` \|\| ag -l -g '')",
      \   'sink': 'e',
      \   'down': '40%'})<CR>

" CLIPBOARD
set clipboard+=unnamedplus    " always use the clipboard

" PYTHON3
let g:python3_host_prog = 'python3'

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
