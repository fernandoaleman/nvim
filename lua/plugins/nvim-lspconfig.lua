local util = require("lspconfig.util")

-- Function to determine the correct solargraph path
local function get_solargraph_cmd()
  -- Check if mise command is available
  if vim.fn.executable("mise") == 1 then
    local mise_path = vim.fn.expand("$HOME/.local/share/mise/shims/solargraph")
    -- Verify the mise solargraph shim exists
    if vim.fn.filereadable(mise_path) == 1 then
      return { mise_path, "stdio" }
    end
  end

  -- Fall back to asdf path
  return { vim.fn.expand("$HOME/.asdf/shims/solargraph"), "stdio" }
end

return {
  "neovim/nvim-lspconfig",
  opts = function(_, opts)
    opts.servers = opts.servers or {}

    opts.servers.solargraph = {
      cmd = get_solargraph_cmd(),
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
