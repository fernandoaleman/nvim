return {
  "folke/snacks.nvim",
  opts = {
    -- show hidden files by default
    picker = {
      sources = {
        explorer = {
          hidden = true,
        },
        files = {
          hidden = true,
        },
      },
    },
  },
  keys = {
    -- change default keymap
    { "<leader><space>", "<C-^>", desc = "Toggle last two files" },
  },
}
