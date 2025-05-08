return {
  "saghen/blink.cmp",
  opts = {
    snippets = {
      expand = function(snippet, _)
        return LazyVim.cmp.expand(snippet)
      end,
    },
    appearance = {
      -- sets the fallback highlight groups to nvim-cmp's highlight groups
      -- useful for when your theme doesn't support blink.cmp
      -- will be removed in a future release, assuming themes add support
      use_nvim_cmp_as_default = false,
      -- set to 'mono' for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
      -- adjusts spacing to ensure icons are aligned
      nerd_font_variant = "mono",
    },
    completion = {
      list = {
        selection = {
          preselect = function(ctx)
            return not require("blink.cmp").snippet_active({ direction = 1 })
          end,
        },
      },
      accept = {
        -- experimental auto-brackets support
        auto_brackets = {
          enabled = true,
        },
      },
      menu = {
        draw = {
          treesitter = { "lsp" },
        },
      },
      documentation = {
        auto_show = true,
        auto_show_delay_ms = 200,
      },
      ghost_text = {
        enabled = false, -- vim.g.ai_cmp,
      },
    },

    -- experimental signature help support
    signature = { enabled = true },

    sources = {
      -- adding any nvim-cmp sources here will enable them
      -- with blink.compat
      compat = {},
      default = { "lsp", "path", "snippets", "buffer" },
    },

    cmdline = {
      enabled = true,
      -- use 'inherit' to inherit mappings from top level `keymap` config
      keymap = { preset = "cmdline" },
      sources = function()
        local type = vim.fn.getcmdtype()
        -- Search forward and backward
        if type == "/" or type == "?" then
          return { "buffer" }
        end
        -- Commands
        if type == ":" or type == "@" then
          return { "cmdline" }
        end
        return {}
      end,
      completion = {
        trigger = {
          show_on_blocked_trigger_characters = {},
          show_on_x_blocked_trigger_characters = {},
        },
        list = {
          selection = {
            -- When `true`, will automatically select the first item in the completion list
            preselect = true,
            -- When `true`, inserts the completion item automatically when selecting it
            auto_insert = true,
          },
        },
        -- Whether to automatically show the window when new completion items are available
        menu = { auto_show = false },
        -- Displays a preview of the selected item on the current line
        ghost_text = { enabled = true },
      },
    },

    keymap = {
      preset = "super-tab",
      ["<C-y>"] = { "select_and_accept" },
    },
  },
}

-- local function has_words_before()
--   local line, col = (unpack or table.unpack)(vim.api.nvim_win_get_cursor(0))
--   return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
-- end
--
-- return {
--   "hrsh7th/nvim-cmp",
--   version = false, -- last release is way too old
--   event = { "InsertEnter", "CmdlineEnter" },
--   dependencies = {
--     { "hrsh7th/cmp-nvim-lsp", lazy = true },
--     { "hrsh7th/cmp-buffer", lazy = true },
--     { "hrsh7th/cmp-path", lazy = true },
--   },
--   opts_extend = { "sources" },
--   opts = function()
--     local cmp = require("cmp")
--     local defaults = require("cmp.config.default")()
--     local auto_select = false
--     return {
--       auto_brackets = {}, -- configure any filetype to auto add brackets
--       completion = {
--         completeopt = "menu,menuone,noinsert" .. (auto_select and "" or ",noselect"),
--       },
--       preselect = (auto_select and cmp.PreselectMode.Item) or cmp.PreselectMode.None,
--       mapping = {
--         ["<Up>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }),
--         ["<Down>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }),
--         ["<C-Y>"] = cmp.config.disable,
--         ["<C-E>"] = cmp.abort,
--         ["<C-Space>"] = cmp.mapping(function()
--           if cmp.visible() then
--             cmp.close()
--           else
--             cmp.complete()
--           end
--         end),
--         ["<CR>"] = cmp.mapping({
--           i = function(fallback)
--             if cmp.visible() and cmp.get_active_entry() then
--               cmp.confirm({ behavior = cmp.ConfirmBehavior.Repalce, select = false })
--             else
--               fallback()
--             end
--           end,
--           s = cmp.confirm({ select = true }),
--           c = cmp.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = true }),
--         }),
--         ["<Tab>"] = cmp.mapping(function(fallback)
--           if cmp.visible() then
--             if #cmp.get_entries() == 1 then
--               cmp.confirm({ select = true })
--             else
--               cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
--             end
--           elseif vim.api.nvim_get_mode().mode ~= "c" and vim.snippet and vim.snippet.active({ direction = 1 }) then
--             vim.schedule(function()
--               vim.snippet.jump(1)
--             end)
--           elseif has_words_before() then
--             cmp.complete()
--             if #cmp.get_entries() == 1 then
--               cmp.confirm({ select = true })
--             end
--           else
--             fallback()
--           end
--         end, { "i", "s" }),
--         ["<S-Tab>"] = cmp.mapping(function(fallback)
--           if cmp.visible() then
--             if #cmp.get_entries() == 1 then
--               cmp.confirm({ select = true })
--             else
--               cmp.select_prev_item({ behavior = cmp.SelectBehavior.Select })
--             end
--           elseif vim.api.nvim_get_mode().mode ~= "c" and vim.snippet and vim.snippet.active({ direction = -1 }) then
--             vim.schedule(function()
--               vim.snippet.jump(-1)
--             end)
--           else
--             fallback()
--           end
--         end, { "i", "s" }),
--       },
--       sources = cmp.config.sources({
--         { name = "copilot" },
--         { name = "nvim_lsp" },
--         { name = "path" },
--       }, {
--         { name = "buffer" },
--       }),
--       formatting = {
--         format = function(_, item)
--           local icons = LazyVim.config.icons.kinds
--           if icons[item.kind] then
--             item.kind = icons[item.kind] .. item.kind
--           end
--
--           local widths = {
--             abbr = vim.g.cmp_widths and vim.g.cmp_widths.abbr or 40,
--             menu = vim.g.cmp_widths and vim.g.cmp_widths.menu or 30,
--           }
--
--           for key, width in pairs(widths) do
--             if item[key] and vim.fn.strdisplaywidth(item[key]) > width then
--               item[key] = vim.fn.strcharpart(item[key], 0, width - 1) .. "…"
--             end
--           end
--
--           return item
--         end,
--       },
--       sorting = defaults.sorting,
--     }
--   end,
--   experimental = {
--     ghost_text = vim.g.ai_cmp and {
--       hl_group = "CmpGhostText",
--     } or false,
--   },
--   main = "lazyvim.util.cmp",
-- }
