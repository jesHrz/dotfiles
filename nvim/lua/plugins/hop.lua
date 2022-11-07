local hop = require('hop')
local directions = require('hop.hint').HintDirection

hop.setup({
  quit_key = '<ESC>',
  current_line_only = false,
})

-- ISSUE
-- when trying to nevigate from a empty line
-- https://github.com/phaazon/hop.nvim/issues/335

vim.keymap.set('', '<leader><leader>f', function()
  hop.hint_char1({ direction = directions.AFTER_CURSOR, current_line_only = false })
end, { remap=true })

vim.keymap.set('', '<leader><leader>F', function()
  hop.hint_char1({ direction = directions.BEFORE_CURSOR, current_line_only = false })
end, { remap=true })

vim.keymap.set('', '<leader><leader>s', function()
  hop.hint_char1({ current_line_only = false })
end, { remap=true })

vim.keymap.set('', '<leader><leader>w', function()
  hop.hint_words({ direction = directions.AFTER_CURSOR, current_line_only = false })
end, { remap=true })

vim.keymap.set('', '<leader><leader>b', function()
  hop.hint_words({ direction = directions.BEFORE_CURSOR, current_line_only = false })
end, { remap=true })
