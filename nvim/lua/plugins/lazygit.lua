vim.pack.add { 'https://github.com/kdheepak/lazygit.nvim', 'https://github.com/nvim-telescope/telescope.nvim' }
vim.keymap.set({ 'n', 't' }, '<leader>lg', ':LazyGit<CR>', { silent = true, desc = 'Toggle LazyGit' })
