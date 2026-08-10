-- Formatter
vim.pack.add { 'https://github.com.stevearc/conform.nvim' }
require('conform').setup {
  notify_on_error = true,
  format_on_save = function()
    return {
      timeout_ms = 500,
      lsp_format = 'fallback',
    }
  end,
  default_format_opts = {
    lsp_format = 'fallback',
  },
  formatters = {
    biome = {
      cond = function(_, ctx) return vim.fs.find({ 'biome.json', 'biome.jsonc' }, { path = ctx.dirname, upward = true })[1] ~= nil end,
    },
    eslint_d = {
      command = 'eslint_d',
      args = { '--fix-to-stdout', '--stdin', '--stdin-filename', '$FILENAME' },
      cond = function(_, ctx)
        return vim.fs.find({
          '.eslintrc',
          '.eslintrc.js',
          '.eslintrc.cjs',
          '.eslintrc.json',
          '.eslintrc.yaml',
          '.eslintrc.yml',
          'eslint.config.js',
          'eslint.config.cjs',
          'eslint.config.mjs',
        }, { path = ctx.dirname, upward = true })[1] ~= nil
      end,
    },
    prettier = {
      cond = function(_, ctx)
        return vim.fs.find({
          '.prettierrc',
          '.prettierrc.json',
          '.prettierrc.js',
          '.prettierrc.cjs',
          '.prettierrc.mjs',
          '.prettierrc.yaml',
          '.prettierrc.yml',
          'prettier.config.js',
          'prettier.config.cjs',
          'prettier.config.mjs',
        }, { path = ctx.dirname, upward = true })[1] ~= nil
      end,
    },
  },
  formatters_by_ft = {
    react = { 'biome', 'eslint_d', 'prettier', stop_after_first = true },
    typescriptreact = { 'biome', 'eslint_d', 'prettier', stop_after_first = true },
    lua = { 'stylua' },
    css = { 'prettier' },
    html = { 'prettier' },
    js = { 'prettier' },
    javascript = { 'biome', 'eslint_d', 'prettier', stop_after_first = true },
    typescript = { 'biome', 'eslint_d', 'prettier', stop_after_first = true },
    vue = { 'biome', 'eslint_d', 'prettier', stop_after_first = true },
    python = { 'autopep8' },
    terraform = { 'terraform_fmt' },
    tf = { 'terraform_fmt' },
    sh = { 'shfmt' },
  },
}

vim.keymap.set({ 'n', 'v' }, '<leader>f', function() require('conform').format { async = true } end, { desc = '[F]ormat buffer' })
