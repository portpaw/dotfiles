local api = vim.api
local cmd = vim.cmd
local fn = vim.fn
local g = vim.g
local keymap = vim.keymap
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
	use {
		'phaazon/hop.nvim',
		branch = 'v2',
		config = function()
			require'hop'.setup {}
		end
	}
	use {
		'nvim-treesitter/nvim-treesitter',
		run = function() require('nvim-treesitter.install').update({ with_sync = true }) end,
	}

	if packer_bootstrap then
		require('packer').sync()
	end
end)

-- leader key
g.mapleader = ' '
g.maplocalleader = ','

-- enable Tokyo Night theme
cmd 'colorscheme tokyonight'

-- Source Code Pro at 18pt
opt.guifont = { "Source Code Pro for Powerline", ":h18" }

-- truecolor support
opt.termguicolors = true

-- enable mouse support in normal and visual modes
opt.mouse = 'nv'

-- reload files if they're changed outside of vim
opt.autoread = true

-- show matching braces
opt.showmatch = true

-- case-insensitive searching (unless the search term has a capital letter)
opt.ignorecase = true
opt.smartcase = true

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

-- highlight current line
opt.cursorline = true

-- always show 5 lines of context when scrolling
opt.scrolloff = 5

-- menu auto-completion
opt.wildmenu = true
opt.wildmode = {'list', 'longest'}

-- invisible character representations
opt.list = true
opt.listchars = { tab = '▸ ', trail = '·' }

-- more natural window splitting
opt.splitbelow = true
opt.splitright = true

-- centralize temp directories
opt.backupdir = '~/.local/share/nvim/backup//'
opt.directory = '~/.local/share/nvim/swap//'
opt.undodir = '~/.local/share/nvim/undo//'

-- increase the undo limit
opt.history = 1000

-- set window title to current file
opt.title = true

-- enter command mode without holding shift
keymap.set({ 'n', 'x' }, ';', ':')

-- copy + paste from system clipboard
keymap.set({ 'n', 'x' }, '<d-c>', '"+y')
keymap.set({ 'n', 'x' }, '<d-v>', ':set paste<cr>"+p:set nopaste<cr>')
keymap.set({ 'i', 'c' }, '<d-v>', '<c-r><c-o>+')

-- line start/end navigation with cmd keys
keymap.set({ 'n', 'x' }, '<d-left>', '0')
keymap.set({ 'n', 'x' }, '<d-right>', '$')
keymap.set('c', '<d-left>', '<home>')
keymap.set('c', '<d-right>', '<end>')

-- hop.nvim navigation
keymap.set({ 'n', 'x' }, '<leader>f', ':HopChar1<cr>')
keymap.set({ 'n', 'x' }, 'f', "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR, current_line_only = true })<cr>")
keymap.set({ 'n', 'x' }, 'F', "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, current_line_only = true })<cr>")
keymap.set({ 'n', 'x' }, 't', "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR, current_line_only = true, hint_offset = -1 })<cr>")
keymap.set({ 'n', 'x' }, 'T', "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, current_line_only = true, hint_offset = 1 })<cr>")
