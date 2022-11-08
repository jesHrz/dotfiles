local packer = require("packer")

packer.startup(
  function(use)
    -- Packer itself
    use("wbthomason/packer.nvim")

    -- comments
    use("numToStr/Comment.nvim")
    use("JoosepAlviste/nvim-ts-context-commentstring")

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

    -- same plugin like easymotion but for neovim
    use({
      'phaazon/hop.nvim',
      branch = 'v2', -- optional but strongly recommended
    })

    -- Rust enhancement
    use("simrat39/rust-tools.nvim")

    use("nvim-lua/plenary.nvim")
    use({
      'nvim-telescope/telescope.nvim', tag = '0.1.0',
      requires = { {'nvim-lua/plenary.nvim'} }
    })

    use("simrat39/symbols-outline.nvim")
  end
)

-- reload after save
pcall(
  vim.cmd,
  [[
    augroup packer_user_config
    autocmd!
    autocmd BufWritePost lua/plugins/init.lua source <afile>
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
require("plugins.telescope")
require("plugins.symbols-outline")
require("plugins.hop")

-- default configure
require('nvim-autopairs').setup{
  disable_filetype = {'TelescopePrompt', 'vim'}
}
