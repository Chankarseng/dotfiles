-- Formatter
vim.pack.add { 'https://github.com.stevearc/conform.nvim' }
require('conform').setup {
  notify_on_error = false,
  format_on_save = function()
    return {
      timeout_ms = 500,
      lsp_format = 'fallback',
    }
  end,
  default_format_opts = {
    lsp_format = 'fallback',
  },
  formatters_by_ft = {
    lua = { 'stylua' },
    css = { 'prettier' },
    html = { 'prettier' },
    js = { 'prettier' },
    javascript = { 'prettier', stop_after_first = true },
    typescript = { 'prettier', stop_after_first = true },
    vue = { 'prettier' },
    python = { 'autopep8' },
    terraform = { 'terraform_fmt' },
    tf = { 'terraform_fmt' },
    sh = { 'shfmt' },
  },
}

vim.keymap.set({ 'n', 'v' }, '<leader>f', function() require('conform').format { async = true } end, { desc = '[F]ormat buffer' })
