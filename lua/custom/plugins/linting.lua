return {
  "mfussenegger/nvim-lint",
  lazy = true,
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    local lint = require("lint")

    lint.linters_by_ft = {
      ansible = { "ansible-lint" },
      javascript = { "eslint_d" },
      python = { "pylint" },
      ruby = { "rubocop" },
    }

    local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })

    vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
      group = lint_augroup,
      callback = function()
        lint.try_lint()
      end,
    })

    -- set keymaps
    local mappings = {
      ["l"] = {
        function()
          lint.try_lint()
        end,
        "Trigger linting for current file",
      },
    }

    local which_key = require("which-key")

    which_key.register(mappings, which_key_opts)
  end,
}
