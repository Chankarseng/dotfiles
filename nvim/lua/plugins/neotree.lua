vim.api.nvim_create_autocmd("WinEnter", {
  group = vim.api.nvim_create_augroup("NeoTreeCwd", { clear = true }),
  desc = "Restore cwd to Neo-tree root",
  callback = function()
    local ok, state = pcall(require, "neo-tree.sources.manager")
    if ok then
      state = state.get_state("filesystem")
      if state and state.path then
        local cwd = vim.uv.cwd()
        if cwd ~= state.path then
          vim.uv.chdir(state.path)
          vim.fn.chdir(state.path)
        end
      end
    end
  end,
})

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
    follow_current_file = {
      enabled = true,
    },
    bind_to_cwd = false,
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
        ['.'] = function(state)
          state.commands.set_root(state)
          local target = state.path
          if target then
            vim.uv.chdir(target)
            vim.fn.chdir(target)
          end
        end,
        ['\\'] = 'close_window',
      },
    },
  },
}
