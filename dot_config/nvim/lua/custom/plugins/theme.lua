local plugin = {
  -- You can easily change to a different colorscheme.
  -- Change the name of the colorscheme plugin below, and then
  -- change the command in the config to whatever the name of that colorscheme is.
  --
  -- If you want to see what colorschemes are already installed, you can use `:Telescope colorscheme`.
  -- 'folke/tokyonight.nvim',
  'catppuccin/nvim',
  name = 'catppuccin',
  priority = 1000, -- Make sure to load this before all the other start plugins.
  init = function()
    require('catppuccin').setup {
      dim_inactive = {
        enabled = true,
        shade = 'dark',
        percentage = 0.35,
      },
      flavour = 'mocha',
      background = {
        dark = 'mocha',
        light = 'frappe',
      },
      transparent_background = true,
      integrations = {
        mini = {
          enabled = true,
        },
      },
    }
    -- Load the colorscheme here.
    -- Like many other themes, this one has different styles, and you could load
    -- any other, such as 'tokyonight-storm', 'tokyonight-moon', or 'tokyonight-day'.
    vim.cmd.colorscheme 'catppuccin'
    -- transparent backgrounds. Let wez handle your stuff

    vim.api.nvim_set_hl(0, 'Normal', { fg = 'none', bg = 'none', blend = 0 })
    vim.api.nvim_set_hl(0, 'NormalFloat', { bg = '#1b223b', blend = 0 })
    vim.api.nvim_set_hl(0, 'TelescopeNormal', { bg = '#1b223b', blend = 10 })
    vim.api.nvim_set_hl(0, 'NormalNC', { bg = 'none', blend = 50 })
    vim.api.nvim_set_hl(0, 'TelescopeBorder', { bg = '#1b223b', blend = 10 })
    -- You can configure highlights by doing something like:
    vim.cmd.hi 'LineNr gui=none'
    vim.api.nvim_set_hl(0, 'CursorLineSign', {
      bg = 'none',
      fg = 'none',
      blend = 80,
    })
    vim.api.nvim_set_hl(0, 'CursorLineNr', {
      bg = '#1b223b',
      fg = '#9b009b',
      blend = 80,
    })
    vim.api.nvim_set_hl(0, 'SignColumn', {
      bg = 'none',
      blend = 100,
    })
    --
    vim.api.nvim_set_hl(0, 'CursorLine', {
      bg = '#1b223b',
      -- fg = '#00FF00',
      -- blend = 50,
    })
    vim.cmd.hi 'CursorLineNr gui=none'
    vim.cmd.hi 'Comment gui=none'
  end,
}

return plugin
