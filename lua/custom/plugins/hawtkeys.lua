return {
  "tris203/hawtkeys.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
  },
  config = {
    customMaps = {
      -- If you use whichkey.register with an alias eg wk.register
      ["wk.register"] = {
        method = "which_key",
      },
    },
  },
}
