return {
  -- Import the base Python language extra
  { import = "lazyvim.plugins.extras.lang.python" },

  -- Override the formatter setup
  {
    "stevearc/conform.nvim",
    opts = function(_, opts)
      local config_path = vim.fn.expand("~/.config/ruff/ruff.toml")
      local has_config = vim.fn.filereadable(config_path) == 1

      opts.formatters_by_ft = opts.formatters_by_ft or {}
      opts.formatters_by_ft.python = { "ruff_format" }

      opts.formatters = opts.formatters or {}
      opts.formatters.ruff_format = opts.formatters.ruff_format or {}

      if has_config then
        opts.formatters.ruff_format.prepend_args = {
          "--config",
          config_path,
        }
      end
    end,
  },
}
