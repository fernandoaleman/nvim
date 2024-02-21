return {
  "nvim-telescope/telescope.nvim",
  branch = "0.1.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    "nvim-tree/nvim-web-devicons",
    "nvim-telescope/telescope-ui-select.nvim",
  },
  config = function()
    local telescope = require("telescope")
    local actions = require("telescope.actions")

    telescope.setup({
      defaults = {
        prompt_prefix = " ",
        selection_caret = " ",
        path_display = { "truncate " },
        mappings = {
          i = {
            ["<C-j>"] = actions.move_selection_next, -- move to next result
            ["<C-k>"] = actions.move_selection_previous, -- move to prev result
            ["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
          },
        },
      },
      extensions = {
        ["ui-select"] = {
          require("telescope.themes").get_dropdown({}),
        },
      },
    })

    telescope.load_extension("fzf")
    telescope.load_extension("ui-select")

    -- set keymaps
    local mappings = {
      ["b"] = { "<cmd>Telescope buffers<CR>", "find buffers" },
      ["f"] = {
        name = "file search",
        b = { "<cmd>Telescope buffers<CR>", "find buffers" },
        c = { "<cmd>Telescope grep_string<CR>", "find string under cursor in cwd" },
        f = { "<cmd>Telescope find_files<CR>", "find files in cwd" },
        g = { "<cmd>Telescope live_grep<CR>", "find string in cwd" },
        r = { "<cmd>Telescope oldfiles<CR>", "find recent files" },
        s = { "<cmd>Telescope live_grep<CR>", "find string in cwd" },
      },

      ["h"] = {
        name = "help",
        c = { "<cmd>Telescope commands<CR>", "commands" },
        k = { "<cmd>Telescope keymaps<CR>", "keymaps" },
        m = { "<cmd>Telescope man_pages<CR>", "man pages" },
        r = { "<cmd>Telescope registers<CR>", "registers" },
        t = { "<cmd>Telescope help_tags<CR>", "find help" },
      },
    }

    local which_key = require("which-key")

    which_key.register(mappings, which_key_opts)
  end,
}
