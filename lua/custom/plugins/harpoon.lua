return {
  "ThePrimeagen/harpoon",
  lazy = false,
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  config = function()
    local ui = require("harpoon.ui")
    for i = 1, 9, 1 do
      local i_string = tostring(i)
      vim.keymap.set("n", "<leader>" .. i_string, function()
        ui.nav_file(i)
      end, { desc = "which_key_ignore" }
      )
    end
  end
}
