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
  vim.g.mapleader = " "
  vim.g.maplocalleader = " "

  map("n", "<leader>q", "<Cmd>q<CR>")
  map("n", "<leader>w", "<Cmd>w<CR>")

  -- split windows
  map("n", "sv", ":vsp<CR>")
  map("n", "sh", ":sp<CR>")

  -- close current
  map("n", "sc", "<C-w>c")

  -- close other
  map("n", "so", "<C-w>o")

  -- jump between windows
  map("n", "f", "<C-w>w")
  map("n", "<leader>sh", "<C-w>h")
  map("n", "<leader>sj", "<C-w>j")
  map("n", "<leader>sk", "<C-w>k")
  map("n", "<leader>sl", "<C-w>l")

  -- I dont know why my `J` will delete the newline, so I disable it
  map("n", "J", "<Nop>")
  map("n", "<C-j>", "<Nop>")

  -- Terminal
  map("n", "<leader>t", ":sp | terminal<CR>")
  map("n", "<leader>vt", ":vsp | terminal<CR>")
  map("t", "<Esc>", "<C-\\><C-n>")
  map("t", "<leader>sh", [[ <C-\><C-N><C-w>h ]])
  map("t", "<leader>sj", [[ <C-\><C-N><C-w>j ]])
  map("t", "<leader>sk", [[ <C-\><C-N><C-w>k ]])
  map("t", "<leader>sl", [[ <C-\><C-N><C-w>l ]])

  -- indent in Visual mode
  map("v", "<", "<gv")
  map("v", ">", ">gv")

  -- Visual Block --
  -- move selected texts
  map("x", "<C-j>", ":move '>+1<CR>gv-gv")
  map("x", "<C-k>", ":move '<-2<CR>gv-gv")

  -- ctrl u / ctrl + d only scroll 9 lines
  map("n", "<C-u>", "9k")
  map("n", "<C-d>", "9j")

  -- open VIMRC
  map("n", "<leader><leader>v", ":tabe $MYVIMRC<CR>")

  -- escape in Insert mode
  map("i", "jj", "<Esc>")

  -- left/right scaling
  map("n", "<leader>s<left>", ":vertical resize -2<cr>")
  map("n", "<leader>s<right>", ":vertical resize +2<cr>")
  -- up/down scaling
  map("n", "<leader>s<Down>", ":resize +2<CR>")
  map("n", "<leader>s<Up>", ":resize -2<CR>")

  -- sudo on files that require root permission
  map("c", "w!!", "execute 'silent! write !sudo tee % > /dev/null' <bar> edit!")
end

_g.global_setting()
return _g
