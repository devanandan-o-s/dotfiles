return {
  {
    "jake-stewart/multicursor.nvim",
    branch = "1.0",
    config = function()
      local mc = require("multicursor-nvim")

      mc.setup()

      vim.keymap.set({ "n", "v" }, "<C-n>", function()
        mc.addCursor("*")
      end)

      vim.keymap.set("n", "<Esc>", function()
        if mc.hasCursors() then
          mc.clearCursors()
        else
          vim.cmd("nohlsearch")
        end
      end)
    end,
  },
}
