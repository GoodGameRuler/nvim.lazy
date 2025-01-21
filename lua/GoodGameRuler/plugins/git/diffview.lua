return {
  "sindrets/diffview.nvim",
  opts = {},
  config = function(_, opts)
    require("diffview").setup(opts)
  end,
}
