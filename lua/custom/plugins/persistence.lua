return {
  "folke/persistence.nvim",
  event = "BufReadPre", -- this will only start session saving when an actual file sas opened
  lazy = true,
  config = function()
    require("persistence").setup({
      dir = vim.fn.expand(vim.fn.stdpath("config") .. "/session/"),
      options = { "buffers", "curdir", "tabpages", "winsize" },
    })
  end,
}
