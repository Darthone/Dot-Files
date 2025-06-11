
-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)
vim.keymap.set("n", "<Space>", "<Nop>", { silent = true, remap = false })
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"





-- plugins
require("config.lazy")

vim.api.nvim_set_keymap("n", "<C-\\>", [[<Cmd>lua require"fzf-lua".buffers()<CR>]], {})
vim.api.nvim_set_keymap("n", "<C-k>", [[<Cmd>lua require"fzf-lua".builtin()<CR>]], {})
vim.api.nvim_set_keymap("n", "<C-p>", [[<Cmd>lua require"fzf-lua".files()<CR>]], {})
vim.api.nvim_set_keymap("n", "<C-l>", [[<Cmd>lua require"fzf-lua".live_grep_glob()<CR>]], {})
vim.api.nvim_set_keymap("n", "<C-g>", [[<Cmd>lua require"fzf-lua".grep_project()<CR>]], {})
vim.api.nvim_set_keymap("n", "<F1>", [[<Cmd>lua require"fzf-lua".help_tags()<CR>]], {})


---@type rainbow_delimiters.config
vim.g.rainbow_delimiters = {
    strategy = {
        [''] = 'rainbow-delimiters.strategy.global',
        vim = 'rainbow-delimiters.strategy.local',
    },
    query = {
        [''] = 'rainbow-delimiters',
        lua = 'rainbow-blocks',
    },
    priority = {
        [''] = 110,
        lua = 210,
    },
    highlight = {
        'RainbowDelimiterRed',
        'RainbowDelimiterYellow',
        'RainbowDelimiterBlue',
        'RainbowDelimiterOrange',
        'RainbowDelimiterGreen',
        'RainbowDelimiterViolet',
        'RainbowDelimiterCyan',
    },
}

vim.g.snacks_animate = false


-- Personal Shortcuts
-- Replace current word everywhere
vim.api.nvim_set_keymap("n", "<leader>r", [[:%s/\<<C-r><C-w>\>//g<left><left>]], {})
-- File explorer
vim.api.nvim_set_keymap("n", "<leader>e", [[:Ex<CR>]], {})
-- quick write
vim.api.nvim_set_keymap("n", "<leader>s", [[:w<CR>]], {})
-- line number toggle
vim.api.nvim_set_keymap("n", "<leader>2", [[:set invnumber<CR>]], {})


-- Move between splits using leader + {h,j,k,l}
vim.api.nvim_set_keymap('n', '<leader>h', '<C-w>h', {})
vim.api.nvim_set_keymap('n', '<leader>j', '<C-w>j', {})
vim.api.nvim_set_keymap('n', '<leader>k', '<C-w>k', {})
vim.api.nvim_set_keymap('n', '<leader>l', '<C-w>l', {})

-- create split
vim.api.nvim_set_keymap('n', '<leader>6', '<C-w>s', {})
vim.api.nvim_set_keymap('n', '<leader>7', '<C-w>v', {})

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



vim.api.nvim_create_autocmd('BufReadPost', {
  desc = 'Open file at the last position it was edited earlier',
  group = misc_augroup,
  pattern = '*',
  command = 'silent! normal! g`"zv'
})






