return {
  -- Indentation Guides for indents
  "lukas-reineke/indent-blankline.nvim",
  main = "ibl",
  config = function()
    require("ibl").setup({
      scope = {
        show_start = false,
        show_end = false,
      },
    })
  end,
}
