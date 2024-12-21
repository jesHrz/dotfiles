return {
  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    ---@module "ibl"
    ---@type ibl.config
    opts = {
      scope = { show_start = true, show_end = false },
    },
    specs = {
      {
        "snacks.nvim",
        opts = {
          indent = { enabled = false },
        },
      },
    },
  },
}
