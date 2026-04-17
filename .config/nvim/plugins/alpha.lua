local alpha = require("alpha")
local dashboard = require("alpha.themes.dashboard")

dashboard.section.header.val = {
" ███╗   ██╗ ███████╗  ██████╗  ██╗   ██╗ ██╗ ███╗   ███╗     ██████╗ ",
" ████╗  ██║ ██╔════╝ ██╔═══██╗ ██║   ██║ ██║ ████╗ ████║ ██╗ ╚════██╗",
" ██╔██╗ ██║ █████╗   ██║   ██║ ██║   ██║ ██║ ██╔████╔██║ ╚═╝  █████╔╝",
" ██║╚██╗██║ ██╔══╝   ██║   ██║ ╚██╗ ██╔╝ ██║ ██║╚██╔╝██║ ██╗  ╚═══██╗",
" ██║ ╚████║ ███████╗ ╚██████╔╝  ╚████╔╝  ██║ ██║ ╚═╝ ██║ ╚═╝ ██████╔╝",
" ╚═╝  ╚═══╝ ╚══════╝  ╚═════╝    ╚═══╝   ╚═╝ ╚═╝     ╚═╝     ╚═════╝ ",
}

-- menu
dashboard.section.buttons.val = {
    dashboard.button( "e", " New file" , ":ene <BAR><CR>"),
    dashboard.button( "c", " Settings" , ":e $MYVIMRC | :cd %:p:h | Neotree<CR>"),
		dashboard.button( "s", " Load last session", function() require("persistence").load({ last = true }) end),
		dashboard.button( "d", " Select session", function() require("persistence").select() end),
}

-- 
alpha.setup(dashboard.opts)

-- vim.cmd([[
--     autocmd FileType alpha setlocal nofoldenable
-- ]])
