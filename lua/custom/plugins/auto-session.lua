return {
  "rmagatti/auto-session",
  config = function()
    local auto_session = require("auto-session")

    auto_session.setup({
      auto_restore_enabled = false,
      auto_session_suppress_dirs = { "~/", "~/Downloads", "~/Documents", "~/Desktop/" },
    })

    -- set keymaps
    local mappings = {
      ["s"] = {
        name = "sessions",
        r = { "<cmd>SessionRestore<CR>", "restore session for cwd" },
        s = { "<cmd>SessionSave<CR>", "save session for auto session root dir" },
      },
    }

    local which_key = require("which-key")

    which_key.register(mappings, which_key_opts)
  end,
}
