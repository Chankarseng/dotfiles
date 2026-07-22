-- Undo history visualizer
vim.pack.add { 'https://github.com/mbbill/undotree' }
vim.keymap.set({ 'n', 'v' }, '<leader>ut', vim.cmd.UndotreeToggle)
