vim.wo.number = true
vim.opt.relativenumber = true
vim.o.completeopt="menu,menuone,noselect"
vim.g.mouse = "a"
vim.opt.encoding = "utf-8"
vim.opt.termguicolors = true
vim.opt.swapfile = false
vim.opt.showmode = false
vim.opt.scrolloff = 7
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.autoindent = true
vim.opt.cursorline = true
vim.opt.fileformat = "unix"
vim.o.updatetime = 125

vim.api.nvim_create_autocmd("CursorHold", {
  callback = function()
    vim.diagnostic.open_float(nil, { focus = false })
  end,
})

