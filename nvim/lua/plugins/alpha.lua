local alpha = require("alpha")
-- require'alpha'.setup(require'alpha.themes.dashboard'.config)

local dashboard = require("alpha.themes.dashboard")

-- Set header
dashboard.section.header.val = {
    "                                                     ",
    "  ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ ",
    "  ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║ ",
    "  ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║ ",
    "  ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ ",
    "  ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ ",
    "  ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝ ",
    "                                                     ",
}

dashboard.section.buttons.val = {
    dashboard.button( "e", "  New file" , ":ene <BAR> startinsert <CR>"),
    dashboard.button("SPC f f", "  Find Files", ":Telescope find_files<CR>"),
    dashboard.button("SPC l g", "  Live Grep", ":Telescope live_grep<CR>"),
    dashboard.button("SPC o f", "  Recently Opened Files", ":Telescope oldfiles<CR>"),
    dashboard.button("SPC g c", "  Git Commits (Only in a Git Repo)", ":Telescope git_commits<CR>"),
    dashboard.button("SPC c s", "  Colorschemes", ":Telescope colorscheme<CR>"),
    dashboard.button( "q", "  Quit NVIM" , ":qa<CR>"),
}

alpha.setup(dashboard.opts)
