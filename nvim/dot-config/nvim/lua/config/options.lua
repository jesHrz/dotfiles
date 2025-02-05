-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- Disable auto format
vim.g.autoformat = false

-- Disable all snacks animations
vim.g.snacks_animate = false

vim.g.lazyvim_picker = "telescope"

-- 设置 visual 模式下选中的背景高亮色
vim.cmd("highlight Visual guibg=#135564")
-- 设置光标的颜色默认为拉姆的发色
vim.cmd("highlight Cursor gui=NONE guifg=bg guibg=#ffb6c1")

local opt = vim.opt

opt.spell = false
opt.relativenumber = false
