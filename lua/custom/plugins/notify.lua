return {
  'rcarriga/nvim-notify',
  lazy = false,
  config = function()
    require("notify").setup({
      timeout = 2000,
      background_colour = "#000000",
      render = "wrapped-compact",
    })
  end
}
