return {
  {
    "nvim-treesitter/nvim-treesitter",
    event = { "BufReadPre", "BufNewFile" },
    build = ":TSUpdate",
    dependencies = {
      "nvim-treesitter/nvim-treesitter-textobjects",
      "windwp/nvim-ts-autotag",
    },
    config = function()
      -- import nvim-treesitter plugin
      local treesitter = require("nvim-treesitter.configs")

      -- configure treesitter
      treesitter.setup({ -- enable syntax highlighting
        -- ensure these language parsers are installed
        ensure_installed = {
          "bash",
          "css",
          "dockerfile",
          "gitignore",
          "html",
          "javascript",
          "json",
          "lua",
          "markdown",
          "markdown_inline",
          "python",
          "ruby",
          "query",
          "vim",
          "yaml",
        },
        highlight = {
          enable = true,
        },
        -- enable indentation
        indent = { enable = true },
        -- enable nvim-ts-rainbow2
        rainbow = {
          enable = true,
          -- list of languages you want to disable the plugin for
          -- disable = { "jsx", "cpp" },
          -- Which query to use for finding delimiters
          query = 'rainbow-parens',
          -- Highlight the entire buffer all at once
          strategy = require 'ts-rainbow.strategy.global',
          -- Do not enable for files with more than n lines
          max_file_lines = 3000
        },
        -- enable autotagging (w/ nvim-ts-autotag plugin)
        autotag = {
          enable = true,
        },
        incremental_selection = {
          enable = true,
          keymaps = {
            init_selection = "<C-space>",
            node_incremental = "<C-space>",
            scope_incremental = false,
            node_decremental = "<bs>",
          },
        },
      })
    end,
  },
}
