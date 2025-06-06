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
          ignored = true,
          exclude = { ".git", "node_modules", ".cache", ".ansible", "__pycache__" },
        },
        grep = {
          hidden = true,
          ignored = true,
          exclude = { ".git", "node_modules", ".cache", ".ansible", "__pycache__" },
        },
      },
    },
  },
  keys = {
    -- change default keymap
    { "<leader><space>", "<C-^>", desc = "Toggle last two files" },
  },
}
