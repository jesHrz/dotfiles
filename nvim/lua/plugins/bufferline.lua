local status, bufferline = pcall(require, "bufferline")

if not status then
  vim.notify("plugin bufferline not found")
end

local map = require("keymaps").map

map("n", "<leader>1", "<Cmd>BufferLineGoToBuffer 1<CR>")
map("n", "<leader>2", "<Cmd>BufferLineGoToBuffer 2<CR>")
map("n", "<leader>3", "<Cmd>BufferLineGoToBuffer 3<CR>")
map("n", "<leader>4", "<Cmd>BufferLineGoToBuffer 4<CR>")
map("n", "<leader>5", "<Cmd>BufferLineGoToBuffer 5<CR>")
map("n", "<leader>6", "<Cmd>BufferLineGoToBuffer 6<CR>")
map("n", "<leader>7", "<Cmd>BufferLineGoToBuffer 7<CR>")
map("n", "<leader>8", "<Cmd>BufferLineGoToBuffer 8<CR>")
map("n", "<leader>9", "<Cmd>BufferLineGoToBuffer 9<CR>")

-- buffer switch
map("n", "b[", ":BufferLineCyclePrev<CR>")
map("n", "b]", ":BufferLineCycleNext<CR>")

-- buffer close
map("n", "<leader>bw", ":Bdelete!<CR>")
map("n", "<leader>bl", ":BufferLineCloseLeft<CR>")
map("n", "<leader>br", ":BufferLineCloseRight<CR>")
map("n", "<leader>bc", ":BufferLinePickClose<CR>")

bufferline.setup({
  options = {
    -- 关闭 Tab 的命令，这里使用 moll/vim-bbye 的 :Bdelete 命令
    close_command = "Bdelete! %d",
    right_mouse_command = "Bdelete! %d",
    -- 侧边栏配置
    -- 左侧让出 nvim-tree 的位置，显示文字 File Explorer
    offsets = {
      {
        filetype = "NvimTree",
        text = "File Explorer",
        highlight = "Directory",
        text_align = "left",
      },
    },
    -- 使用 nvim 内置 LSP  后续课程会配置
    diagnostics = "nvim_lsp",
    -- 可选，显示 LSP 报错图标
    ---@diagnostic disable-next-line: unused-local
    diagnostics_indicator = function(count, level, diagnostics_dict, context)
      local s = " "
      for e, n in pairs(diagnostics_dict) do
        local sym = e == "error" and " " or (e == "warning" and " " or "")
        s = s .. n .. sym
      end
      return s
    end,
  },
})
