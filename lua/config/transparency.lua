-- Force transparency for all windows
vim.api.nvim_create_autocmd("ColorScheme", {
  callback = function()
    -- Main background
    vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
    vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })

    -- Common plugin backgrounds
    vim.api.nvim_set_hl(0, "NeoTreeNormal", { bg = "none" })
    vim.api.nvim_set_hl(0, "NeoTreeNormalNC", { bg = "none" })
    vim.api.nvim_set_hl(0, "TelescopeNormal", { bg = "none" })
    vim.api.nvim_set_hl(0, "LazyGitFloat", { bg = "none" })

    -- Terminal background
    vim.api.nvim_set_hl(0, "TerminalNormal", { bg = "none" })
  end,
})
