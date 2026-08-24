-- Autocomplete
vim.pack.add { { src = 'https://github.com/L3MON4D3/LuaSnip', version = vim.version.range '2.*' } }
require('luasnip').setup {}

vim.pack.add { 'https://github.com/rafamadriz/friendly-snippets' }
require('luasnip.loaders.from_vscode').lazy_load()

vim.pack.add { { src = 'https://github.com/saghen/blink.cmp', version = vim.version.range '1.*' } }

require('blink.cmp').setup {
  keymap = {
    preset = 'enter',
  },
  appearance = {
    use_nvim_cmp_as_default = false,
    nerd_font_variant = 'mono',
  },
  completion = {
    documentation = { auto_show = false, auto_show_delay_ms = 500 },
    list = { selection = { preselect = true, auto_insert = false } },
    menu = {
      draw = {
        columns = { { 'label', 'label_description', gap = 1 }, { 'kind_icon', 'kind', gap = 1 } },
        components = {
          kind_icon = {
            ellipsis = false,
            text = function(ctx)
              local kind_icon, _, _ = require('mini.icons').get('lsp', ctx.kind)
              return kind_icon
            end,
          },
        },
      },
    },
  },

  sources = {
    default = { 'lsp', 'path', 'snippets', 'buffer' },
  },
  snippets = { preset = 'luasnip' },
  fuzzy = { implementation = 'lua' },
  signature = { enabled = true },
}

vim.api.nvim_create_autocmd('ColorScheme', {
  pattern = '*',
  callback = function()
    local set_link = function(blink_group, theme_group)
      -- force = true will overwrite whatever Telescope's selected theme tries to inject
      vim.api.nvim_set_hl(0, blink_group, { link = theme_group, force = true })
    end

    -- Functions and Methods
    set_link('BlinkCmpKindFunction', 'Function')
    set_link('BlinkCmpKindMethod', 'Function')

    -- Objects, Classes, and Structs
    set_link('BlinkCmpKindClass', 'Type')
    set_link('BlinkCmpKindStruct', 'Type')
    set_link('BlinkCmpKindModule', 'Structure')

    -- Snippets
    set_link('BlinkCmpKindSnippet', 'Special')

    -- Variables and Fields
    set_link('BlinkCmpKindVariable', 'Identifier')
    set_link('BlinkCmpKindField', 'Identifier')
  end,
})
