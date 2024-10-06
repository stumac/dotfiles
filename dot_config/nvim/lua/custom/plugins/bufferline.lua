local plugin = {
  event = 'VeryLazy',
  'akinsho/bufferline.nvim',
  version = '*',
  dependencies = 'nvim-tree/nvim-web-devicons',
  init = function()
    require('bufferline').setup {}
    vim.api.nvim_set_hl(0, 'bufferLineBackground', { bg = '#1b223b', blend = 5 })
  end,
  keys = {
    { '<S-h>', '<cmd>BufferLineCyclePrev<cr>', desc = 'Prev Buffer' },
    { '<S-l>', '<cmd>BufferLineCycleNext<cr>', desc = 'Next Buffer' },
  },
}

return plugin
