return {
      -- the colorscheme should be available when starting Neovim
  {
    "folke/tokyonight.nvim",
    lazy = false, -- make sure we load this during startup if it is your main colorscheme
    priority = 1000, -- make sure to load this before all the other start plugins
    config = function()
      -- load the colorscheme here
      vim.cmd([[colorscheme tokyonight]])
    end,
  },
  -- the colorscheme should be available when starting Neovim
  {
    "FriedrichWilken/molokai.nvim",
    lazy = false, -- make sure we load this during startup if it is your main colorscheme
    priority = 1000, -- make sure to load this before all the other start plugins
    config = function()
      -- load the colorscheme here
      vim.cmd([[colorscheme tokyonight]])
    end,
  },
  {
  "ibhagwan/fzf-lua",
  -- optional for icon support
  dependencies = { "nvim-tree/nvim-web-devicons" },
  -- or if using mini.icons/mini.nvim
  -- dependencies = { "echasnovski/mini.icons" },
  opts = {}
  },
  {
      "HiPhish/rainbow-delimiters.nvim"
  },
    {
      'tzachar/local-highlight.nvim',
      config = function()
        require('local-highlight').setup({
            --file_types = {'python', 'cpp'}, -- If this is given only attach to this
            -- OR attach to every filetype except:
            --disable_file_types = {'tex'},
            --hlgroup = 'LocalHighlight',
            cw_hlgroup = nil,
            -- Whether to display highlights in INSERT mode or not
            insert_mode = false,
            min_match_len = 1,
            max_match_len = math.huge,
            highlight_single_match = true,
            animate = {
              enabled = false,
            },
            --debounce_timeout = 200,
        })
      end
  },
}
