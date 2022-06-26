-- map("mode", "key", "mapping", "options")
local function map(mode, key, mapping)
  local opt = {
    noremap = true,
    silent = true,
  }
  vim.api.nvim_set_keymap(mode, key, mapping, opt)
end

local function mapbuf(bufnr, mode, key, mapping)
  local opt = {
    noremap = true,
    silent = true,
  }
  vim.api.nvim_buf_set_keymap(bufnr, mode, key, mapping, opt)
end

local _g = {}
_g.map = map
_g.mapbuf = mapbuf

_g.global_setting = function()
  -- set leader key: <leader> = ','
  map("", "<Space>", "<Nop>")
  vim.g.mapleader = " "
  vim.g.maplocalleader = " "

  -- split windows
  map("n", "sv", ":vsp<CR>")
  map("n", "sh", ":sp<CR>")

  -- close current
  map("n", "sc", "<C-w>c")

  -- close other
  map("n", "so", "<C-w>o")

  -- jump between windows
  map("n", "<C-h>", "<C-w>h")
  map("n", "<C-j>", "<C-w>j")
  map("n", "<C-k>", "<C-w>k")
  map("n", "<C-l>", "<C-w>l")

  -- Terminal
  map("n", "<leader>t", ":sp | terminal<CR>")
  map("n", "<leader>vt", ":vsp | terminal<CR>")
  map("t", "<Esc>", "<C-\\><C-n>")
  map("t", "<C-h>", [[ <C-\><C-N><C-w>h ]])
  map("t", "<C-j>", [[ <C-\><C-N><C-w>j ]])
  map("t", "<C-k>", [[ <C-\><C-N><C-w>k ]])
  map("t", "<C-l>", [[ <C-\><C-N><C-w>l ]])

  -- indent in Visual mode
  map("v", "<", "<gv")
  map("v", ">", ">gv")

  -- Move text up and down
  map("v", "<A-j>", ":m .+1<CR>==")
  map("v", "<A-k>", ":m .-1<CR>==")
  map("v", "p", "_dP")

  -- Visual Block --
  -- move selected texts
  map("x", "J", ":move '>+1<CR>gv-gv")
  map("x", "K", ":move '<-2<CR>gv-gv")
  map("x", "<A-j>", ":move '>+1<CR>gv-gv")
  map("x", "<A-k>", ":move '<-2<CR>gv-gv")

  -- ctrl u / ctrl + d only scroll 9 lines
  map("n", "<C-u>", "9k")
  map("n", "<C-d>", "9j")

  -- open VIMRC
  map("n", "<leader><leader>v", ":tabe $MYVIMRC<CR>")

  -- escape in Insert mode
  map("i", "jj", "<Esc>")

  -- clipboard
  map("v", "<leader>y", "\"+y")
  map("n", "<leader>Y", "\"+yg_")
  map("n", "<leader>y", "\"+y")
  map("n", "<leader>yy", "\"+yy")
  map("n", "<leader>y", "\"+p")
  map("n", "<leader>y", "\"+P")
  map("v", "<leader>p", "\"+p")
  map("v", "<leader>P", "\"+P")

  -- left/right scaling
  map("n", "<A-Left>", ":vertical resize -2<CR>")
  map("n", "<A-Right>", ":vertical resize +2<CR>")
  -- up/down scaling
  map("n", "<A-Down>", ":resize +2<CR>")
  map("n", "<A-Up>", ":resize -2<CR>")

  -- sudo on files that require root permission
  map("c", "w!!", "execute 'silent! write !sudo tee % > /dev/null' <bar> edit!")
end

_g.global_setting()
return _g
