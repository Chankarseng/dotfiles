vim.pack.add {
  { src = 'https://github.com/nvim-neo-tree/neo-tree.nvim', version = vim.version.range '*' },
  'https://github.com/nvim-lua/plenary.nvim',
  'https://github.com/MunifTanjim/nui.nvim',
}

vim.keymap.set('n', '\\', '<Cmd>Neotree reveal<CR>', { desc = 'NeoTree reveal', silent = true })
vim.keymap.set('n', '<C-b>', '<Cmd>Neotree toggle<CR>', { noremap = true, silent = true })

require('neo-tree').setup {

  window = {
    position = 'right',
  },
  filesystem = {
    filtered_items = {
      visible = false,
      show_hidden_count = true,
      hide_dotfiles = false,
      hide_gitignored = false,
      hide_by_name = {
        '.git',
        '.DS_Store',
        'thumbs.db',
      },
      never_show = {},
    },
    window = {
      mappings = {
        ['\\'] = 'close_window',
      },
      {
        follow_current_file = {
          enabled = true,
        },
      },
    },
  },
}
