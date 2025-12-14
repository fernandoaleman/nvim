-- this fixes rubocop errors in LazyVim when using ruby < 3
-- when using ruby version < 3, create a .lazy.lua in the root of the project and add the following

local function get_ruby_version()
  local handle = io.popen("ruby -e 'print RUBY_VERSION' 2>/dev/null")
  if handle then
    local result = handle:read("*a")
    handle:close()
    return result
  end
  return nil
end

local ruby_version = get_ruby_version()
local use_old_args = ruby_version and ruby_version:match("^2%.") -- true if Ruby version starts with 2.

-- Function to determine the correct rubocop path
local function get_rubocop_command()
  -- Check if mise command is available
  if vim.fn.executable("mise") == 1 then
    local mise_path = vim.fn.expand("$HOME/.local/share/mise/shims/rubocop")
    -- Verify the mise rubocop shim exists
    if vim.fn.filereadable(mise_path) == 1 then
      return mise_path
    end
  end

  -- Fall back to asdf path
  return os.getenv("HOME") .. "/.asdf/shims/rubocop"
end

return {
  "stevearc/conform.nvim",
  opts = {
    formatters_by_ft = {
      ruby = { "rubocop" },
      yaml = { "prettier" },
      jinja = {},
    },
    formatters = {
      rubocop = use_old_args and {
        command = get_rubocop_command(),
        args = {
          "--auto-correct",
          "--format",
          "quiet",
          "--stderr",
          "--stdin",
          "$FILENAME",
        },
      } or {
        -- Ruby >= 3 settings
        command = get_rubocop_command(),
        args = { "--autocorrect", "--stdin", "$FILENAME", "--stderr", "--format", "quiet" },
      },
    },
  },
}
