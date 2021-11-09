local cmd = vim.cmd  -- to execute Vim commands e.g. cmd('pwd')
local fn = vim.fn    -- to call Vim functions e.g. fn.bufnr()
local opt = vim.opt    -- to set options

vim.g.mapleader = " " 

require('plugins')

opt.clipboard = "unnamedplus"
opt.completeopt = "menuone,noselect"
opt.inccommand = "split"
opt.wildmode = {'list', 'longest'}

-- Load local .nvimrc files
opt.exrc = true

-- Seach
opt.smartcase = true
opt.ignorecase = true

-- Tab and Indent
opt.expandtab = true
opt.tabstop = 2
opt.shiftwidth = 2
opt.softtabstop = 2
opt.smartindent = true
opt.shiftround = true
opt.autoindent = true

-- Theme
opt.termguicolors = true
opt.background = "light"
cmd "colorscheme rosebones"

require'nvim-web-devicons'.setup {
	default = true
}

require('treesitter')
require('lsp')
require('finding')
require('fixers')
require('keybindings')
require('completion')
require('comments')

require('lualine').setup {
	options = {
		theme = "solarized_light"
	}
}

local local_vimrc = vim.fn.getcwd()..'/.nvimrc'
if vim.loop.fs_stat(local_vimrc) then
  vim.cmd('source '..local_vimrc)
end

