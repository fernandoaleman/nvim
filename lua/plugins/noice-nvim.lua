return {
  "folke/noice.nvim",
  opts = {
    cmdline = {
      view = "cmdline_popup", -- use popup instead of top cmdline
    },
    views = {
      cmdline_popup = {
        position = {
          row = "90%", -- move it near the bottom
          col = "50%",
        },
        size = {
          width = 60,
          height = "auto",
        },
      },
    },
  },
}
