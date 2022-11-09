local hop = require('hop')
local directions = require('hop.hint').HintDirection

hop.setup({
  quit_key = '<ESC>',
  current_line_only = false,
})

-- ISSUE
-- when trying to nevigate from a empty line
-- https://github.com/phaazon/hop.nvim/issues/335
-- A temporary solution
local function hop_func(func, dir)
  return function ()
    local opts = { direction = dir }
    vim.cmd('.g/^$/normal )')
    func(opts)
  end
end

vim.keymap.set('', '<leader><leader>f', hop_func(hop.hint_char1, directions.AFTER_CURSOR), { remap=true })
vim.keymap.set('', '<leader><leader>F', hop_func(hop.hint_char1, directions.BEFORE_CURSOR), { remap=true })
vim.keymap.set('', '<leader><leader>w', hop_func(hop.hint_words, directions.AFTER_CURSOR), { remap=true })
vim.keymap.set('', '<leader><leader>b', hop_func(hop.hint_words, directions.BEFORE_CURSOR), { remap=true })
vim.keymap.set('', '<leader><leader>s', hop.hint_char1, { remap=true })
