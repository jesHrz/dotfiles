local builtin = require('telescope.builtin')
local actions = require('telescope.actions')

vim.keymap.set('n', '<leader>hf', builtin.find_files, {})
vim.keymap.set('n', '<leader>hg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>hb', builtin.buffers, {})
vim.keymap.set('n', '<leader>hh', builtin.help_tags, {})

require('telescope').setup{
  defaults = {
    mappings = {
      i = {
        ["esc"] = actions.close
      }
    }
  },
  layout_config = {
    horizontal = {
      preview_cutoff = 100,
      preview_width = 0.6
    }
  },
}
