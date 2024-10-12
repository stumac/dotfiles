local plugin = {
  'stevearc/conform.nvim',
  event = { 'BufWritePre' },
  cmd = { 'ConformInfo' },
  keys = {
    {
      -- Customize or remove this keymap to your liking
      '<leader>ff',
      function()
        -- require('conform').format { async = true }
        require('conform').format({ async = true, lsp_format = 'prefer', lsp_fallback = true }, function(err)
          if not err then
            local mode = vim.api.nvim_get_mode().mode
            if vim.startswith(string.lower(mode), 'v') then
              vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes('<Esc>', true, false, true), 'n', true)
            end
          else
            error(err)
          end
        end)
      end,
      mode = '',
      desc = 'Format buffer',
    },
  },
  -- This will provide type hinting with LuaLS
  ---@module "conform"
  ---@type conform.setupOpts
  ---
  opts = {
    notify_on_error = true,
    format_on_save = function(bufnr)
      if vim.bo[bufnr].filetype == 'rb' or vim.bo[bufnr] == 'ruby' then
        return
      end
      -- Disable "format_on_save lsp_fallback" for languages that don't
      -- have a well standardized coding style. You can add additional
      -- languages here or re-enable it for the disabled ones.
      local disable_filetypes = { c = true, cpp = true, ruby = true }
      return {
        timeout_ms = 500,
        lsp_fallback = not disable_filetypes[vim.bo[bufnr].filetype],
      }
    end,
    formatters_by_ft = {
      lua = { 'stylua' },
      -- Conform can also run multiple formatters sequentially
      python = { 'isort', 'black' },
      ruby = { 'standardrb' },
      elixir = { 'mix' },
      heex = { 'mix' },
      go = { 'goimports', 'gofmt' },
      --
      -- You can use a sub-list to tell conform to run *until* a formatter
      -- is found.
      -- javascript = { { "prettierd", "prettier" } },
    },
  },
}
-- local plugin = { -- Autoformat
--   'stevearc/conform.nvim',
--   config = function()
--     require('conform').setup {
--       notify_on_error = true,
--       format_on_save = function(bufnr)
--         -- Disable "format_on_save lsp_fallback" for languages that don't
--         -- have a well standardized coding style. You can add additional
--         -- languages here or re-enable it for the disabled ones.
--         local disable_filetypes = { c = true, cpp = true, ruby = true }
--         return {
--           timeout_ms = 500,
--           lsp_fallback = not disable_filetypes[vim.bo[bufnr].filetype],
--         }
--       end,
--       formatters_by_ft = {
--         lua = { 'stylua' },
--         -- Conform can also run multiple formatters sequentially
--         python = { 'isort', 'black' },
--         ruby = { 'standardrb' },
--         --
--         -- You can use a sub-list to tell conform to run *until* a formatter
--         -- is found.
--         -- javascript = { { "prettierd", "prettier" } },
--       },
--     }
--     vim.keymap.set('', '<leader>ff', function()
--       print "we're here!"
--       require('conform').format({ async = true, lsp_format = 'prefer' }, function(err)
--         print 'inside conform'
--         if err then
--           print 'error!'
--           error(err)
--         end
--       end)
--     end, { desc = 'Format Selection' })
--   end,
-- opts = {
--   notify_on_error = true,
--   format_on_save = function(bufnr)
--     -- Disable "format_on_save lsp_fallback" for languages that don't
--     -- have a well standardized coding style. You can add additional
--     -- languages here or re-enable it for the disabled ones.
--     local disable_filetypes = { c = true, cpp = true, ruby = true }
--     return {
--       timeout_ms = 500,
--       lsp_fallback = not disable_filetypes[vim.bo[bufnr].filetype],
--     }
--   end,
--   formatters_by_ft = {
--     lua = { 'stylua' },
--     -- Conform can also run multiple formatters sequentially
--     python = { 'isort', 'black' },
--     ruby = { 'standardrb' },
--     --
--     -- You can use a sub-list to tell conform to run *until* a formatter
--     -- is found.
--     -- javascript = { { "prettierd", "prettier" } },
--   },
-- },
-- }

return plugin
