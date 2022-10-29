local packer = require("packer")


packer.startup(
  function(use)
      -- Packer itself
      use("wbthomason/packer.nvim")

      -- comments
      use("numToStr/Comment.nvim")

      -- enforcement
      use({
        "PHSix/faster.nvim",
        event = {"VimEnter *"},
        config = function()
          vim.api.nvim_set_keymap('n', 'j', '<Plug>(faster_move_j)', {noremap=false, silent=true})
          vim.api.nvim_set_keymap('n', 'k', '<Plug>(faster_move_k)', {noremap=false, silent=true})
        end
      })

     use("JoosepAlviste/nvim-ts-context-commentstring")

      if (not vim.g.vscode) then
        -- Theme
        use("sainnhe/everforest")

        --NvimTree
        use({ "kyazdani42/nvim-tree.lua", requires = "kyazdani42/nvim-web-devicons" })

        -- BufferLine
        use({ "akinsho/bufferline.nvim", requires = { "kyazdani42/nvim-web-devicons", "moll/vim-bbye" }})

        -- lualine
        use({ "nvim-lualine/lualine.nvim", requires = { "kyazdani42/nvim-web-devicons" } })
        use("arkav/lualine-lsp-progress")

        --treesitter
        use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" })
        use("p00f/nvim-ts-rainbow")

        -- LSP
        use({ "neovim/nvim-lspconfig", "williamboman/nvim-lsp-installer" })
        use("tami5/lspsaga.nvim" )

        -- completion engine
        use("hrsh7th/nvim-cmp")
        -- snippet engine
        use("L3MON4D3/LuaSnip")
        -- source
        use("saadparwaiz1/cmp_luasnip")
        use("hrsh7th/cmp-nvim-lsp") -- { name = nvim_lsp }
        use("hrsh7th/cmp-buffer") -- { name = 'buffer' },
        use("hrsh7th/cmp-path") -- { name = 'path' }
        use("onsails/lspkind.nvim")

        -- indent-blankline
        use("lukas-reineke/indent-blankline.nvim")

        use("windwp/nvim-autopairs")
        use("tpope/vim-surround")

        -- Rust enhancement
        use("simrat39/rust-tools.nvim")
      end
  end
)

-- reload after save
pcall(
  vim.cmd,
  [[
    augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins/init.lua source <afile>
    augroup end
  ]]
)

require("plugins.comment")
require("plugins.nvim-tree")
require("plugins.bufferline")
require("plugins.lualine")
require("plugins.nvim-treesitter")
require("plugins.indent-blankline")
require("plugins.lspsaga")

-- default configure
require('nvim-autopairs').setup{}
