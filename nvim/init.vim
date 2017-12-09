call plug#begin('~/.config/nvim/plugged')

" Tools
Plug 'editorconfig/editorconfig-vim'
Plug 'scrooloose/nerdcommenter'
Plug 'tpope/vim-fugitive'

" Code help
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'w0rp/ale'
Plug 'autozimu/LanguageClient-neovim', { 'do': ':UpdateRemotePlugins' }

" Searching/Navigation
Plug 'scrooloose/nerdtree'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
" Plug 'mhinz/vim-grepper'

" Testing
Plug 'Shougo/denite.nvim'

" Airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Themes
Plug 'morhetz/gruvbox'
Plug 'sjl/badwolf'
Plug 'icymind/NeoSolarized'
Plug 'lifepillar/vim-solarized8'
Plug 'crusoexia/vim-monokai'
Plug 'nanotech/jellybeans.vim'
Plug 'nightsense/vimspectr'
" Plug 'flazz/vim-colorschemes' " use themes direct from git instead

" Languages
Plug 'fatih/vim-go'
Plug 'dart-lang/dart-vim-plugin'
Plug 'elixir-lang/vim-elixir'
Plug 'pangloss/vim-javascript'
Plug 'vim-ruby/vim-ruby'
Plug 'mxw/vim-jsx'
" Plug 'sheerun/vim-polyglot' " includes a lot of language plugins

call plug#end()

" BACKUP
set backupcopy=yes " fixes npm noticing the build changes

" SET THEME
set termguicolors
set background=dark
try
  "color Tomorrow-Night-Eighties
  "color Tomorrow-Night
  "colorscheme NeoSolarized
  "colorscheme solarized8
  "colorscheme monokai
  "colorscheme gruvbox
  colorscheme badwolf
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
map <leader>n :NERDTreeFind<CR>           " map nerdtree to ctrl+n
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

" PLUGINS
" DEOPLETE CONFIG
let g:deoplete#enable_at_startup = 1
let g:deoplete#file#enable_buffer_path = 1

" JSX/REACT
let g:jsx_ext_required = 0

" IF GUI RUNNING
if has("gui_running")
  set noanti
  set guifont=monaco:h13
endif

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

" Language Client Server
let g:LanguageClient_autoStart = 1 " Automatically start language servers.

" Strip trailing whitespace
augroup AutoStripBlank
  autocmd FileType * autocmd BufWritePre <buffer> call StripTrailingWhitespace()
  " Strip trailing blank lines
  autocmd FileType c,cpp,java,go,php,javascript,perl,puppet,python,ruby,rust,twig,vim,xml,yml autocmd BufWritePre <buffer> call StripTrailingNewline()
augroup END

" pomodoro setup
let g:PomodoroStart = ":vsplit term:////$GOPATH\/bin\/pomodoro 25 && notify-send 'take a break'"
let g:PomodoroBreak = ":vsplit term:////$GOPATH\/bin\/pomodoro 5 && notify-send 'get back to work'"
let g:PomodoroLBreak = ":vsplit term:////$GOPATH\/bin\/pomodoro 15 && notify-send 'get back to work'"
function! StartPomodoro() abort
  call RunCmd(g:PomodoroStart)
endfunction

command PomStart call RunCmd(g:PomodoroStart)
command PomBreak call RunCmd(g:PomodoroBreak)
command PomLBreak call RunCmd(g:PomodoroLBreak)

" Save state and run cmd {
function! RunCmd(cmd) abort
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
