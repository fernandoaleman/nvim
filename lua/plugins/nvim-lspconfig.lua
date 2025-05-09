local util = require("lspconfig.util")

return {
  "neovim/nvim-lspconfig",
  opts = function(_, opts)
    opts.servers = opts.servers or {}

    opts.servers.solargraph = {
      cmd = { vim.fn.expand("$HOME/.asdf/shims/solargraph"), "stdio" },
      filetypes = { "ruby" },
      root_dir = util.root_pattern("Gemfile", ".git"),
      settings = {
        solargraph = {
          autoformat = true,
          completion = true,
          diagnostic = true,
          folding = true,
          references = true,
          rename = true,
          symbols = true,
        },
      },
    }
  end,
}
