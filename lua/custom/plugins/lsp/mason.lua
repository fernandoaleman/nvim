return {
  "williamboman/mason.nvim",
  dependencies = {
    "williamboman/mason-lspconfig.nvim",
    "WhoIsSethDaniel/mason-tool-installer.nvim",
  },
  config = function()
    -- import mason
    local mason = require("mason")

    -- import mason-lspconfig
    local mason_lspconfig = require("mason-lspconfig")

    local mason_tool_installer = require("mason-tool-installer")

    -- enable mason and configure icons
    mason.setup({
      ui = {
        icons = {
          package_installed = "✓",
          package_pending = "➜",
          package_uninstalled = "✗",
        },
      },
    })

    -- set keymaps
    local mappings = {
      ["m"] = { "<cmd>Mason<CR>", "mason" }, -- open Mason
    }

    local which_key = require("which-key")

    which_key.register(mappings, which_key_opts)

    mason_lspconfig.setup({
      -- list of servers for mason to install
      ensure_installed = {
        "ansiblels",
        "cssls",
        "emmet_ls",
        "html",
        "lua_ls",
        "pyright",
        "solargraph",
      },
      -- auto-install configured servers (with lspconfig)
      automatic_installation = true, -- not the same as ensure_installed
    })

    mason_tool_installer.setup({
      ensure_installed = {
        "ansible-lint", -- ansible linter
        "black", -- python formatter
        "eslint_d", -- js linter
        "isort", -- python formatter
        "prettier", -- prettier formatter
        "pylint", -- python linter
        "rubocop", -- ruby linter
        "stylua", -- lua formatter
      },
    })
  end,
}
