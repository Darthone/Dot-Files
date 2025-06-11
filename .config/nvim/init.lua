
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


local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })


local telescope = require('telescope')
telescope.setup {
    pickers = {
        find_files = {
            hidden = true
        }
    }
}



-- inspired by https://slar.se/comment-and-uncomment-code-in-neovim.html
-- aided by chatgpt
local non_c_line_comments_by_filetype = {
    lua = "--",
    python = "#",
    fish = "#",
    sql = "--",
}

local function toggle_comments(opts)
    local comment = non_c_line_comments_by_filetype[vim.bo.filetype] or "//"
    local start_line = opts.line1
    local end_line = opts.line2

    local lines = vim.api.nvim_buf_get_lines(0, start_line - 1, end_line, false)

    -- Check if all lines are already commented
    local all_commented = true
    for _, line in ipairs(lines) do
        if not line:match("^%s*" .. vim.pesc(comment)) then
            all_commented = false
            break
        end
    end

    local new_lines = {}
    if all_commented then
        -- Uncomment
        for _, line in ipairs(lines) do
            local uncommented = line:gsub("^%s*" .. vim.pesc(comment) .. "%s?", "", 1)
            table.insert(new_lines, uncommented)
        end
    else
        -- Comment
        for _, line in ipairs(lines) do
            table.insert(new_lines, comment .. " " .. line)
        end
    end

    -- Replace lines in buffer
    vim.api.nvim_buf_set_lines(0, start_line - 1, end_line, false, new_lines)
end

vim.api.nvim_create_user_command("CommentOut", toggle_comments, { range = true })
vim.keymap.set("v", "<leader>/", ":'<,'>CommentOut<CR>")
vim.keymap.set("n", "<leader>/", ":CommentOut<CR>")




-- Personal Shortcuts
-- Replace current word everywhere
vim.api.nvim_set_keymap("n", "<leader>r", [[:%s/\<<C-r><C-w>\>//g<left><left>]], {})
-- File explorer
vim.api.nvim_set_keymap("n", "<leader>e", [[:Ex<CR>]], {})
-- quick write
vim.api.nvim_set_keymap("n", "<leader>s", [[:w<CR>]], {})
-- line number toggle
vim.api.nvim_set_keymap("n", "<leader>2", [[:set invnumber<CR>]], {})


-- typos
vim.api.nvim_create_user_command('W', 'w', { nargs = 0 })
vim.api.nvim_create_user_command('Q', 'q', { nargs = 0 })

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






