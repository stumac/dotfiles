local plugin = {
  'lukas-reineke/virt-column.nvim',
  opts = {
    char = { '│', '┃' },
    virtcolumn = '80, 120',
    highlight = { 'DiagnosticFloatingWarn', 'DiagnosticFloatingError' },
  },
}

return plugin
