return {
  "akinsho/bufferline.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  version = "*",
  config = function()
    local bufferline = require("bufferline")

    -- configure bufferline
    bufferline.setup({
      options = {
        hover = {
          enabled = true,
          delay = 150,
          reveal = { "close" },
        },
      },
    })

    vim.keymap.set("n", "<Tab>", "<cmd>bn<CR>") -- next buffer
    vim.keymap.set("n", "<S-Tab>", "<cmd>bp<CR>") -- previous buffer

    -- set keymaps
    local mappings = {
      ["b"] = {
        name = "buffer",
        b = { "<cmd>Telescope buffers<CR>", "find buffers" },
        c = { "<cmd>bdelete<CR>", "close buffer" }, -- close current file
        k = { "<cmd>bdelete<CR>", "kill buffer" }, -- close current file
        n = { "<cmd>bnext<CR>", "switch to next buffer" },
        o = { "<cmd>e #<CR>", "switch between last two buffers" },
        p = { "<cmd>bprevious<CR>", "switch to previous buffer" },
      },
    }

    local which_key = require("which-key")

    which_key.register(mappings, which_key_opts)
  end,
}
