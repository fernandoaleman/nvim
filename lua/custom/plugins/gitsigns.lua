return {
  "lewis6991/gitsigns.nvim",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    require("gitsigns").setup()

    -- set keymaps
    local mappings = {
      ["g"] = {
        name = "git",
        j = { "<cmd>lua require 'gitsigns'.next_hunk()<CR>", "next hunk" },
        k = { "<cmd>lua require 'gitsigns'.prev_hunk()<CR>", "prev hunk" },
        l = { "<cmd>lua require 'gitsigns'.blame_line()<CR>", "blame" },
        p = { "<cmd>lua require 'gitsigns'.preview_hunk()<CR>", "preview hunk" },
        r = { "<cmd>lua require 'gitsigns'.reset_hunk()<CR>", "reset hunk" },
        R = { "<cmd>lua require 'gitsigns'.reset_buffer()<CR>", "reset buffer" },
        s = { "<cmd>lua require 'gitsigns'.stage_hunk()<CR>", "stage hunk" },
        u = { "<cmd>lua require 'gitsigns'.undo_stage_hunk()<CR>", "undo stage hunk" },
        o = { "<cmd>Telescope git_status<CR>", "open changed file" },
        b = { "<cmd>Telescope git_branches<CR>", "checkout branch" },
        c = { "<cmd>Telescope git_commits<CR>", "checkout commit" },
        d = { "<cmd>Gitsigns diffthis HEAD<CR>", "diff" },
      },
    }

    local which_key = require("which-key")

    which_key.register(mappings, which_key_opts)
  end
}
