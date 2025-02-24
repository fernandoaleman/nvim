-- since this is just for reference, don't actually load anything here and return an empty spec
-- stylua: ignore
if true then return {} end

-- this fixes rubocop errors in LazyVim when using ruby < 3
-- when using ruby version < 3, create a .lazy.lua in the root of the project and add the following

return {
  "stevearc/conform.nvim",
  opts = {
    formatters_by_ft = {
      ruby = { "rubocop" },
    },
    formatters = {
      rubocop = {
        -- The settings below are because of ruby 2.6.7
        -- Once we upgrade to 3.0.0, we can remove these settings
        command = os.getenv("HOME") .. "/.asdf/shims/rubocop", -- Use custom rubocop path
        args = { "--auto-correct", "--format", "quiet", "--stderr", "--stdin", "$FILENAME" }, -- Override default args
      },
    },
  },
}
