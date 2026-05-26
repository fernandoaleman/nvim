return {
  {
    "LazyVim/LazyVim",
    opts = {
      -- use the flavour-specific name; nvim 0.12 ships a bundled
      -- colors/catppuccin.vim (mocha-only) that shadows the plugin's loader.
      colorscheme = "catppuccin-macchiato",
    },
  },
  {
    "folke/tokyonight.nvim",
    enabled = false,
  },
  {
    "catppuccin/nvim",
    lazy = false,
    name = "catppuccin",
    priority = 1000,
    opts = {
      flavour = "macchiato",
      transparent_background = true,
      styles = {
        comments = { "italic" },
      },
      integrations = {
        treesitter = true,
        native_lsp = {
          enabled = true,
          underlines = {
            errors = { "undercurl" },
            hints = { "undercurl" },
            warnings = { "undercurl" },
            information = { "undercurl" },
          },
        },
        snacks = { enabled = true },
        neotree = true,
        gitsigns = true,
        mini = { enabled = true },
        blink_cmp = true,
        mason = true,
        which_key = true,
        markdown = true,
        notify = true,
        semantic_tokens = true,
      },
    },
  },
}
