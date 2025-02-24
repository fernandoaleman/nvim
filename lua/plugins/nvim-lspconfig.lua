local util = require("lspconfig.util")

return {
  "neovim/nvim-lspconfig",
  opts = {
    servers = {
      solargraph = {
        cmd = { os.getenv("HOME") .. "/.asdf/shims/solargraph", "stdio" },
        filetypes = { "ruby" },
        root_dir = util.root_pattern("Gemfile", ".git", vim.fn.getcwd()),
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
      },
    },
  },
}
