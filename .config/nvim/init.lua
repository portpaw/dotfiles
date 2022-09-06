local cmd = vim.cmd
local fn = vim.fn
local g = vim.g
local opt = vim.opt

local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
	packer_bootstrap = fn.system({
		'git',
		'clone',
		'--depth', '1',
		'https://github.com/wbthomason/packer.nvim',
		install_path
	})
end

require('packer').startup(function(use)
	use 'wbthomason/packer.nvim'
	use 'folke/tokyonight.nvim'

	if packer_bootstrap then
		require('packer').sync()
	end
end)

-- enable Tokyo Night theme
cmd[[colorscheme tokyonight]]

-- leader keys
g.mapleader = [[ ]]
g.maplocalleader = [[,]]

-- reload files if they're changed outside of vim
opt.autoread = true

-- show matching braces
opt.showmatch = true

-- case-insensitive searching
opt.ignorecase = true

-- incremental searching
opt.incsearch = true

-- highlight search results
opt.hlsearch = true

-- tabs are actual tab characters that appear as 2 spaces
opt.expandtab = false
opt.tabstop = 2
opt.shiftwidth = 2
opt.softtabstop = 0

-- automatically indent new lines
opt.smartindent = true

-- disable line wrapping
opt.wrap = false

-- show line numbers
opt.number = true

-- always show 5 lines of context when scrolling
opt.scrolloff = 5

-- menu auto-completion
opt.wildmenu = true
opt.wildmode = {'list', 'longest'}

-- invisible character representations
opt.list = true
opt.listchars = { tab = '▸ ', trail = '·' }

-- enable mouse support
opt.mouse = 'nv' 

-- highlight current line
opt.cursorline = true

-- faster scrolling
opt.ttyfast = true

-- more natural window splitting
opt.splitbelow = true
opt.splitright = true

-- centralize temp directories
opt.backupdir = '~/.local/share/nvim/backup//'
opt.directory = '~/.local/share/nvim/swap//'
opt.undodir = '~/.local/share/nvim/undo//'
