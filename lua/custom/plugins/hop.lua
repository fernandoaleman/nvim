return {
  "phaazon/hop.nvim",
  lazy = false,
  config = function()
    require'hop'.setup { keys = 'etovxqpdygfblzhckisuran', term_seq_bias = 0.5 }

    -- Changing the default f keyword
    vim.keymap.set('', 'f', "<cmd>lua require'hop'.hint_char1()<cr>", {})

    -- Pattern Matching with t keyword
    vim.keymap.set('n', 't', "<cmd>HopPattern<CR>", {noremap = true})
  end
}
