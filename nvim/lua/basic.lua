-- utf-8
vim.scriptencoding = "utf-8"
vim.opt.encoding = "utf-8"
vim.opt.fileencoding = "utf-8"

-- relative line number
vim.opt.number = true
vim.opt.relativenumber = true

-- show signcolumn on the left of line number
vim.opt.signcolumn = "yes"

-- tab size
vim.opt.tabstop = 2
vim.bo.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.smarttab = true
vim.opt.showtabline = 2
vim.opt.shiftround = true

-- >> << move step
vim.opt.shiftwidth = 2
vim.bo.shiftwidth = 2

-- indent using space
vim.opt.expandtab = true
vim.bo.expandtab = true

-- new line aligned
vim.opt.autoindent = true
vim.bo.autoindent = true
vim.opt.smartindent = true

-- search is case-intensive
-- unless the contents contain uppercase
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- no highlight when searching
vim.opt.hlsearch = false

-- do searching after finishing input
vim.opt.incsearch = true

-- cmd line height
vim.opt.cmdheight = 2

-- auto load file when external change occurs
vim.opt.autoread = true
vim.bo.autoread = true

-- disable backup
vim.opt.backup = false
vim.opt.swapfile = false
vim.opt.writebackup = false

-- undo
vim.opt.undodir = os.getenv("HOME") .. "/.nvim/undodir/"
vim.opt.undofile = true

-- mouse support
vim.opt.mouse = "a"

-- disable line wrapping
vim.opt.wrap = false
vim.cmd "set whichwrap+=<,>,[,]"
vim.cmd [[set iskeyword+=-]]

-- smaller update time (for swapfile flush and CursorHold cmd)
vim.opt.updatetime = 300

-- smaller timeout to determine key code sequence
vim.opt.timeoutlen = 300

-- show split windows from below and right
vim.opt.splitbelow = true
vim.opt.splitright = true

-- auto complete
vim.opt.wildmenu = true
vim.opt.completeopt = "menu,menuone,noinsert,noselect"
vim.opt.conceallevel = 0
vim.opt.pumheight = 10

-- disable default status bar
vim.opt.showmode = false

-- show invisible char
vim.opt.list = true

-- Dont' pass messages to |ins-completin menu|
vim.opt.shortmess:append "atIc"

-- clipboard
vim.o.go="a"
vim.opt.clipboard="unnamedplus"

-- disable comment continuation for new lines
vim.cmd("autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o")
