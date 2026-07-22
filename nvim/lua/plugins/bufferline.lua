-- Buffer line (tabs)
vim.pack.add { 'https://github.com/akinsho/bufferline.nvim' }
local bufferline = require 'bufferline'
bufferline.setup {}
vim.keymap.set('n', '<tab>', '<Cmd>bnext<Cr>', { desc = 'Next Tab' })
vim.keymap.set('n', '<S-tab>', '<Cmd>bprev<Cr>', { desc = 'Previous Tab' })
vim.keymap.set('n', '<leader>x', '<Cmd>bdelete<Cr>', { desc = 'Delete current buffer' })
vim.keymap.set('n', '<leader>b', '<Cmd>enew<Cr>', { desc = 'Create new buffer' })
