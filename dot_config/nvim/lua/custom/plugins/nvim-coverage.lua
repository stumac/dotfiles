local plugin = {
  'andythigpen/nvim-coverage',
  dependencies = {
    'nvim-lua/plenary.nvim',
  },
  config = function()
    require('coverage').setup()
  end,
}

return plugin
