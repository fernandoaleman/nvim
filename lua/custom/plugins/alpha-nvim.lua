return {
  "goolord/alpha-nvim",
  event = "VimEnter",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    local alpha = require("alpha")
    local dashboard = require("alpha.themes.dashboard")

    -- Set header
    dashboard.section.header.val = {
      [[                                                     ]],
      [[  ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ ]],
      [[  ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║ ]],
      [[  ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║ ]],
      [[  ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ ]],
      [[  ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ ]],
      [[  ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝ ]],
      [[                                                     ]],
    }

    -- Set menu
    dashboard.section.buttons.val = {
      dashboard.button("e",  "  > New File", "<cmd>ene <BAR> startinsert<CR>"),
      dashboard.button("ee", "  > Toggle file explorer", "<cmd>NvimTreeToggle<CR>"),
      dashboard.button("ff", "󰱼  > Find File", "<cmd>Telescope find_files<CR>"),
      dashboard.button("fs", "  > Find Word", "<cmd>Telescope live_grep<CR>"),
      dashboard.button("fr", "󰁯  > Recently Used Files", "<cmd>Telescope oldfiles<CR>"),
      dashboard.button("ar", "󰁯  > Restore Session For Current Directory", "<cmd>SessionRestore<CR>"),
      dashboard.button("q",  "  > Quit NVIM", "<cmd>qa<CR>"),
    }

    local function footer()
      return "Don't Stop Until You are Proud..."
    end

    dashboard.section.footer.val = footer()

    dashboard.section.footer.opts.hl = "Function"
    dashboard.section.header.opts.hl = "Function"
    dashboard.section.buttons.opts.hl = "Include"

    -- Send config to alpha
    alpha.setup(dashboard.opts)

    -- Disable folding on alpha buffer
    vim.cmd([[autocmd FileType alpha setlocal nofoldenable]])
  end,
}
