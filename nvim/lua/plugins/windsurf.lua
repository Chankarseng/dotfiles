vim.pack.add { 'https://github.com/monkoose/neocodeium' }
local neocodeium = require 'neocodeium'
vim.keymap.set('i', '<Leader><Tab>', function() neocodeium.accept() end, { desc = 'NeoCodeium Accept' })
vim.keymap.set('i', '<M-[>', function() neocodeium.cycle_or_complete(-1) end, { desc = 'NeoCodeium Previous' })
vim.keymap.set('i', '<M-]>', function() neocodeium.cycle_or_complete(1) end, { desc = 'NeoCodeium Next' })
neocodeium.setup()
