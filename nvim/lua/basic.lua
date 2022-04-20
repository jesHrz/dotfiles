-- utf-8
vim.g.encoding = "utf-8"
vim.o.fileencoding = "utf-8"

-- relative line number
vim.wo.number = true
vim.wo.relativenumber = true

-- highlight current line
vim.wo.cursorline = true

-- show signcolumn on the left of line number
vim.wo.signcolumn = "yes"

-- tab size
vim.o.tabstop = 4
vim.bo.tabstop = 4
vim.o.softtabstop = 4
vim.o.shiftwidth = 4
vim.o.smarttab = true
vim.o.showtabline = 2
vim.o.shiftround = true

-- >> << move step
vim.o.shiftwidth = 2
vim.bo.shiftwidth = 2

-- indent using space
vim.o.expandtab = true
vim.bo.expandtab = true

-- new line aligned
vim.o.autoindent = true
vim.bo.autoindent = true
vim.o.smartindent = true

-- search is case-intensive 
-- unless the contents contain uppercase
vim.o.ignorecase = true
vim.o.smartcase = true

-- no highlight when searching
vim.o.hlsearch = false

-- do searching after finishing input
vim.o.incsearch = true

-- cmd line height
vim.o.cmdheight = 2

-- auto load file when external change occurs
vim.o.autoread = true
vim.bo.autoread = true

-- disable backup
vim.o.backup = false
vim.o.swapfile = false
vim.o.writebackup = false

-- undo
vim.o.undodir = os.getenv("HOME") .. "/.nvim/undodir/"
vim.o.undofile = true

-- mouse support
vim.o.mouse = "a"

-- disable line wrapping
vim.wo.wrap = false
vim.o.whichwrap = "<,>,[,]"

-- smaller update time (for swapfile flush and CursorHold cmd) 
vim.o.updatetime = 300

-- smaller timeout to determine key code sequence
vim.o.timeoutlen = 500

-- show split windows from below and right
vim.o.splitbelow = true
vim.o.splitright = true

-- auto complete
vim.o.wildmenu = true
vim.o.completeopt = "menu,menuone,noselect,noinsert"
vim.o.pumheight = 10

-- disable default status bar
vim.o.showmode = false

-- show invisible char
vim.o.list = true

-- colorscheme
-- vim.o.background = "light"
vim.o.background = "dark"
vim.o.termguicolors = true
vim.opt.termguicolors = true

-- Dont' pass messages to |ins-completin menu|
vim.o.shortmess = vim.o.shortmess .. 'c'

-- clipboard
vim.o.go="a"
vim.o.clipboard="unnamedplus"
