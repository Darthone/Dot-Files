-- set space as leader before plugins are loaded
vim.keymap.set("n", "<Space>", "<Nop>", { silent = true, remap = false })
vim.g.mapleader = " "



-- plugins
require("config.lazy")

require('wincent.commandt').setup()
--vim.g.CommandTPreferredImplementation = 'ruby'

-- Basic settings
vim.opt.syntax = "on"
vim.opt.backspace = { "indent", "eol", "start" }
vim.opt.cindent = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.expandtab = true

-- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
vim.o.ignorecase = true
vim.o.smartcase = true


-- UI settings
vim.opt.number = true
vim.opt.incsearch = true
vim.opt.hlsearch = true
vim.opt.scrolloff = 12
vim.opt.showmatch = true
vim.opt.cursorline = true
vim.opt.showtabline = 2
vim.opt.laststatus = 2

-- Paste toggle

vim.keymap.set("n", "<F2>", ":set invnumber<CR>", { noremap = true, silent = true })

