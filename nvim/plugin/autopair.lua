local disable_filetype = {"TelescopePrompt"}
local ignored_next_char = string.gsub([[ [%w%%%'%[%"%.] ]], "%s+", "")
local enable_moveright = true
local enable_afterquote = true -- add bracket pairs after quote
local enable_check_bracket_line = true --- check bracket in same line
local check_ts = false

require('nvim-autopairs').setup {fast_wrap = {}}

-- If you want insert `(` after select function or method item
-- local cmp_autopairs = require('nvim-autopairs.completion.cmp')
-- local cmp = require('cmp')
-- cmp.event:on('confirm_done',
--     cmp_autopairs.on_confirm_done({map_char = {tex = ''}}))
