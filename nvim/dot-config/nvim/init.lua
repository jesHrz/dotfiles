-- This file simply bootstraps the installation of Lazy.nvim and then calls other files for execution
-- This file doesn't necessarily need to be touched, BE CAUTIOUS editing this file and proceed at your own risk.
local lazypath = vim.env.LAZY or vim.fn.stdpath "data" .. "/lazy/lazy.nvim"
if not (vim.env.LAZY or (vim.uv or vim.loop).fs_stat(lazypath)) then
  -- stylua: ignore
  vim.fn.system({ "git", "clone", "--filter=blob:none", "https://github.com/folke/lazy.nvim.git", "--branch=stable", lazypath })
end
vim.opt.rtp:prepend(lazypath)

-- validate that lazy is available
if not pcall(require, "lazy") then
  vim.print(vim.g.neovide_version)
  -- stylua: ignore
  vim.api.nvim_echo({ { ("Unable to load lazy from: %s\n"):format(lazypath), "ErrorMsg" }, { "Press any key to exit...", "MoreMsg" } }, true, {})
  vim.fn.getchar()
  vim.cmd.quit()
end

require "lazy_setup"
require "polish"

if vim.g.neovide then
  -- 设置 Neovide 的全局字体
  vim.o.guifont = "JetBrainsMono Nerd Font:h12"

  -- 强制重绘
  vim.g.neovide_no_idle = true

  -- 退出时确认
  vim.g.neovide_confirm_quit = true

  -- 退出时脱离连接
  vim.g.neovide_detach_on_quit = 'always_quit'

  -- 启用 IME 输入
  vim.g.neovide_input_ime = true
end
